package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;

public class productColorChooseAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String color = request.getParameter("cColor").trim();
		String product_name = request.getParameter("name").trim();
			
		ProductsDAO dao = ProductsDAO.getInstance();
				
		ProductsDTO colorDto = dao.colorChoose(color, product_name);
		
		List<ProductsDTO> clist = dao.getColor(product_name);
		
		List<ProductsDTO> slist = dao.getSize(product_name);
		
		request.setAttribute("clist", clist);
		
		request.setAttribute("slist", slist);
		
		request.setAttribute("Detail", colorDto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("product/product_detail.jsp");
		
		
		return forward;
	}

}
