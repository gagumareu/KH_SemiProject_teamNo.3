package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;

public class AdminLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession sesstion = request.getSession();
		
		sesstion.invalidate();		// 현재 사용중인 세션을 만료시키는 메서드
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_Login.jsp");
				
		return forward;
	}

}
