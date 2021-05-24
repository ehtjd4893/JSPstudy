package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;

public class RectangleCommand implements ShapeCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		
		double width = 0;
		double height = 0;
		try {
			width= Double.parseDouble((String)request.getParameter("width"));
			height = Double.parseDouble((String)request.getParameter("height"));
		}catch(Exception e) {
			
		}		
		request.setAttribute("area", width*height);
		return new ModelAndView("views/output.jsp",false);
	}

}
