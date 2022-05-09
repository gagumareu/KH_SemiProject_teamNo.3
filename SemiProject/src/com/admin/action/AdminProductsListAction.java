package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;

public class AdminProductsListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//메인홈페이지에서 상품카테고리를 클릭하면 DB에서 상품리스트를 가져오는 비즈니스 로직.
		
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		List<ProductsDTO> list = dao.getProductList();
		
		
		request.setAttribute("ProductsList", list);
		
		System.out.println("list>>" + list);
		
		ActionForward forward =  new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_products_list.jsp");

		return forward;
	}

}
