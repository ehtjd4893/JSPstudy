package command.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ModelAndView;
import dao.MemberDAO;
import dto.MemberDTO;

public class DeleteMemberCommand implements MemberCommand {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDTO loginDTO = (MemberDTO)session.getAttribute("loginDTO");

		MemberDAO.getInstance().deleteMemberLog(loginDTO.getId());
		int result = MemberDAO.getInstance().deleteMember(loginDTO.getNo());
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
				session.invalidate();
				out.println("<script>");
				out.println("alert('회원 탈퇴 완료! 이용해주셔서 감사합니다.')");
				out.println("location.href = '/10_MODEL2/index.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('회원 탈퇴 실패! ')");
				out.println("history.back()");
				out.println("</script>");				
			}
			out.flush();
			out.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
