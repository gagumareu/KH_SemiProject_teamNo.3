package com.apc.action;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;

public class semiLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		// 로그아웃 메서드
		
		HttpSession session = request.getSession();
				
		session.invalidate();  // 모든 세션 정보를 만료시키는 메서드.
				
		ActionForward forward = new ActionForward();
				
		forward.setRedirect(false);
		forward.setPath("index.jsp");
				
				
		return forward;

	}

}
