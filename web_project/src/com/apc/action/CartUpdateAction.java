package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;

public class CartUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		int cart_no = Integer.parseInt(request.getParameter("num"));

		CartDAO cdao = CartDAO.getInstance();
		CartDTO cdto = cdao.getCartContent(cart_no);

		String pname = cdto.getCart_pname();
		String subStr = pname.substring(0,5);

		System.out.println(pname);
		
		ProductDAO pdao = ProductDAO.getInstance();
		ProductDTO	pdto = pdao.getProductCont(cdto.getPno_fk());
		List<String> pColor = pdao.getPColor(subStr);
		List<String> pSize = pdao.getPSize(subStr);	
		
		request.setAttribute("cartDTO", cdto);
		request.setAttribute("productDTO", pdto);
		request.setAttribute("colorList", pColor);
		request.setAttribute("sizeList", pSize);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("member/cart_update.jsp");
				
		return forward;
	}

}
