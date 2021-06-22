package command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.PersonDAO;
import dto.Person;

/**
 * Servlet implementation class SelectPersonListCommand
 */
@WebServlet("/selectPersonList.do")
public class SelectPersonListCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPersonListCommand() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Person> list = PersonDAO.getInstance().selectPersonList();
		// List -> Person -> JSONObject -> JSONArray에 추가
		JSONArray arr = new JSONArray();
		for(Person p : list) {
			JSONObject obj = new JSONObject();
			obj.put("sno", p.getSno());
			obj.put("name",p.getName());
			obj.put("age", p.getAge());
			obj.put("birthday", p.getBirthday());
			
			obj.put("regdate", p.getRegDate().toString());	
			// toString을 이용하지 않으면 ""로 묶이지 않아서 json으로 활용할 수 없다.
			arr.add(obj);
		}
		response.setCharacterEncoding("utf-8");
		response.getWriter().println(arr);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
