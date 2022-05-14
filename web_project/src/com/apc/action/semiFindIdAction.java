package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;

public class semiFindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String memberName = request.getParameter("memberName").trim();
		
		String phone1 =
				request.getParameter("phone1").trim();
		
		String phone2 =
				request.getParameter("phone2").trim();
		
		String phone3 =
				request.getParameter("phone3").trim();
		
		String memberPhone =
				phone1 + "-" + phone2 + "-" + phone3;
		
		MemberDAO dao = MemberDAO.getInstance();
		
		String check = dao.membefFindId(memberName, memberPhone);
		
		request.setAttribute("memId", check);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check.equals("wrong name")) {
			out.println("<script>");
			out.println("alert('회원정보가 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else if(check.equals("wrong phone")) {
			out.println("<script>");
			out.println("alert('휴대폰 번호가 일치하지 않습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward.setRedirect(false);
			forward.setPath("member/member_findId.jsp");
		}
		
		
		return forward;
	}

}