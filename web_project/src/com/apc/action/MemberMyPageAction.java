package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;

public class MemberMyPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 해당 ID의 회원 정보를 전체적으로 불러오는 로직
		
		String mem_id = request.getParameter("id");
		
		System.out.println("id:"+mem_id);
		
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO member = dao.getMember(mem_id);

		request.setAttribute("memDTO", member);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("member/myPage.jsp");
		
		
		return forward;
	}

}
