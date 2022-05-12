package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;

public class QaChangeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//qa_main.jsp에서 선택박스 동작하면 값을 받아 값에 해당하는 데이터를 조회하여 뷰페이지로 이동시키는 비즈니스 로직
		
		String code = request.getParameter("code").trim();
		
		
		return null;
	}

}
