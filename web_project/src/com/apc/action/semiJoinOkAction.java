package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;

public class semiJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userName = request.getParameter("username").trim();
		
		String userId = request.getParameter("userId").trim();
		
		String userPwd = request.getParameter("userpwd").trim();
		
		String userPwd2 = request.getParameter("userpwd2").trim();
		
		int birth1 = 
				Integer.parseInt(request.getParameter("user_birth1").trim());
		
		int birth2 = 
				Integer.parseInt(request.getParameter("user_birth2").trim());
		
		int birth3 = 
				Integer.parseInt(request.getParameter("user_birth3").trim());
		
		String user_email = request.getParameter("user_email").trim();
		
		String phone1 =
				request.getParameter("phone1").trim();
		
		String phone2 =
				request.getParameter("phone2").trim();
		
		String phone3 =
				request.getParameter("phone3").trim();
		
		String user_addr = request.getParameter("user_addr").trim();
		
		String user_phone =
				phone1 + "-" + phone2 + "-" + phone3;
		
		String birth =
				birth1 + "-" + birth2 + "-" + birth3; 
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
	
			MemberDTO dto = new MemberDTO();
			
			dto.setMem_name(userName);
			dto.setMem_id(userId);
			dto.setMem_pwd(userPwd);
			dto.setEmail(user_email);
			dto.setPhone(user_phone);
			dto.setAddr(user_addr);
			dto.setBirth(birth);
			
			MemberDAO dao = MemberDAO.getInstance();
			
			int check = dao.joinMember(dto);
			
			if(check > 0) {
				forward.setRedirect(false);
				forward.setPath("index.jsp");
			}else {
				out.println("<script>");
				out.println("alert('회원가입 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
			

		return forward;
	}

}