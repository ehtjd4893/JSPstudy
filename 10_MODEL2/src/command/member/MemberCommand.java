package command.member;

import javax.servlet.http.HttpServletResponse;

import common.ModelAndView;

import javax.servlet.http.HttpServletRequest;

public interface MemberCommand {
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response);
}
