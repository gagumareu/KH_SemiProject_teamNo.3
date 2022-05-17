package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;

public class CartdeleteAllBAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		String loginId = (String) session.getAttribute("member_id");
		
		CartDAO dao = CartDAO.getInstance();
		
		dao.deleteAllCart(loginId);
		
		ActionForward forward= new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath("member_orderView.do?id="+loginId);
		
		return forward;
		
	}

}