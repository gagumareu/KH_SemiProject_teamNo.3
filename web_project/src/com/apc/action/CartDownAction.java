package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;

public class CartDownAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int cart_no = Integer.parseInt(request.getParameter("cno"));
		
		CartDAO cdao = CartDAO.getInstance();
		
		int result = cdao.qtyDown(cart_no);
		out.println(result);
		
		return null;
	}

}
