package command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import common.ModelAndView;
import dao.MemberDAO;
import dto.Member;

public class DeleteMemberCommand implements MemberCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		long no = Long.parseLong(request.getParameter("no"));
		
		Member member = new Member();
		member.setNo(no);
		
		int result = MemberDAO.getInstance().deleteMember(member);
		if(result > 0) {
			HttpSession session = request.getSession();
			session.invalidate();
		}
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.close();
		return null;
	}

}
