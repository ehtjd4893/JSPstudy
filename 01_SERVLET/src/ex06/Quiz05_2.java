package ex06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Quiz05_2
 */
@WebServlet("/Quiz05_2")
public class Quiz05_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quiz05_2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		/*
		 * if(name == null || name.isEmpty()) name = "이름 없음";
		 */		String strAge = request.getParameter("age");
		/*
		 * if(strAge != null && !strAge.isEmpty()) age = Integer.parseInt(strAge);
		 */		
		response.setContentType("text/html; charset=utf-8");
		System.out.println("05-2: "+ name + strAge);	
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"
				+ "이름: " + name
				+ ", 나이: " + strAge
				+ "');");
		out.println("history.back();</script>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
