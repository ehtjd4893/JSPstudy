package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.IdCheckCommand;
import command.JoinPageCommand;
import command.LoginCommand;
import command.LoginPageCommand;
import command.LogoutCommand;
import command.MemberCommand;
import common.ModelAndView;


@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String[] arr = request.getRequestURI().split("/");
		String cmd = arr[arr.length - 1];
		
		MemberCommand command = null;
		ModelAndView mav = null;
		switch(cmd) {
		case "loginPage.do":
			command = new LoginPageCommand();
			break;
		case "login.do":
			command = new LoginCommand();
			break;
		case "joinPage.do":
			command = new JoinPageCommand();
			break;
		case "logout.do":
			command = new LogoutCommand();
			break;
		case "idCheck.do":
			command = new IdCheckCommand();
			break;
		case "":
			break;
		}
		
			try {
				if(command != null) {
				mav = command.execute(request, response);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		// ajax로 처리되는 command는 아래 코드가 동작하지 않는다.
		if(mav != null) {
			if(mav.isRedirect()) {
				response.sendRedirect(mav.getView());
			}else {
				request.getRequestDispatcher(mav.getView()).forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}