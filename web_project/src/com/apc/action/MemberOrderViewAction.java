package com.apc.action;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CancelDAO;
import com.apc.model.CancelDTO;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;
import com.apc.model.PaymentDAO;
import com.apc.model.PaymentDTO;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;
import com.apc.model.ReviewDAO;
import com.apc.model.ReviewDTO;


public class MemberOrderViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String mem_id = request.getParameter("id");

		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO member = dao.getMember(mem_id);
		
		LocalDate now = LocalDate.now();

		int year = now.getYear();
		int month = now.getMonthValue() + -3;
		String month_s = null;
		int day = now.getDayOfMonth();
		String day_s = null;
		
		if (month <= 0) {	
			year = year - 1;
			month = month + 12;
		}
		if (day == 31) {
			day = 30;
		}
		if (month==2 && day>28) {
			day = 28;
		}
		if (month < 10) {
			month_s = "0" + Integer.toString(month);
		} else {
			month_s = Integer.toString(month);
		}
		
		if (day < 10) {
			day_s = "0" + Integer.toString(day);
		}else {
			day_s = Integer.toString(day);
		}
		
		String date_3 = year + "-" + month_s + "-" + day_s;
		
		PaymentDAO paydao = PaymentDAO.getInstance();
		List<PaymentDTO> list = paydao.getOrderPaymentList(mem_id);
		
		CancelDAO cDAO = CancelDAO.getInstance();
		List<CancelDTO> cancelList = cDAO.getCancelList(mem_id);
		
		ReviewDAO rdao = ReviewDAO.getInstance();
		List<ReviewDTO> reviewList = rdao.getRateList(mem_id);
		
		request.setAttribute("date_now", now);
		request.setAttribute("date_3", date_3);
		request.setAttribute("memDTO", member);
		request.setAttribute("payList", list);
		request.setAttribute("cancelList", cancelList);
		request.setAttribute("reviewList", reviewList);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("member/orderView.jsp");
		
		return forward;
	}

}
