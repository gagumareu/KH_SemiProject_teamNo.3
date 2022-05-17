package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;

public class MemberUpdateAddrOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		String first_phone = request.getParameter("first_phone").trim();
		String middle_phone = request.getParameter("middle_phone").trim();
		String last_phone = request.getParameter("last_phone").trim();
		String first_addr = request.getParameter("first_addr").trim();
		String last_addr = request.getParameter("last_addr").trim();
		
		String phone = first_phone + "-" + middle_phone + "-" + last_phone;
		System.out.println(phone);
		String addr = first_addr + " " + last_addr;
		System.out.println(addr);
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.updateAddr(id, phone, addr);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result > 0) {

			forward.setRedirect(true);
			forward.setPath("member_addrView.do?id=" + id);
			
		}else {
			out.println("<script>");
			out.println("alert('실패')");	
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
