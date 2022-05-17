package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;

public class semiFindPwdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String memberId = request.getParameter("memberId").trim();
		
		String memberEmail = request.getParameter("member_email").trim();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		String check = dao.memberFindPwd(memberId, memberEmail);
		
		request.setAttribute("memPwd", check);
		request.setAttribute("memId", memberId);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check.equals("wrong id")) {
			out.println("<script>");
			out.println("alert('ID를 확인해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}else if(check.equals("wrong email")) {
			out.println("<script>");
			out.println("alert('회원 이메일이 일치하지 않습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward.setRedirect(false);
			forward.setPath("member/member_findPwd.jsp");
		}
		
		
		return forward;
	}

}