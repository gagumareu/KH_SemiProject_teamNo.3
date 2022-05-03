package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;

public class ProductSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String keyword = request.getParameter("key").trim();
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		List<ProductsDTO> list = dao.productSearch(keyword);
		
		request.setAttribute("productList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("product/product_list.jsp");
		
		
		return forward;
	}

}
