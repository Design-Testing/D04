
package controllers.provider;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ItemService;
import services.ProviderService;
import controllers.AbstractController;
import domain.Item;

@Controller
@RequestMapping("/item/provider")
public class ItemProviderController extends AbstractController {

	@Autowired
	private ItemService		itemService;

	@Autowired
	private ProviderService	providerService;

	final String			lang	= LocaleContextHolder.getLocale().getLanguage();


	// =================LIST=================

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Item> items;

		items = this.itemService.findAllByProvider();
		result = new ModelAndView("item/list");
		result.addObject("items", items);
		result.addObject("lang", this.lang);
		result.addObject("requestURI", "/item/provider/list.do");
		return result;

	}

	// =================CREATE=================

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int paradeId) {
		final ModelAndView result;
		Item item;
		Parade parade;

		parade = this.paradeService.findOne(paradeId);

		item = this.itemService.create();
		result = this.createEditModelAndView(item);
		result.addObject("parade", parade);

		return result;
	}

	// =================EDIT=================

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int itemId) {
		ModelAndView result;
		final Item item;

		item = this.itemService.findOne(itemId);

		if (item != null) {
			final Collection<Item> ss = this.itemService.findAllByProvider();
			if (ss.contains(item))
				result = this.createEditModelAndView(item);
			else
				result = new ModelAndView("redirect:/misc/403.jsp");
		} else
			result = new ModelAndView("redirect:/misc/403.jsp");

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid @ModelAttribute("item") final ItemForm itemForm, final BindingResult binding) {
		ModelAndView result;
		Item item;

		try {
			item = this.itemService.reconstruct(itemForm, binding);
			this.itemService.save(item);
			result = new ModelAndView("redirect:list.do");
		} catch (final ValidationException oops) {
			result = this.createEditModelAndView(itemForm);
		} catch (final Throwable oops) {
			String errorMessage = "item.commit.error";
			if (oops.getMessage().contains("message.error"))
				errorMessage = oops.getMessage();
			result = this.createEditModelAndView(itemForm, errorMessage);
		}
		return result;
	}

	// =================REACTIVATE=================

	@RequestMapping(value = "/reactivate", method = RequestMethod.GET)
	public ModelAndView activate(@RequestParam final int itemId) {
		ModelAndView result;
		final Item item;

		item = this.itemService.findOne(itemId);

		try {
			this.itemService.reactivate(itemId);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			result = this.createEditModelAndView(item, "item.commit.error");
		}
		return result;
	}

	// =================DEACTIVATE=================

	@RequestMapping(value = "/deactivate", method = RequestMethod.GET)
	public ModelAndView deactivate(@RequestParam final int itemId) {
		ModelAndView result;
		final Item item;

		item = this.itemService.findOne(itemId);

		try {
			this.itemService.deactivate(itemId);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			result = this.createEditModelAndView(item, "item.commit.error");
		}
		return result;
	}

	// =================DISPLAY=================

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int paradeId) {
		final ModelAndView result;
		Item item;
		final Provider provider = this.providerService.findByPrincipal();

		item = this.itemService.findByParade(paradeId, provider.getUserAccount().getId());

		if (item != null) {
			result = new ModelAndView("item/display");
			result.addObject("item", item);
		} else
			result = new ModelAndView("redirect:/misc/403.jsp");

		return result;
	}

	@RequestMapping(value = "/displayItem", method = RequestMethod.GET)
	public ModelAndView displayItem(@RequestParam final int itemId) {
		final ModelAndView result;
		Item item;

		item = this.itemService.findOneItem(itemId);

		if (item != null) {
			result = new ModelAndView("item/display");
			result.addObject("item", item);
		} else
			result = new ModelAndView("redirect:/misc/403.jsp");

		return result;
	}

	//ANCILLIARY METHODS

	protected ModelAndView createEditModelAndView(final ItemForm item) {
		ModelAndView result;

		result = this.createEditModelAndView(item, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final ItemForm item, final String messageCode) {
		final ModelAndView result;

		final Collection<Parade> parades = this.paradeService.paradesAvailableProvider();

		result = new ModelAndView("item/edit");
		result.addObject("item", item);
		result.addObject("parades", parades);
		//result.addObject("requestURI", "/item/provider/edit.do?itemId=" + item.getId());
		result.addObject("message", messageCode);
		result.addObject("makes", this.configurationParametersService.find().getCreditCardMake());
		return result;
	}

	protected ModelAndView createEditModelAndView(final Item item) {
		ModelAndView result;

		result = this.createEditModelAndView(item, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Item item, final String messageCode) {
		final ModelAndView result;
		ItemForm itemForm;

		if (item.getId() == 0)
			itemForm = new ItemForm();
		else
			itemForm = this.itemService.inyect(item);

		final Collection<Parade> parades = this.paradeService.paradesAvailableProvider();

		result = new ModelAndView("item/edit");
		result.addObject("item", itemForm);
		result.addObject("parades", parades);
		//result.addObject("requestURI", "/item/provider/edit.do?itemId=" + item.getId());
		result.addObject("makes", this.configurationParametersService.find().getCreditCardMake());
		result.addObject("message", messageCode);
		return result;
	}
}
