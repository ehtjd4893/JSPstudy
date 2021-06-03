package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;
import dao.BoardDAO;
import dto.BoardDTO;

public class InsertReplyCommand implements BoardCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		long groupno = Long.parseLong(request.getParameter("groupno"));
		
		BoardDTO replyDTO = new BoardDTO();
		replyDTO.setAuthor(author);
		replyDTO.setTitle(title);
		replyDTO.setContent(content);
		replyDTO.setIp(ip);
		replyDTO.setGroupno(groupno);	// 댓글은 원글과 같은 그룹이 된다.
		replyDTO.setDepth(1);	// 댓글의 depth는 1이다.
		replyDTO.setGroupord(1);	// 그룹 내부 순서
		
		// 기존 댓글들의 groupord를 모두 1씩 증가시킨다.
		// 기존 댓글: 같은 groupNo, depth = 1
		
		BoardDAO.getInstance().increseGroupordPreviousReply(groupno);
		
		int result = BoardDAO.getInstance().insertReply(replyDTO);
		
		
		// 결과를 처리할 insertResult.jsp를 만들고 이동한다.
		return new ModelAndView("/11_MYBATIS/board/insertReplyResult.jsp?result=" + result, true);  // 삽입 후에는 반드시 리다이렉트
	}

}
