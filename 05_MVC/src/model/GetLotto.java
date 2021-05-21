package model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

public class GetLotto {

	public GetLotto() {	}

	public String execute(HttpServletRequest request) {
		
		Set<Integer> lotto = new HashSet<>();
		
		for(int i = 0; i < 6; i++) {
			lotto.add((int)(Math.random() * 45 + 1));
		}
		
		request.setAttribute("lotto", lotto);
		return "/views/output.jsp";
	
	}
}
