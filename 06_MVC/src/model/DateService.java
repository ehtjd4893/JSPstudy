package model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DateService implements HomeService{
	
	public DateService() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Date today = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		request.setAttribute("today", sdf.format(today));
		
		return "views/output.jsp";
	}
}
