package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;

public class ProductsDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		int product_no = Integer.parseInt(request.getParameter("no").trim());
		String product_name = request.getParameter("name").trim();
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		List<ProductsDTO> clist = dao.getColor(product_name);
		
		List<ProductsDTO> slist = dao.getSize(product_name);
		
		ProductsDTO productDetail = dao.getProductDetail(product_no);
		
		request.setAttribute("Detail", productDetail);
		
		request.setAttribute("clist", clist);
		
		request.setAttribute("slist", slist);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("product/product_detail.jsp");
		
		
		
		return forward;
	}

}
