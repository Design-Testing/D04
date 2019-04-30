
package controllers.hacker;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.PositionService;
import controllers.AbstractController;
import domain.Position;

@Controller
@RequestMapping("/position/hacker")
public class PositionHackerController extends AbstractController {

	@Autowired
	private PositionService	positionService;

	final String			lang	= LocaleContextHolder.getLocale().getLanguage();


	// LIST --------------------------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView myPositions() {
		final ModelAndView result;
		final Collection<Position> positions;

		positions = this.positionService.findAllFinalMode();

		result = new ModelAndView("position/list");
		result.addObject("positions", positions);
		result.addObject("listPositions", "list");
		result.addObject("lang", this.lang);
		result.addObject("rol", "hacker");
		result.addObject("requetURI", "position/list.do");
		result.addObject("hackerPositions", this.positionService.findAppliedByHacker());
		return result;
	}
}
