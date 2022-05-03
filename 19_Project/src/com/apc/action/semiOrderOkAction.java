package com.apc.action;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;
import com.apc.model.PaymentDAO;
import com.apc.model.PaymentDTO;

public class semiOrderOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {
		
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
		
		PaymentDTO dto = new PaymentDTO();
		
		dto.setOrder_id(member_id);
		dto.setOrdername(ordername);
		dto.setOrderaddr(orderaddr);
		dto.setOrderphone(orderphone);
		dto.setPaytype(paytype);
			
		PaymentDAO dao = PaymentDAO.getInstance();
		
		dao.CartToPay(dto);
		
		
		return null;
	}

}
