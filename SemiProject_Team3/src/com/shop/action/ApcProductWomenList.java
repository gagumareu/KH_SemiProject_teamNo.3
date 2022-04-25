package com.shop.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ApcProductDAO;
import com.apc.model.ApcProductDTO;

public class ApcProductWomenList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		
		ApcProductDAO dao = ApcProductDAO.getInstance();
		
		List<ApcProductDTO> dto = dao.apcProductWomenList();
		
		request.setAttribute("womenList", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_women_list.jsp");
		
		return forward;
	}

}
