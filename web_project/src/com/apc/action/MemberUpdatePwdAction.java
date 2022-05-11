package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;

public class MemberUpdatePwdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String mem_id = request.getParameter("id");
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO member = dao.getMember(mem_id);
		
		request.setAttribute("memDTO", member);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("member/updatePwd.jsp");
		
		return forward;
	}

}
