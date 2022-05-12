package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;
import com.apc.model.ProductDTO;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;

public class X_ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		String fullCode = request.getParameter("code").trim();  //code : xxxx0000
		String code1 = fullCode.substring(0, 1);  // code : 첫번째 자리 
//		String code5 = fullCode.substring(0,5);   // 이슬님 로직
		
		System.out.println("list fullCode >>>" + fullCode);
		System.out.println("list code1 >>>" + code1);
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
//		List<ProductDTO> productlist = dao.getProductList(code5); // 이슬님 로직

		List<ProductsDTO> dto = dao.getShopProductList(fullCode);
		
		request.setAttribute("productList", dto);
		request.setAttribute("fullCode", fullCode);
		
		// 상단 카테고리 title  
		CategoryDAO cDao = CategoryDAO.getInstance();	
		CategoryDTO ctitleCode = cDao.getCategoryTitle(fullCode);		
		CategoryDTO ltitleCode = cDao.getListTitle(fullCode);	  // 앞 4자리 	
		
		CategoryDTO cDto = cDao.getUpperCategory(fullCode);  // 이슬님 로직
		request.setAttribute("upperCode", cDto.getCategory_code());

		
		request.setAttribute("code1", code1);
		request.setAttribute("ltitleCode", ltitleCode);		
		request.setAttribute("ctitleCode", ctitleCode);
				
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("product/product_list.jsp");
		
		return forward;
	}

}
