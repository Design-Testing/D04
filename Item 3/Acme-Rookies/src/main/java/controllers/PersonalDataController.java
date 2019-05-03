
package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import security.Authority;
import security.LoginService;
import security.UserAccount;
import services.CompanyService;
import services.ConfigurationParametersService;
import services.CurriculaService;
import services.HackerService;
import services.PersonalDataService;
import domain.Company;
import domain.Curricula;
import domain.Rooky;
import domain.PersonalData;

@Controller
@RequestMapping("/personalData")
public class PersonalDataController extends AbstractController {

	@Autowired
	private PersonalDataService				personalDataService;

	@Autowired
	private HackerService					hackerService;

	@Autowired
	private CurriculaService				curriculaService;

	@Autowired
	private ConfigurationParametersService	configurationParametersService;

	@Autowired
	private CompanyService					companyService;


	/*
	 * @RequestMapping(value = "/create", method = RequestMethod.GET)
	 * public ModelAndView create() {
	 * ModelAndView result;
	 * final PersonalData personalData = this.personalDataService.create();
	 * result = this.createEditModelAndView(personalData);
	 * return result;
	 * }
	 */

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int personalDataId) {
		ModelAndView result;
		try {
			final PersonalData personalData;
			final Rooky hacker = this.hackerService.findByPrincipal();
			personalData = this.personalDataService.findOne(personalDataId);
			Assert.isTrue(this.hackerService.hasPersonalData(hacker.getId(), personalDataId), "This personal data is not of your property");

			result = this.createEditModelAndView(personalData);
		} catch (final Exception e) {
			result = new ModelAndView("administrator/error");
			result.addObject("trace", e.getMessage());
		}

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final PersonalData personalData, final BindingResult bindingResult) {
		ModelAndView result;
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(personalData);
		else
			try {
				this.personalDataService.save(personalData);

				final Curricula curricula = this.curriculaService.findCurriculaByPersonalData(personalData.getId());

				result = new ModelAndView("curricula/display");
				result.addObject("curricula", curricula);
				result.addObject("curriculaId", curricula.getId());
				result.addObject("messages", null);
				result.addObject("buttons", false);

			} catch (final Throwable oops) {
				result = this.createEditModelAndView(personalData, "general.commit.error");
			}

		return result;
	}
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int personalDataId) {

		ModelAndView res;

		final PersonalData personalData = this.personalDataService.findOne(personalDataId);
		final Curricula curricula = this.curriculaService.findCurriculaByPersonalData(personalDataId);

		if (personalData != null) {

			res = new ModelAndView("personalData/display");
			res.addObject("personalData", personalData);
			res.addObject("buttons", false);
			res.addObject("curriculaId", curricula.getId());

			final UserAccount logged = LoginService.getPrincipal();

			final Authority authHacker = new Authority();
			authHacker.setAuthority(Authority.HACKER);
			final Authority authCompany = new Authority();
			authCompany.setAuthority(Authority.COMPANY);
			if (logged.getAuthorities().contains(authHacker)) {
				final Rooky hacker = this.hackerService.findByPrincipal();
				if (curricula.getHacker() != null)
					Assert.isTrue(curricula.getHacker().equals(hacker));
				else if (curricula.getHacker() == null)
					Assert.isTrue(this.hackerService.findHackerByCopyCurricula(curricula.getId()).equals(hacker));
			} else if (logged.getAuthorities().contains(authCompany)) {
				final Company company = this.companyService.findByPrincipal();
				Assert.isTrue(this.curriculaService.findCurriculasByCompany(company.getId()).contains(curricula));
			}

		} else
			res = new ModelAndView("redirect:misc/403");

		return res;

	}

	protected ModelAndView createEditModelAndView(final PersonalData personalData) {
		ModelAndView result;
		result = this.createEditModelAndView(personalData, null);
		return result;
	}
	// Edition ---------------------------------------------------------

	protected ModelAndView createEditModelAndView(final PersonalData personalData, final String message) {
		ModelAndView result;

		result = new ModelAndView("personalData/edit");
		result.addObject("personalData", personalData);
		result.addObject("message", message);
		if (personalData.getId() != 0)
			result.addObject("curriculaId", this.curriculaService.findCurriculaByPersonalData(personalData.getId()).getId());
		result.addObject("countryPhoneCode", this.configurationParametersService.find().getCountryPhoneCode());
		return result;

	}
}
