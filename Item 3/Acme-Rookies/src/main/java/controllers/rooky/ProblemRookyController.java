
package controllers.rooky;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ProblemService;
import services.RookyService;
import controllers.AbstractController;
import domain.Problem;
import domain.Rooky;

@Controller
@RequestMapping("/problem/rooky")
public class ProblemRookyController extends AbstractController {

	@Autowired
	private RookyService	rookyService;

	@Autowired
	private ProblemService	problemService;


	//Display

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int problemId) {

		ModelAndView res;

		final Problem problem = this.problemService.findOne(problemId);
		final Rooky principal = this.rookyService.findByPrincipal();
		final Collection<Problem> problems = this.problemService.findAllByRooky(principal.getId());

		if (problem != null && problems.contains(problem)) {
			res = new ModelAndView("problem/display");
			res.addObject("problem", problem);
			res.addObject("position", problem.getPosition());
		} else
			res = new ModelAndView("redirect:/misc/403.jsp");

		return res;

	}

}
