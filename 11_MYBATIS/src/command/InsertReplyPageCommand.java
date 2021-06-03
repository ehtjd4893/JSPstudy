package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;

public class InsertReplyPageCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// forward 이동하기 때문에 게시물번호(no)를 넘겨줄 수 있음.
		return new ModelAndView("board/insertReply1.jsp",false);
	}

}
