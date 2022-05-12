package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.PaymentDAO;
import com.apc.model.SalesManagementDTO;

public class AdminSelesManagmentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PaymentDAO dao = PaymentDAO.getInstance();
		
		List<SalesManagementDTO> list =  dao.getPaymentAsDate();
		
		request.setAttribute("salesList", list);
		
		
		
		int sum=0;
		
		for(int i=0; i<list.size(); i++) {
			SalesManagementDTO price = list.get(i);
			sum += price.getPrice_sum();
		}
		
		request.setAttribute("totalPrice", sum);
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_sales_management.jsp");
		
		return forward;
		
	}

}
