package controller;

import common.ModelAndView;
import model.AverageService;
import model.HomeService;

public class ModelMapper {
	
	private static ModelMapper mapper = new ModelMapper();
	
	public static ModelMapper getInstance() {
		if(mapper == null)
			mapper = new ModelMapper();
		return mapper;
	}
	
	private ModelMapper() {
		// TODO Auto-generated constructor stub
	}
	
	public HomeService getModel(String cmd) {
		
		HomeService service = null;
		
		if(cmd.equals("inquiry.do")) {
			service = new AverageService();
		}
		return service;
	}
}
