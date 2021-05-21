package model;

import javax.servlet.http.HttpServletRequest;

public class AgeService {
	
	public AgeService() {
		// TODO Auto-generated constructor stub
	}
	public String execute(HttpServletRequest request) {
		
		int age = 0;
		try {
			age = Integer.parseInt(request.getParameter("age"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String answer = age < 20 ? "아가는 포카리나 드세요" : "맥주 여기 있습니다.";
		request.setAttribute("answer", answer);
		return "/views/output.jsp";
	}

}
