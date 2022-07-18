package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;

public class CartUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int cart_no = Integer.parseInt(request.getParameter("cno"));
		
		
		CartDAO cdao = CartDAO.getInstance();
		CartDTO cdto = cdao.getCartContent(cart_no);
		
		int result = cdao.qtyUp(cart_no, cdto.getPno_fk());
		out.println(result);
		
		
		return null;
	}

}
