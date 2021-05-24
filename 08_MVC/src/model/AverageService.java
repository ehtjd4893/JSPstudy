package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;

public class AverageService implements HomeService {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		
		double mat = 0;
		double kor = 0;
		double eng = 0;
		try {
			mat = Double.parseDouble((String)request.getParameter("mat"));
			kor = Double.parseDouble((String)request.getParameter("kor"));
			eng = Double.parseDouble((String)request.getParameter("eng"));
		}catch(Exception e){
			e.printStackTrace();
		}
		double avg = (mat+kor+eng)/3;
		request.setAttribute("avg", avg);
		
		char grade = 'F';
		switch((int)avg/10) {
		case 10: case 9: grade = 'A'; break;
		case 8: grade = 'B'; break;
		case 7: grade = 'C'; break;
		case 6: grade = 'D'; break;
		default: grade = 'F';
		}
		request.setAttribute("grade", grade);
		
		return new ModelAndView("views/output.jsp",false);
		
	}

}
