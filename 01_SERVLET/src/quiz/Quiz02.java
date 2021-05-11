package quiz;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Quiz01
 */
@WebServlet("/Quiz02")
public class Quiz02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quiz02() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String question = request.getParameter("question");
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		SimpleDateFormat format1 = new SimpleDateFormat ( "HH시 mm분 ss초");
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월 dd일");
		String msg = question.equals("time") ? 
				"현재 시간은 " + format1.format(System.currentTimeMillis()) 
				: "오늘 날짜는 " + format2.format(System.currentTimeMillis());
		out.println("<script>"
				+ "alert('"
				+ msg
				+ "');"
				+ "history.back();"
				+ "</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
