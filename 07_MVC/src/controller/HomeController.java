package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import model.CircleCommand;
import model.ShapeCommand;
import model.RectangleCommand;
import model.TriangleCommand;

/**
 * Servlet implementation class HomeService
 */
@WebServlet("*.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String[] arr = request.getRequestURI().split("/");
		String command = arr[arr.length - 1];
		
		// 요청에 따른 Model의 선택
		// 클래스명: ModelMapper
		// 매개변수: String command(어떤 요청인지 전달)
		// 반환타입: (Model)을 반환
		
		// Model의 기본
		// 1. 인터페이스 하나 생성
		// 2. 해당 인터페이스를 구현
		//		-> 모든 Model의 타입은 interface
		//String path = null;
		ShapeCommand service = null;
		service = ModelMapper.getInstance().getModel(command);
		
		
		// Model 실행
		//path = service.execute(request, response);
		ModelAndView mav = service.execute(request, response);
		if(mav == null)
			return;
		
		// 응답 view 이동
		if(mav.isRedirect())
			response.sendRedirect(mav.getView());
		else
			request.getRequestDispatcher(mav.getView()).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
