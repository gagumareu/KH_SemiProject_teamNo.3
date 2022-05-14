package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;

public class goPayFromCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		String loginId = (String) session.getAttribute("member_id");
		
		CartDAO dao = CartDAO.getInstance();
		
		MemberDAO dao2 = MemberDAO.getInstance();
		
		List<CartDTO> list = dao.getCartList(loginId);
		MemberDTO dto = dao2.orderMemberInfo(loginId);
		
		ActionForward forward= new ActionForward();
		
		request.setAttribute("cartInfo", list);
		request.setAttribute("memberInfo", dto);
		
		
		forward.setRedirect(false);
		forward.setPath("member/member_order.jsp");
		
		return forward;
	}

}