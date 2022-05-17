package com.apc.action;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;


public class MemberContactViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
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
		
		QaDAO qaDAO = QaDAO.getInstance();
		List<QaDTO> list = qaDAO.getContactQaList(mem_id);
		List<QaDTO> replyList = qaDAO.getContactQaList("관리자");
		
		request.setAttribute("date_now", now);
		request.setAttribute("date_3", date_3);
		request.setAttribute("memDTO", member);
		request.setAttribute("qaList", list);
		request.setAttribute("replyList", replyList);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("member/contactView.jsp");
		
		return forward;
	}

}
