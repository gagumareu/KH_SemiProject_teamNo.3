package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;

public class ApcProductWomenList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String code = request.getParameter("code").trim();
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		List<ProductsDTO> dto = dao.apcProductWomenList(code);
		
		request.setAttribute("womenList", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_wNew_list.jsp");
		
		return forward;
	}

}
