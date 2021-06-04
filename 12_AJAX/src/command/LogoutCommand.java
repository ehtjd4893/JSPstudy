package command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ModelAndView;

public class LogoutCommand implements MemberCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
			return new ModelAndView("index.jsp",false);
		}
		else {
			return  new ModelAndView("12_AJAX/member/myPage.jsp",true);
		}	
	}

}
