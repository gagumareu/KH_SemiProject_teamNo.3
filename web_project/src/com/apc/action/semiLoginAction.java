package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;


public class semiLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String member_id = request.getParameter("member_id").trim();
		
		String member_pwd = request.getParameter("member_pwd").trim();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int check = dao.memberCheck(member_id, member_pwd);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		if(check > 0) {
			// 회원인 경우
			MemberDTO dto = dao.getMemberInfo(member_id);
			session.setAttribute("member_id", dto.getMem_id()); //20220511이슬 수정
			
			forward.setRedirect(true);
			forward.setPath("semiCartList.do");  // 메인 페이지로 이동
			
		}else if(check == -1) {
			// 비밀번호가 틀린 경우
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 확인해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			// 회원이 아닌 경우
			out.println("<script>");
			out.println("alert('없는 아이디입니다. 다시 한번 아이디를 확인하세요.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}