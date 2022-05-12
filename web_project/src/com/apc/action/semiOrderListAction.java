package com.apc.action;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.PaymentDAO;
import com.apc.model.PaymentDTO;

public class semiOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String member_id = request.getParameter("member_id").trim();
		
		PaymentDAO dao = PaymentDAO.getInstance();
		
		List<PaymentDTO> dto = dao.getPaymentInfo(member_id);
		
		request.setAttribute("payInfo", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("member/member_orderlist.jsp");
		
		return forward;
	}

}
