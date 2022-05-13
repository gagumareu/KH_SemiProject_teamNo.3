package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;

public class CartQtyUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int cart_no = Integer.parseInt(request.getParameter("num"));
		
		CartDAO cdao = CartDAO.getInstance();
		CartDTO cdto = cdao.getCartContent(cart_no);

		int result = cdao.qtyUp(cart_no, cdto.getPno_fk());
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			
			forward.setRedirect(true);
			forward.setPath("cart_main.do");
			
		}else {
			
			out.println("<script>");
			out.println("alert('재고가 부족합니다.')");	
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
