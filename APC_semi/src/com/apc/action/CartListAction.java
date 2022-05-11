package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.apc.model.MemberDAO;

public class CartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//session에 저장된 아이디에 해당하는 카트테이블 전체목록을 조회하여 장바구니 화면으로 이동하는 비즈니스 로직 
		
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("member_id");
		
		if(loginId == null) {//로그인되어있지 않다면,
			if(session.getAttribute("nonMember_id") == null) {//비회원 아이디도 생성되기 전이라면
				MemberDAO dao = MemberDAO.getInstance();
				loginId = dao.nonMemberId();
			}else {//비회원 아이디가 있다면
				loginId=(String) session.getAttribute("nonMember_id");
				
			}
		}
		
		CartDAO dao = CartDAO.getInstance();
		List<CartDTO> list = dao.getCartList(loginId);
		
		request.setAttribute("cartList", list);
		
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("cart/cart_main.jsp");
		
		return forward;
	}

}
