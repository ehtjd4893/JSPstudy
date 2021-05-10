package ex04;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex04
 */
@WebServlet("/Ex04")
public class Ex04 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex04() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		// request의 캐릭터 셋 인코딩 처리
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		if(name == null || name.isEmpty()) {
			name = "고길동";
		}
		
		String strHeight = request.getParameter("height");
		double height;
		if(strHeight == null || strHeight.isEmpty()) {
			height = 0;
		}else {
			height = Double.parseDouble(strHeight);
		}
	
		String strWeight = request.getParameter("weight");
		double weight;
		if(strWeight == null || strWeight.isEmpty()) {
			weight = 0;
		}else {
			weight = Double.parseDouble(strWeight);
		}
		System.out.println("내 이름은 " + name + ", 키는 " + height + "cm이고, " + weight + "kg입니다.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost() 호출");
		
		doGet(request, response);
	}

}
