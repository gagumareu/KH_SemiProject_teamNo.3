package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;

public class MemberUpdatePwdOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		String pwd_now = request.getParameter("pwd_now").trim();
		String pwd_new = request.getParameter("pwd_new").trim();
		String pwd_confirm = request.getParameter("pwd_confirm").trim();
		
		MemberDAO dao = MemberDAO.getInstance();
		String pwd = dao.getPwd(id);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		System.out.println(pwd);
		System.out.println(pwd_now);
		System.out.println(pwd_new);
		System.out.println(pwd_confirm);
		System.out.println(pwd.equals(pwd_now));
		System.out.println(pwd_new == pwd_confirm);
		System.out.println(pwd_new.length() > 3);
		
		if((pwd.equals(pwd_now)) && (pwd_new.equals(pwd_confirm)) && (pwd_new.length() > 3)) {
			
			int result = dao.updatePwd(id, pwd_new);
			System.out.println(result);
			if(result > 0) {
				
				forward.setRedirect(true);
				forward.setPath("member_myPage.do?id=" + id);
				
			}else {
				
				out.println("<script>");
				out.println("alert('실패.')");
				out.println("history.back()");
				out.println("</script>");
				
			}
			
		}else {
			
			out.println("<script>");
			out.println("alert('모든 항목을 정확히 입력해 주세요.')");	
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
