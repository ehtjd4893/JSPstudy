package controller;

import model.CircleCommand;
import model.RectangleCommand;
import model.ShapeCommand;
import model.TriangleCommand;

public class ModelMapper {
	
	// 한 번에 하나의 Model만 반환할 수 있도록 Singleton 처리
	
	private static ModelMapper mapper = new ModelMapper();
	
	private ModelMapper() {}
	
	public static ModelMapper getInstance() {
		if(mapper == null) {
			mapper = new ModelMapper();
		}
		return mapper;
	}
	// Model을 반환시키는 getModel() 메소드
	public ShapeCommand getModel(String command) {
		
		ShapeCommand com = null;
		switch(command){
		case "rectangle.do":
			com = new RectangleCommand();
			break;
		case "triangle.do":
			com = new TriangleCommand();
			break;
		case "circle.do":
			com = new CircleCommand();
		}
		
		return com;
	}
}
