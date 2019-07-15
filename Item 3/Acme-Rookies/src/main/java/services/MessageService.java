
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.MessageRepository;
import domain.Actor;
import domain.Administrator;
import domain.Folder;
import domain.Message;
import domain.Provider;
import domain.Sponsorship;

@Service
@Transactional
public class MessageService {

	@Autowired
	private MessageRepository				messageRepository;

	@Autowired
	private ActorService					actorService;

	@Autowired
	private FolderService					folderService;

	@Autowired
	private AdministratorService			administratorService;

	@Autowired
	private ConfigurationParametersService	configurationParametersService;


	public Message create() {
		final Message message = new Message();
		final Collection<String> tags = new ArrayList<>();
		message.setTags(tags);
		final Actor principal = this.actorService.findByPrincipal();
		message.setSender(principal);

		return message;
	}

	public Collection<Message> findAll() {
		final Actor principal = this.actorService.findByPrincipal();
		final Collection<Message> res = this.messageRepository.findAllByUserId(principal.getUserAccount().getId());
		Assert.notNull(res);

		return res;
	}

	public Message findOne(final int id) {
		final Message res = this.messageRepository.findOne(id);

		return res;
	}

	/**
	 * It gets all actor messages to iterate them in computeScore method. The scope of this method is limited to the package only (default), and it's only available to administrators.
	 * 
	 * @param a
	 *            Actor whose messages will be return
	 * @author a8081
	 * */
	Collection<Message> findActorMessages(final Actor a) {
		this.administratorService.findByPrincipal();
		return this.messageRepository.findAllByUserId(a.getUserAccount().getId());
	}

	public Collection<Message> findAllByFolderIdAndUserId(final int folderId, final int userAccountId) {
		Assert.isTrue(folderId != 0);
		Assert.isTrue(userAccountId != 0);

		return this.messageRepository.findAllByFolderIdAndUserId(folderId, userAccountId);
	}

	public Message save(final Message m) {
		Assert.notNull(m);
		m.setMoment(new Date(System.currentTimeMillis() - 100));
		return this.messageRepository.save(m);
	}

	/**
	 * This method send a message to the recipients specified as an attribute in Message Object. It check if message contains spam words to send it to recipient inbox or spambox.
	 * 
	 * @param m
	 *            Message that is going to be sent
	 * 
	 * @author a8081
	 * */
	public Message send(final Message m) {
		Assert.notNull(m);

		final Actor sender = this.actorService.findByPrincipal();
		final Folder outbox = this.folderService.findOutboxByUserId(sender.getUserAccount().getId());
		final Collection<Message> outboxMessages = outbox.getMessages();

		//== Create method set the sender ==
		//final Actor sender = this.actorService.findByPrincipal();
		m.setSender(sender);
		final Date moment = new Date(System.currentTimeMillis() - 1000);
		m.setMoment(moment);

		final boolean containsSpamWords = this.checkForSpamWords(m);

		final Collection<Actor> recipients = m.getRecipients();
		Folder notification;
		Folder spambox;

		final Message sent = this.save(m);

		outboxMessages.add(sent);
		outbox.setMessages(outboxMessages);

		if (containsSpamWords) {
			sender.setSpammer(true);
			this.actorService.save(sender);

			for (final Actor r : recipients) {
				spambox = this.folderService.findSpamboxByUserId(r.getUserAccount().getId());
				final Collection<Message> spamMessages = spambox.getMessages();
				spamMessages.add(sent);
				spambox.setMessages(spamMessages);
				this.folderService.save(spambox, r);
			}
		} else
			for (final Actor r : recipients) {
				notification = this.folderService.findNotificationboxByUserId(r.getUserAccount().getId());
				final Collection<Message> notificationMessages = notification.getMessages();
				notificationMessages.add(sent);
				notification.setMessages(notificationMessages);
				this.folderService.save(notification, r);
			}

		return sent;
	}

	public void broadcast(final Message m) {
		Assert.notNull(m);
		this.administratorService.findByPrincipal();

		final Collection<Actor> actors = this.actorService.findAllNotBanned();
		final Actor actor = this.actorService.findByPrincipal();
		actors.remove(this.administratorService.findSystem());
		actors.remove(actor);
		m.setRecipients(actors);
		this.send(m);
	}

	public boolean checkForSpamWords(final Message m) {
		final String body = m.getBody().toLowerCase();
		final String subject = m.getSubject().toLowerCase();
		final Collection<String> strings = new ArrayList<>();
		strings.add(subject);
		strings.add(body);

		return this.configurationParametersService.checkForSpamWords(strings);
	}

	/**
	 * Remove a message from a given folder
	 * 
	 * @param message
	 *            Message to delete
	 * @param folder
	 *            Folder where message is going to be removed
	 * 
	 * @author a8081
	 * */
	public void deleteFromFolder(final Message message, final Folder folder) {
		Assert.notNull(message);
		Assert.isTrue(message.getId() != 0);
		Assert.isTrue(folder.getMessages().contains(message));

		final Actor principal = this.actorService.findByPrincipal();
		final Folder trash = this.folderService.findTrashboxByUserId(principal.getUserAccount().getId());

		final Collection<Message> folderMessages = this.findAllByFolderIdAndUserId(folder.getId(), principal.getUserAccount().getId());
		final Collection<Message> trashMessages = this.findAllByFolderIdAndUserId(trash.getId(), principal.getUserAccount().getId());
		final Collection<Folder> principalFolders = this.folderService.findAllByMessageIdAndUserId(principal.getUserAccount().getId(), message.getId());

		final boolean isTrashBox = (folder.getId() == trash.getId());

		if (isTrashBox) {
			trashMessages.remove(message);
			trash.setMessages(trashMessages);

			for (final Folder i : principalFolders) {
				final Collection<Message> ims = i.getMessages();
				ims.remove(message);
				i.setMessages(ims);
				this.folderService.save(i, principal);
			}

			this.folderService.save(trash, principal);

			// If message only belongs to principal actor, we're going to remove it from DB
			if (this.actorService.countByMessageId(message.getId()) == 0)
				this.messageRepository.delete(message);

		} else {
			folderMessages.remove(message);
			folder.setMessages(folderMessages);
			trashMessages.add(message);
			trash.setMessages(trashMessages);
			this.folderService.save(trash, principal);
			this.folderService.save(folder, principal);
		}
	}

	/**
	 * DeleteAll method is necessary to delete all message when a folder is removed
	 * 
	 * @param ms
	 *            All message you want to be removed from the folder
	 * @param f
	 *            Folder which messages belongs
	 * @author a8081
	 * */
	public void deleteAll(final Collection<Message> ms, final Folder f) {
		Assert.notEmpty(ms);
		for (final Message m : ms)
			this.deleteFromFolder(m, f);
	}

	/**
	 * Copy a message to another folder
	 * 
	 * @param m
	 *            Message to copy
	 * @param f
	 *            Folder where the message is going to be moved
	 * 
	 * @author a8081
	 * */
	public Message copyToFolder(final Message m, final Folder f) {
		Assert.notNull(m);
		Assert.notNull(f);
		Assert.isTrue(m.getId() != 0);
		Assert.isTrue(f.getId() != 0);

		final Actor principal = this.actorService.findByPrincipal();
		final Collection<Message> ms = this.findAllByFolderIdAndUserId(f.getId(), principal.getUserAccount().getId());

		ms.add(m);
		f.setMessages(ms);
		this.folderService.save(f, principal);

		return m;
	}

	/**
	 * This method moves a message from folder a to folder b
	 * 
	 * @param a
	 *            Origin folder
	 * @param b
	 *            Destination folder
	 * @param m
	 *            Message to move
	 * 
	 * @author a8081
	 * */
	public void moveFromAToB(final Message m, final Folder a, final Folder b) {
		Assert.notNull(m);
		Assert.notNull(a);
		Assert.notNull(b);
		Assert.isTrue(m.getId() != 0);
		Assert.isTrue(a.getId() != 0);
		Assert.isTrue(b.getId() != 0);

		final Actor principal = this.actorService.findByPrincipal();
		final Collection<Message> bms = this.findAllByFolderIdAndUserId(b.getId(), principal.getUserAccount().getId());
		final Collection<Message> ams = this.findAllByFolderIdAndUserId(a.getId(), principal.getUserAccount().getId());

		ams.remove(m);
		a.setMessages(ams);
		bms.add(m);
		b.setMessages(bms);
		this.folderService.save(b, principal);
		this.folderService.save(a, principal);
	}

	public void dataBreachMessage() {
		final Administrator actor = this.administratorService.findByPrincipal();
		final Message m = new Message();
		final Collection<String> tags = new ArrayList<>();
		m.setTags(tags);
		final Administrator sender = this.administratorService.findSystem();

		m.setSubject("Data breach - Brecha de datos");
		m.setBody("There's been a data breach in our system. Due to GDPR we have to notify you.\n" + "Se ha producido una brecha de datos en nuestro sistema. Debido a la GDPR tenemos que notificarles.");
		m.setPriority("HIGH");
		m.setSender(sender);

		final Collection<Actor> actors = this.actorService.findAllNotBanned();
		actors.remove(this.administratorService.findSystem());
		actors.remove(actor);
		m.setRecipients(actors);

		final Folder outbox = this.folderService.findOutboxByUserId(sender.getUserAccount().getId());
		final Collection<Message> outboxMessages = outbox.getMessages();
		final Date moment = new Date(System.currentTimeMillis() - 1000);
		m.setMoment(moment);
		Folder notificationBox;
		final Message sent = this.save(m);

		outboxMessages.add(sent);
		outbox.setMessages(outboxMessages);

		for (final Actor r : actors) {
			notificationBox = this.folderService.findNotificationboxByUserId(r.getUserAccount().getId());
			final Collection<Message> inboxMessages = notificationBox.getMessages();
			inboxMessages.add(sent);
			notificationBox.setMessages(inboxMessages);
			this.folderService.save(notificationBox, r);
		}
	}

	public void sponsorshipDisplayedMessage(final Sponsorship sp) {
		final Message m = new Message();
		final Collection<String> tags = new ArrayList<>();
		m.setTags(tags);
		final Administrator sender = this.administratorService.findSystem();
		final Provider provider = sp.getProvider();
		final double flatFare = this.configurationParametersService.find().getFlatFare();
		final double vat = this.configurationParametersService.find().getVat();

		m.setSubject("Sponsorship of " + sp.getPosition().getTitle() + ": " + sp.getPosition().getTicker() + " displayed.\n" + "Patrocinio de " + sp.getPosition().getTitle() + ": " + sp.getPosition().getTicker() + " mostrado.");
		m.setBody("System charge you a flat fare of " + flatFare + " (+" + flatFare * vat + " VAT).\n" + "El sistema le carga una tarifa plana de " + flatFare + " (+" + flatFare * vat + " IVA).");
		m.setPriority("HIGH");
		m.setSender(sender);

		final Collection<Actor> recipients = new ArrayList<>();
		recipients.add(provider);
		m.setRecipients(recipients);

		final Folder outbox = this.folderService.findOutboxByUserId(sender.getUserAccount().getId());
		final Collection<Message> outboxMessages = outbox.getMessages();
		final Date moment = new Date(System.currentTimeMillis() - 1000);
		m.setMoment(moment);
		Folder inbox;
		final Message sent = this.save(m);

		outboxMessages.add(sent);
		outbox.setMessages(outboxMessages);

		for (final Actor r : recipients) {
			inbox = this.folderService.findInboxByUserId(r.getUserAccount().getId());
			final Collection<Message> inboxMessages = inbox.getMessages();
			inboxMessages.add(sent);
			inbox.setMessages(inboxMessages);
			this.folderService.save(inbox, r);
		}
	}

	public void rebrandNotification(final String lastBrand) {
		final Administrator actor = this.administratorService.findByPrincipal();
		final Message m = new Message();
		final Collection<String> tags = new ArrayList<>();
		m.setTags(tags);
		final Administrator sender = this.administratorService.findSystem();
		final String sysName = this.configurationParametersService.findSysName();

		m.setSubject("Rebranding - Renombramiento");
		m.setBody("The system brand has been modified. " + lastBrand + " rebrand to " + sysName + ". \n" + "La marca del sistema se ha modificado. " + lastBrand + " renombrado a " + sysName + ".");
		m.setPriority("HIGH");
		m.setSender(sender);

		final Collection<Actor> actors = this.actorService.findAllNotBanned();
		actors.remove(this.administratorService.findSystem());
		actors.remove(actor);
		m.setRecipients(actors);

		final Folder outbox = this.folderService.findOutboxByUserId(sender.getUserAccount().getId());
		final Collection<Message> outboxMessages = outbox.getMessages();
		final Date moment = new Date(System.currentTimeMillis() - 1000);
		m.setMoment(moment);
		Folder notificationBox;
		final Message sent = this.save(m);

		outboxMessages.add(sent);
		outbox.setMessages(outboxMessages);

		for (final Actor r : actors) {
			notificationBox = this.folderService.findNotificationboxByUserId(r.getUserAccount().getId());
			final Collection<Message> inboxMessages = notificationBox.getMessages();
			inboxMessages.add(sent);
			notificationBox.setMessages(inboxMessages);
			this.folderService.save(notificationBox, r);
		}
	}

	public void rebrandNotification() {
		final Administrator actor = this.administratorService.findByPrincipal();
		final Message m = new Message();
		final Collection<String> tags = new ArrayList<>();
		m.setTags(tags);
		final Administrator sender = this.administratorService.findSystem();
		final String sysName = this.configurationParametersService.findSysName();

		m.setSubject("Rebranding - Renombramiento");
		m.setBody("The system brand has been modified. The new brand is " + sysName + ". \n" + "La marca del sistema se ha modificado. La nueva marca es " + sysName + ".");
		m.setPriority("HIGH");
		m.setSender(sender);

		final Collection<Actor> actors = this.actorService.findAllNotBanned();
		actors.remove(this.administratorService.findSystem());
		actors.remove(actor);
		m.setRecipients(actors);

		final Folder outbox = this.folderService.findOutboxByUserId(sender.getUserAccount().getId());
		final Collection<Message> outboxMessages = outbox.getMessages();
		final Date moment = new Date(System.currentTimeMillis() - 1000);
		m.setMoment(moment);
		Folder notificationBox;
		final Message sent = this.save(m);

		outboxMessages.add(sent);
		outbox.setMessages(outboxMessages);

		for (final Actor r : actors) {
			notificationBox = this.folderService.findNotificationboxByUserId(r.getUserAccount().getId());
			final Collection<Message> inboxMessages = notificationBox.getMessages();
			inboxMessages.add(sent);
			notificationBox.setMessages(inboxMessages);
			this.folderService.save(notificationBox, r);
		}
	}

}
