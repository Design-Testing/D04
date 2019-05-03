
package controllers;

import java.util.Collection;

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
import services.CurriculaService;
import domain.Company;
import domain.Curricula;
import domain.EducationData;
import domain.MiscellaneousData;
import domain.PersonalData;
import domain.PositionData;
import domain.Rooky;

@Controller
@RequestMapping("/curricula")
public class CurriculaController extends AbstractController {

	@Autowired
	private CurriculaService	curriculaService;

	@Autowired
	private HackerService		hackerService;

	@Autowired
	private CompanyService		companyService;


	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam final int curriculaId) {
		final ModelAndView res;

		final Curricula curricula = this.curriculaService.findOne(curriculaId);

		if (!(curricula == null)) {
			final PersonalData personalData = curricula.getPersonalRecord();
			final Collection<EducationData> educationDatas = curricula.getEducations();
			final Collection<PositionData> positionDatas = curricula.getPositions();
			final Collection<MiscellaneousData> miscellaneousRecords = curricula.getMiscellaneous();

			res = new ModelAndView("curricula/display");
			res.addObject("curricula", curricula);
			res.addObject("buttons", false);
			res.addObject("personalData", personalData);
			res.addObject("positionDatas", positionDatas);
			res.addObject("educationDatas", educationDatas);
			res.addObject("miscellaneousRecords", miscellaneousRecords);

			final UserAccount logged = LoginService.getPrincipal();

			final Authority authHacker = new Authority();
			authHacker.setAuthority(Authority.HACKER);
			final Authority authCompany = new Authority();
			authCompany.setAuthority(Authority.COMPANY);
			if (logged.getAuthorities().contains(authHacker)) {
				final Rooky hacker = this.hackerService.findByPrincipal();
				if (curricula.getHacker() != null) {
					Assert.isTrue(curricula.getHacker().equals(hacker));
					res.addObject("buttons", true);
				} else if (curricula.getHacker() == null) {
					res.addObject("buttons", true);
					Assert.isTrue(this.hackerService.findHackerByCopyCurricula(curricula.getId()).equals(hacker));
				}
			} else if (logged.getAuthorities().contains(authCompany)) {
				res.addObject("buttons", false);
				final Company company = this.companyService.findByPrincipal();
				Assert.isTrue(this.curriculaService.findCurriculasByCompany(company.getId()).contains(curricula));
			}
		} else {
			res = new ModelAndView("curricula/create");
			res.addObject("curricula", curricula);
		}

		return res;
	}

	@RequestMapping(value = "/displayAll", method = RequestMethod.GET)
	public ModelAndView displayAll() {
		final ModelAndView res;
		final Rooky hacker = this.hackerService.findByPrincipal();
		final Collection<Curricula> curricula = this.curriculaService.findCurriculaByHacker(hacker.getId());
		if (!(curricula == null)) {

			res = new ModelAndView("curricula/displayAll");
			res.addObject("curricula", curricula);
			res.addObject("buttons", true);
		} else {
			res = new ModelAndView("curricula/create");
			res.addObject("curricula", curricula);
		}

		return res;
	}

	/*
	 * @RequestMapping(value = "/listForAnonymous", method = RequestMethod.GET)
	 * public ModelAndView listForAnonymous(@RequestParam final int hackerId) {
	 * final ModelAndView res;
	 * final Hacker hacker = this.hackerService.findOne(hackerId);
	 * final Collection<Curricula> curricula = this.curriculaService.findCurriculaByHacker(hackerId);
	 * final PersonalData personalData = curricula.getPersonalRecord();
	 * final Collection<EducationData> educationDatas = curricula.getEducations();
	 * final Collection<PositionData> positionDatas = curricula.getPositions();
	 * final Collection<MiscellaneousData> miscellaneousRecords = curricula.getMiscellaneous();
	 * 
	 * res = new ModelAndView("curricula/display");
	 * res.addObject("hacker", hacker);
	 * res.addObject("buttons", false);
	 * res.addObject("curricula", curricula);
	 * res.addObject("personalData", personalData);
	 * res.addObject("positionDatas", positionDatas);
	 * res.addObject("educationDatas", educationDatas);
	 * res.addObject("miscellaneousRecords", miscellaneousRecords);
	 * 
	 * return res;
	 * }
	 */

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		final Curricula newCurricula = this.curriculaService.create();
		result = this.displayAll();
		this.curriculaService.save(newCurricula);
		result = this.displayAll();
		return result;
	}

	//Save
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Curricula curricula, final BindingResult bindingResult) {
		ModelAndView result;
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(curricula);
		else
			try {
				if (curricula.getVersion() == 0)
					//final Hacker hacker = this.hackerService.findByPrincipal();
					//hacker.setCurricula(curricula);
					this.curriculaService.save(curricula);
				result = this.displayAll();
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(curricula, "general.commit.error");
			}

		return result;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int curriculaId) {
		ModelAndView result;
		final Rooky hacker = this.hackerService.findByPrincipal();
		final Curricula curricula = this.curriculaService.findOne(curriculaId);
		this.curriculaService.delete(curricula);
		result = new ModelAndView("curricula/displayAll");
		final Collection<Curricula> curriculas = this.curriculaService.findCurriculaByHacker(hacker.getId());
		result.addObject("curricula", curriculas);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Curricula curricula) {
		ModelAndView result;

		result = this.createEditModelAndView(curricula, null);

		return result;
	}

	// Edition ---------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Curricula curricula, final String message) {
		ModelAndView result;

		result = new ModelAndView("curricula/display");
		result.addObject("curricula", curricula);
		result.addObject("message", message);

		return result;

	}

}
