package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;

public class CartUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		int cart_no = Integer.parseInt(request.getParameter("cart_no"));
		String pColor = request.getParameter("color");
		String pSize = request.getParameter("size");
		String id = request.getParameter("id");
		String pname = request.getParameter("pname");
		
		ProductDAO pdao = ProductDAO.getInstance();
		ProductDTO pdto = pdao.getProductCont(pname,pColor, pSize);
		
		String [] arrImg = pdao.getPorudctImg(pdto);
		
		CartDTO dto = new CartDTO();
		dto.setCart_no(cart_no);
		dto.setCart_pcolor(pColor);
		dto.setCart_psize(pSize);
		dto.setCart_pname(pname);
		dto.setPno_fk(pdto.getPno());
		dto.setCart_pimage(arrImg[0]);
		
		CartDAO cdao = CartDAO.getInstance();
		int result = cdao.updateCart(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			
			forward.setRedirect(true);
			forward.setPath("cart_main.do?id=" + id);
			
		}else {
			
			out.println("<script>");
			out.println("alert('실패')");	
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
