
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.ValidationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.CurriculaRepository;
import repositories.RookyRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Actor;
import domain.CreditCard;
import domain.Curricula;
import domain.Finder;
import domain.Rooky;
import forms.ActorForm;

@Service
@Transactional
public class HackerService {

	@Autowired
	private RookyRepository	hackerRepository;

	@Autowired
	private ActorService		actorService;

	@Autowired
	private FinderService		finderService;

	@Autowired
	private UserAccountService	userAccountService;

	@Autowired
	private CurriculaService	curriculaService;

	@Autowired
	private CurriculaRepository	curriculaRepository;

	@Autowired
	private Validator			validator;


	public Rooky create() {
		final Rooky hacker = new Rooky();
		this.actorService.setAuthorityUserAccount(Authority.HACKER, hacker);

		return hacker;
	}

	public Rooky findOne(final int hackerId) {
		Assert.isTrue(hackerId != 0);
		final Rooky result = this.hackerRepository.findOne(hackerId);
		Assert.notNull(result);
		return result;
	}

	public Rooky save(final Rooky hacker) {
		Assert.notNull(hacker);
		Rooky result;

		if (hacker.getId() == 0) {
			final Finder finder = this.finderService.createForNewHacker();
			hacker.setFinder(finder);
			this.actorService.setAuthorityUserAccount(Authority.HACKER, hacker);
			result = this.hackerRepository.save(hacker);
			//			this.folderService.setFoldersByDefault(result);

			final Curricula curricula = this.curriculaService.createForNewHacker();
			curricula.setHacker(result);
			final Curricula res = this.curriculaRepository.save(curricula);
			Assert.notNull(res);

		} else {
			this.actorService.checkForSpamWords(hacker);
			final Actor principal = this.actorService.findByPrincipal();
			Assert.isTrue(principal.getId() == hacker.getId(), "You only can edit your info");
			result = (Rooky) this.actorService.save(hacker);
		}
		return result;
	}

	// TODO: delete all information but name including folders and their messages (but no as senders!!)
	public void delete(final Rooky hacker) {
		Assert.notNull(hacker);
		Assert.isTrue(this.findByPrincipal().equals(hacker));
		Assert.isTrue(hacker.getId() != 0);
		final Actor principal = this.actorService.findByPrincipal();
		Assert.isTrue(principal.getId() == hacker.getId(), "You only can edit your info");
		Assert.isTrue(this.hackerRepository.exists(hacker.getId()));
		this.hackerRepository.delete(hacker);
	}

	public void deletePersonalData() {
		final Rooky principal = this.findByPrincipal();
		this.finderService.clear(this.finderService.findHackerFinder());
		final List<String> s = new ArrayList<>();
		s.add("DELETED");
		principal.setAddress(null);
		principal.setEmail("DELETED@mail.de");
		principal.setSurname(s);
		//principal.setName("");
		principal.setPhone(null);
		principal.setPhoto(null);
		principal.setSpammer(false);
		principal.setVat(0.0);
		final Authority ban = new Authority();
		ban.setAuthority(Authority.BANNED);
		principal.getUserAccount().getAuthorities().add(ban);
		this.hackerRepository.save(principal);
	}

	/* ========================= OTHER METHODS =========================== */

	public Rooky findByPrincipal() {
		final UserAccount user = LoginService.getPrincipal();
		Assert.notNull(user);

		final Rooky hacker = this.findByUserId(user.getId());
		Assert.notNull(hacker);
		final boolean bool = this.actorService.checkAuthority(hacker, Authority.HACKER);
		Assert.isTrue(bool);

		return hacker;
	}

	public Rooky findByUserId(final int id) {
		Assert.isTrue(id != 0);
		final Rooky hacker = this.hackerRepository.findByUserId(id);
		return hacker;
	}

	/**
	 * The average, minimum, maximum and standard deviation of the number of applications per hacker
	 * 
	 * @author a8081
	 */
	public Double[] getStatisticsOfApplicationsPerHacker() {
		final Double[] res = this.hackerRepository.getStatisticsOfApplicationsPerHacker();
		Assert.notNull(res);
		return res;
	}

	/**
	 * Hackers who have made more applications
	 * 
	 * @author a8081
	 */
	public Collection<Rooky> getHackersMoreApplications() {
		final Collection<Rooky> res = this.hackerRepository.getHackersMoreApplications();
		Assert.notNull(res);
		return res;
	}

	public void flush() {
		this.hackerRepository.flush();
	}

	public Rooky reconstruct(final ActorForm actorForm, final BindingResult binding) {
		Rooky hacker;
		final CreditCard c = new CreditCard();
		c.setHolderName(actorForm.getHolderName());
		final String cardNumber = actorForm.getNumber().replace(" ", "");
		c.setNumber(cardNumber);
		c.setMake(actorForm.getMake());
		c.setExpirationMonth(actorForm.getExpirationMonth());
		c.setExpirationYear(actorForm.getExpirationYear());
		c.setCvv(actorForm.getCvv());

		if (actorForm.getId() == 0) {
			hacker = this.create();
			hacker.setName(actorForm.getName());
			hacker.setSurname(actorForm.getSurname());
			hacker.setPhoto(actorForm.getPhoto());
			hacker.setPhone(actorForm.getPhone());
			hacker.setEmail(actorForm.getEmail());
			hacker.setAddress(actorForm.getAddress());
			hacker.setVat(actorForm.getVat());
			hacker.setVersion(actorForm.getVersion());
			//			hacker.setScore(0.0);
			//			hacker.setSpammer(false);
			final UserAccount account = this.userAccountService.create();
			final Collection<Authority> authorities = new ArrayList<>();
			final Authority auth = new Authority();
			auth.setAuthority(Authority.HACKER);
			authorities.add(auth);
			account.setAuthorities(authorities);
			account.setUsername(actorForm.getUserAccountuser());
			account.setPassword(actorForm.getUserAccountpassword());
			hacker.setUserAccount(account);
		} else {
			hacker = this.hackerRepository.findOne(actorForm.getId());
			hacker.setName(actorForm.getName());
			hacker.setSurname(actorForm.getSurname());
			hacker.setPhoto(actorForm.getPhoto());
			hacker.setPhone(actorForm.getPhone());
			hacker.setEmail(actorForm.getEmail());
			hacker.setAddress(actorForm.getAddress());
			hacker.setVat(actorForm.getVat());
			hacker.setVersion(actorForm.getVersion());
			final UserAccount account = this.userAccountService.findOne(hacker.getUserAccount().getId());
			account.setUsername(actorForm.getUserAccountuser());
			account.setPassword(actorForm.getUserAccountpassword());
			hacker.setUserAccount(account);
		}

		hacker.setCreditCard(c);

		this.validator.validate(hacker, binding);
		if (binding.hasErrors())
			throw new ValidationException();

		return hacker;
	}

	public Rooky findHackerByCurricula(final int id) {
		final Rooky result = this.hackerRepository.findHackerByCurricula(id);
		return result;
	}

	public Rooky findHackerByPersonalData(final int id) {
		final Rooky result = this.hackerRepository.findHackerByPersonalData(id);
		return result;
	}

	public Rooky findHackerByMiscellaneous(final int id) {
		final Rooky result = this.hackerRepository.findHackerByMiscellaneous(id);
		return result;
	}

	public Rooky findHackerByEducationDatas(final int id) {
		final Rooky result = this.hackerRepository.findHackerByEducationDatas(id);
		return result;
	}

	public Rooky findHackerByPositionDatas(final int id) {
		final Rooky result = this.hackerRepository.findHackerByPositionDatas(id);
		return result;
	}

	public Boolean hasPersonalData(final int hackerId, final int dataId) {
		final Boolean result = this.hackerRepository.hasPersonalData(hackerId, dataId);
		Assert.notNull(result, "hasPersonalData returns null");
		return result;
	}

	public Boolean hasEducationData(final int hackerId, final int dataId) {
		final Boolean result = this.hackerRepository.hasEducationData(hackerId, dataId);
		Assert.notNull(result, "hasEducationData returns null");
		return result;
	}

	public Boolean hasPositionData(final int hackerId, final int dataId) {
		final Boolean result = this.hackerRepository.hasPositionData(hackerId, dataId);
		Assert.notNull(result, "hasPositionData returns null");
		return result;
	}

	public Boolean hasMiscellaneousData(final int hackerId, final int dataId) {
		final Boolean result = this.hackerRepository.hasMiscellaneousData(hackerId, dataId);
		Assert.notNull(result, "hasMiscellanousData returns null");
		return result;
	}

	public Boolean hasCurricula(final int hackerId, final int dataId) {
		final Boolean result = this.hackerRepository.hasCurricula(hackerId, dataId);
		Assert.notNull(result, "hasCurricula returns null");
		return result;
	}

	public Rooky findHackerByCopyCurricula(final int id) {
		final Rooky result = this.hackerRepository.findHackerByCopyCurricula(id);
		Assert.notNull(result, "hacker found by copy of curricula is null");
		return result;
	}

}
