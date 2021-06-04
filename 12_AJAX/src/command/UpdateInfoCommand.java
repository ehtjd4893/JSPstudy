package command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import common.ModelAndView;
import dao.MemberDAO;
import dto.Member;

public class UpdateInfoCommand implements MemberCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Long no = Long.parseLong(request.getParameter("no"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Member member = new Member(null, null, name, email, phone);
		member.setNo(no);
		
		int result = MemberDAO.getInstance().updateInfo(member);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			loginUser.setEmail(email);
			loginUser.setName(name);
			loginUser.setPhone(phone);
		}
		JSONObject obj = new JSONObject();
		response.setContentType("application/json; charset=utf-8");
		obj.put("result", result);
		
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.close();
		
		return null;
	}

}
