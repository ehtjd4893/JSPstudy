package command.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ModelAndView;
import dao.MemberDAO;
import dto.MemberDTO;

public class UpdatePwCommand implements MemberCommand{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터 처리
		String pw = request.getParameter("pw");
		// session에서 loginDTO 정보 알아내기
		HttpSession session = request.getSession();
		MemberDTO loginDTO = (MemberDTO)session.getAttribute("loginDTO");
		
		MemberDTO dto = new MemberDTO();
		dto.setNo(loginDTO.getNo());
		dto.setPw(pw);
		
		int result = MemberDAO.getInstance().updatePw(dto);
		ModelAndView mav = null;
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
				loginDTO.setPw(pw);
				out.println("<script>");
				out.println("alert('비밀번호를 변경 완료!')");
				out.println("location.href = '/10_MODEL2/myPage.m'");
				out.println("</script>");
				out.flush();
				out.close();
			}else {
				out.println("<script>");
				out.println("alert('비밀번호 변경 실패!')");
				out.println("location.href = '/10_MODEL2/myPage.m'");
				out.println("</script>");
				out.flush();
				out.close();
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return mav;
	}

}
