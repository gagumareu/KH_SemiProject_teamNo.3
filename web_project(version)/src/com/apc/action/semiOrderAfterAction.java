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

public class semiOrderAfterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String member_id = request.getParameter("member_id");
		
		CartDAO dao = CartDAO.getInstance();
		
		MemberDAO dao2 = MemberDAO.getInstance();
		
		List<CartDTO> list = dao.getCartList(member_id);
		MemberDTO dto = dao2.getMemberInfo(member_id);
		
		
		request.setAttribute("cartInfo", list);
		request.setAttribute("memberInfo", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);  // 장바구니 들어오면 true로 변경
		forward.setPath("member/member_orderlist.jsp");
		
		return forward;
	}

}
