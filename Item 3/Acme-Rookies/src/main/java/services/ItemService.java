
package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.ItemRepository;
import domain.Item;
import domain.Provider;

@Service
@Transactional
public class ItemService {

	@Autowired
	private ItemRepository	itemRepository;

	@Autowired
	private ProviderService	providerService;


	public Item create(final int itemId) {
		final Item item = new Item();

		return item;
	}

	public Collection<Item> findAll() {
		Collection<Item> res = new ArrayList<>();
		res = this.itemRepository.findAll();
		Assert.notNull(res);
		return res;
	}

	public Item findOne(final int itemId) {
		Assert.isTrue(itemId != 0);
		final Item res = this.itemRepository.findOne(itemId);
		Assert.notNull(res);
		return res;
	}

	public Item save(final Item item) {
		Assert.notNull(item);
		final Provider principal = this.providerService.findByPrincipal();
		final Item result;

		if (item.getId() != 0)
			Assert.isTrue(principal.equals(item.getProvider()), "No puede actualizar un item que no le pertenece.");
		else
			item.setProvider(principal);
		result = this.itemRepository.save(item);
		return result;
	}
	public void delete(final Item item) {
		Assert.notNull(item);
		Assert.isTrue(item.getId() != 0);
		Assert.isTrue(this.itemRepository.exists(item.getId()));
		this.itemRepository.delete(item);
	}

	/* ========================= OTHER METHODS =========================== */

	public void flush() {
		this.itemRepository.flush();
	}

	public Collection<Item> findAllByProvider() {
		Collection<Item> res;
		res = this.itemRepository.findAllByProvider(this.providerService.findByPrincipal().getUserAccount().getId());
		return res;
	}

}
