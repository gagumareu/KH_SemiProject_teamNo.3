package com.apc.action;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;

public class semiOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String member_id = request.getParameter("member_id").trim();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		CartDAO dao2 = CartDAO.getInstance();
		
		MemberDTO dto = dao.orderMemberInfo(member_id);
		
		List<CartDTO> list = dao2.orderCartInfo(member_id);
		
		request.setAttribute("memberInfo", dto);
		
		request.setAttribute("cartInfo", list);
		
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);  // 장바구니 들어오면 true로 변경
		forward.setPath("member/member_order.jsp");
		

		return forward;
	}

}
