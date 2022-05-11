package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.PaymentDAO;
import com.apc.model.PaymentDTO;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;

public class MemberOrderCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int order_no = Integer.parseInt(request.getParameter("num"));
		
		PaymentDAO paydao = PaymentDAO.getInstance();
		PaymentDTO paydto = paydao.getPaymentContent(order_no);
		
		int pno_fk = paydto.getPno_fk();
		
		ProductDAO pdao = ProductDAO.getInstance();
		ProductDTO pdto = pdao.getProductContent(pno_fk);
		
		request.setAttribute("paymentDTO", paydto);
		request.setAttribute("productDTO", pdto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("member/orderCancel.jsp");
		
		return forward;
	}

}
