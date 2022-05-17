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

public class SemiCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		CartDAO dao = CartDAO.getInstance();
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("member_id");
		
		List<CartDTO> list = dao.getSemiCartList(id);
		
		request.setAttribute("semiCartList", list);
		
		ActionForward forward = new ActionForward();
		
		
		forward.setRedirect(false);
		
		forward.setPath("index.jsp");
		
		
		return forward;
	}

}
