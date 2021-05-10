package ex04;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex03
 */
@WebServlet("/Ex03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex03() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name = request.getParameter("name");
		if(name == null || name.isEmpty()) {
			name = "고길동";	// 기본 이름(default)
		}
	
		String strAge = request.getParameter("age");
		int age;
		if(strAge == null || strAge.isEmpty())
			age = 0;
		else
			age = Integer.parseInt(strAge);
		
		String strHeight = request.getParameter("height");
		double height;
		if(strHeight == null || strHeight.isEmpty())
			height = 0.0;
		else
			height = Double.parseDouble(strHeight);
		
		String strWeight = request.getParameter("weight");
		double weight;
		if(strWeight == null || strWeight.isEmpty())
			weight = 0.0;
		else
			weight = Double.parseDouble(strWeight);
		System.out.println("내 이름은 " + name + ", 내 나이는" + age + "입니다.");
		System.out.println("내 키는 " + height + "cm, 내 몸무게는" + weight + "kg입니다.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
