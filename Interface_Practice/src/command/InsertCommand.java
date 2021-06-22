package command;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.PersonDAO;
import dto.Person;

/**
 * Servlet implementation class InsertCommand
 */
@WebServlet("/insert.do")
public class InsertCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertCommand() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		String sno = request.getParameter("sno");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		if(age < 0 || age > 100) {
			throw new RuntimeException();
		}
		String birthday = request.getParameter("birthday");
		
		Person p = new Person();
		p.setAge(age);
		p.setSno(sno);
		p.setName(name);
		p.setBirthday(birthday);
		
		
		int count = PersonDAO.getInstance().insert(p);
		JSONObject obj = new JSONObject();
		obj.put("count", count);
		
		response.getWriter().println(obj);
		} catch (NumberFormatException e) {
			// 나이: 정수 이외의 값이 입력됨.
			response.setStatus(3001);	// 에러 코드 값을 작성, xhr.status를 통해서 확인
			response.getWriter().println("나이는 정수만 입력 가능합니다.");
		} catch(RuntimeException e) {
			response.setStatus(3002);
			response.getWriter().println("나이는 1 ~ 100 의 숫자만 가능합니다.");
		} catch(SQLIntegrityConstraintViolationException e) {
			response.setStatus(3003);
			response.getWriter().println("중복된 sno 입니다.");
		} catch(SQLException e) {
			response.setStatus(3004);
			response.getWriter().println("입력 실패!");
		}
	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
