package com.apc.action;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDTO;


public class semiOrderOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		// 회원 관련 내용
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String member_id = request.getParameter("member_id").trim();
		
		String ordername = request.getParameter("order_name").trim();
		
		String orderaddr = request.getParameter("order_addr").trim();
		
		int paytype = 
				Integer.parseInt(request.getParameter("payment").trim());
		
		String phone1 =
				request.getParameter("phone1").trim();
		
		String phone2 =
				request.getParameter("phone2").trim();
		
		String phone3 =
				request.getParameter("phone3").trim();
		
		String orderphone =
				phone1 + "-" + phone2 + "-" + phone3;
		
		// 결제 관련 내용
		List<CartDTO> list = new ArrayList<CartDTO>();
		
		
		
		
		
		
			
		
		
		
		
		
		return null;
	}

}
