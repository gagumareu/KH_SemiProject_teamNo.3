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

public class X_ProductsDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		int product_no = Integer.parseInt(request.getParameter("no").trim());
		String product_name = request.getParameter("name").trim();
		String fullCode = request.getParameter("code").trim();
		
		System.out.println("detail >>> " + fullCode);
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		List<ProductsDTO> clist = dao.getColor(product_name);
		
		List<ProductsDTO> slist = dao.getSize(product_name);
		
		ProductsDTO productDetail = dao.getProductCont(product_no);
		
		// 상단 카테고리 네이 네비링크 
		CategoryDAO cDao = CategoryDAO.getInstance();
		
		CategoryDTO ctitleCode = cDao.getCategoryTitle(fullCode);
		
		CategoryDTO ltitleCode = cDao.getListTitle(fullCode);
	
		request.setAttribute("fullCode", fullCode);
		
		request.setAttribute("ltitleCode", ltitleCode);  // 앞 네자리(카테고리분류) 
		
		request.setAttribute("ctitleCode", ctitleCode);  // 앞 한자리 (남녀골프 분류)
		
		request.setAttribute("Detail", productDetail);
		
		request.setAttribute("clist", clist);
		
		request.setAttribute("slist", slist);
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("product/product_detail.jsp");
		
		
		
		return forward;
	}

}
