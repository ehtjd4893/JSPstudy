package command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import common.ModelAndView;
import dao.MemberDAO;

public class IdCheckCommand implements MemberCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		
		// 사용 가능하면 true, 사용 불가하면 false;
		boolean result = MemberDAO.getInstance().idCheck(id);
		
		// 응답 데이터를 JSON 데이터 타입으로
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		response.setContentType("application/json; charset=utf-8");	// JSON 데이터의 ContentType
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.close();
		
		// controller로 ModelAndView를 반환하지 않아야만 redirect 또는 forward 하지 않는다.
		return null;
	}

}
