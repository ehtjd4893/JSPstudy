package command;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import controller.ModelAndView;
import dao.MemberDAO;
import dto.Member;


public class SelectMemberListCommand implements MemberCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int totalRecord = MemberDAO.getInstance().getMemberCount();
						
		// beginRecord, endRecord 구하기
		
		// beginRecord ~ endRecord 목록 가져오기
		
		List<Member> list = MemberDAO.getInstance().selectMemberList();
		JSONObject obj = new JSONObject();
		
		JSONObject paging = new JSONObject();
		paging.put("totalRecord",totalRecord);
	
		obj.put("paging",paging);
		
		if(list.size() > 0) {
			obj.put("isExist", true);
			JSONArray arr = new JSONArray();
			for(Member member : list) {
				JSONObject obj2 = new JSONObject();
				obj2.put("no", member.getNo());
				obj2.put("id", member.getId());
				obj2.put("name", member.getName());
				obj2.put("address", member.getAddress());
				obj2.put("gender", member.getGender());
				arr.add(obj2);
			}
			
			obj.put("list", arr);
			obj.put("isExist",true);
			obj.put("totalRecord",totalRecord);
			//System.out.println(obj.toString());
		} else {
			obj.put("isExist", false);
		}
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(obj);
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
		return null;
	}

}
