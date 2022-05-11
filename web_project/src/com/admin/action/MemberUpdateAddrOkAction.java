package com.admin.action;

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
		
		String mem_id = request.getParameter("mem_id").trim();
		String first_phone = request.getParameter("first_phone").trim();
		String middle_phone = request.getParameter("middle_phone").trim();
		String last_phone = request.getParameter("last_phone").trim();
		String first_addr = request.getParameter("first_addr").trim();
		String last_addr = request.getParameter("last_addr").trim();
		
		String phone = first_phone + middle_phone + last_phone;
		System.out.println(phone);
		String addr = first_addr + " " + last_addr;
		System.out.println(addr);
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.updateAddr(mem_id, phone, addr);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			
			out.println("<script>");
			out.println("alert('배송지 저장 되었습니다.')");		// 이게 안뜬다...
			out.println("</script>");
			
			forward.setRedirect(true);
			forward.setPath("member_addrView.do");
			
		}else {
			out.println("<script>");
			out.println("alert('실패')");				// apc 홈페이지에서는 실패 조건이 없는 듯 하다.
			out.println("</script>");
		}
		return forward;
	}

}
