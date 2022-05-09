package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;

public class GoNonPayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//product_detail.jsp에서 바로 비회원 구매하기 버튼을 누르면 정보를 받아 payment DB에 저장하는 비즈니스 로직 
		
		
		return null;
	}

}
