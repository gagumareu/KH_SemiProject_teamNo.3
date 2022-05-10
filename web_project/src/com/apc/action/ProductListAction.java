package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String fullCode = request.getParameter("code").trim();  //code : xxxx0000
		
		System.out.println("list code >>>" + fullCode);
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		List<ProductsDTO> dto = dao.getShopProductList(fullCode);
		
		request.setAttribute("productList", dto);
		request.setAttribute("fullCode", fullCode);
		
		// 상단 카테고리 title  
		CategoryDAO cDao = CategoryDAO.getInstance();	
		CategoryDTO ctitleCode = cDao.getCategoryTitle(fullCode);		
		CategoryDTO ltitleCode = cDao.getListTitle(fullCode);				
		request.setAttribute("ltitleCode", ltitleCode);		
		request.setAttribute("ctitleCode", ctitleCode);
				
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("product/product_list.jsp");
		
		return forward;
	}

}
