package model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class GetTime {
	
	public GetTime() {}
	
	public String execute(HttpServletRequest request) {
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("H:mm:ss");
		
		request.setAttribute("time", sdf.format(d));
		
		return "/views/output.jsp";	
	}
}
