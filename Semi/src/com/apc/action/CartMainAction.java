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

		String mem_id = request.getParameter("mem_id");

		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO member = dao.getMember(mem_id);

		CartDAO cdao = CartDAO.getInstance();
		List<CartDTO> list = cdao.getCartList(mem_id);
		
		request.setAttribute("memDTO", member);
		request.setAttribute("cartList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("cart/cart_main.jsp");
		
		
		return forward;
	}

}
