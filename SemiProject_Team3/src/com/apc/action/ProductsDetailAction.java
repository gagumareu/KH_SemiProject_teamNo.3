package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;

public class ProductsDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String product_no = request.getParameter("no").trim();
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		dao.getProductDetail(product_no);
		
		
		
		return null;
	}

}
