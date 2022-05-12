package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;

public class CartMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String mem_id = request.getParameter("id");

		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO member = dao.getMember(mem_id);

		CartDAO cdao = CartDAO.getInstance();
		List<CartDTO> list = cdao.getCartList(mem_id);
		
		int pSum = 0, mSum = 0, transCost = 3000;
		for(int i = 0; i < list.size(); i++) {
			pSum += list.get(i).getCart_price() * list.get(i).getCart_pqty();
			mSum += list.get(i).getCart_mileage() * list.get(i).getCart_pqty();
		}
		if(pSum > 1000000) {
			transCost = 0;
		}
		
		request.setAttribute("memDTO", member);
		request.setAttribute("cartList", list);
		request.setAttribute("price_sum", pSum);
		request.setAttribute("mileage_sum", mSum);
		request.setAttribute("tCost", transCost);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("cart/cart_main.jsp");
		
		return forward;
	}

}
