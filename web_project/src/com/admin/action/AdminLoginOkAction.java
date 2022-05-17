package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.AdminDAO;
import com.apc.model.AdminDTO;

public class AdminLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자 로그인 페이지에서 아이디와 비밀번호를 확인하고 관리자 메인 페이지로 이동하는 비즈니스 로직
		
		String admin_id = request.getParameter("admin_id");
		String admin_pwd = request.getParameter("admin_pwd");
		
		
		AdminDAO dao = AdminDAO.getinstance();
		
		int check = dao.check_id_pwd(admin_id, admin_pwd);
		
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
		
		
		
		PrintWriter out = response.getWriter();
		
		if(check>0) {
			
			AdminDTO dto = dao.getAdmin(admin_id);
			
			session.setAttribute("adminId",dto.getAdmin_id());
			session.setAttribute("adminPwd",dto.getAdmin_pwd());
			session.setAttribute("adminName", dto.getAdmin_name());
			
			forward.setRedirect(true);
			forward.setPath("admin_main.do");
			
		}else if(check==-1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('통신 오류가 발생했습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
		
		return forward;
	}

}
