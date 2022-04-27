package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//category_main2.jsp에서 넘어온 번호에 해당하는 제품리스트를 조회하여
		//view page로 이동하는 비즈니스 로직
		
		String fullcode = request.getParameter("code").trim();
		
		
		
		
		
		return null;
	}

}
