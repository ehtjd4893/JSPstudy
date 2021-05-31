package command.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ModelAndView;
import dao.MemberDAO;
import dto.MemberDTO;

public class UpdateMemberCommand implements MemberCommand{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터 처리
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		// session에서 loginDTO 정보 알아내기
		HttpSession session = request.getSession();
		MemberDTO loginDTO = (MemberDTO)session.getAttribute("loginDTO");
		
		MemberDTO dto = new MemberDTO();
		dto.setNo(loginDTO.getNo());
		dto.setName(loginDTO.getName());
		dto.setEmail(loginDTO.getEmail());
		
		int result = MemberDAO.getInstance().updateMember(dto);
		ModelAndView mav = null;
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
				loginDTO.setName(name);
				loginDTO.setEmail(email);
				out.println("<script>");
				out.println("alert('회원정보 수정 완료!')");
				out.println("location.href = '/10_MODEL2/myPage.m'");
				out.println("</script>");
				out.flush();
				out.close();
			}else {
				out.println("<script>");
				out.println("alert('비밀번호 수정 실패!')");
				out.println("history.back()");
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
