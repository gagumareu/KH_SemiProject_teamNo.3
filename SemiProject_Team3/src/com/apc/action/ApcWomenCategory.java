package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;

public class ApcWomenCategory implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		CategoryDAO dao = CategoryDAO.getInstance();
		
		List<CategoryDTO> list = dao.womenCategory(no);
		
		request.setAttribute("wCategory", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_wCategory_list.jsp");
		
		return forward;
	}

}
