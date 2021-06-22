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
 * Servlet implementation class SelectListCommand
 */
@WebServlet("/selectList.do")
public class SelectListCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectListCommand() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Person> list = PersonDAO.getInstance().selectList();
		JSONArray arr = new JSONArray();
		for(Person p : list) {
			JSONObject obj = new JSONObject();
			obj.put("sno", p.getSno());
			obj.put("name", p.getName());
			obj.put("age", p.getAge());
			obj.put("birthday", p.getBirthday());
			obj.put("regdate",p.getRegDate().toString());
			arr.add(obj);
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().println(arr);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
