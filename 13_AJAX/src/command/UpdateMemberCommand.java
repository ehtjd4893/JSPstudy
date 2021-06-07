package command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import controller.ModelAndView;
import dao.MemberDAO;
import dto.Member;

import org.json.simple.parser.JSONParser;

public class UpdateMemberCommand implements MemberCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String str = request.getParameter("member");
		JSONParser parser = new JSONParser();
		
		JSONObject obj = (JSONObject) parser.parse(str);

		Member member = new Member();
		
		member.setNo(Long.parseLong((String)obj.get("no")));
		member.setId((String) obj.get("id"));
		member.setName((String) obj.get("name"));
		member.setGender((String) obj.get("gender"));
		member.setAddress((String) obj.get("address"));
		
		//System.out.println(member);
		
		int result = MemberDAO.getInstance().updateMember(member);
		
		JSONObject obj2 = new JSONObject();
		obj2.put("isSuccess", result > 0);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(obj2);
		
		return null;
	}

}
