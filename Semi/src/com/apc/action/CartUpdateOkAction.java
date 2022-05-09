package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;

public class CartUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		int cart_no = Integer.parseInt(request.getParameter("cart_no"));
		String pColor = request.getParameter("color");
		String pSize = request.getParameter("size");

		CartDTO dto = new CartDTO();
		dto.setCart_no(cart_no);
		dto.setCart_pcolor(pColor);
		dto.setCart_psize(pSize);
		
		CartDAO cdao = CartDAO.getInstance();
		int result = cdao.updateCart(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			
			forward.setRedirect(true);
			forward.setPath("cart_main.do?mem_id=tlsruddus");
			
		}else if(result == -1){
			
			out.println("<script>");
			out.println("alert('해당 상품의 재고가 존재하지 않습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}else {
			
			out.println("<script>");
			out.println("alert('실패')");	
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
