package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;

public class ProductSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String keyword = request.getParameter("keyword").trim();
		
		ProductDAO dao = ProductDAO.getInstance();
		
		//20220512 이슬 코드 수정 : Products -> ProductDTO/DAO
		List<ProductDTO> list = dao.productSearch(keyword);
		
		request.setAttribute("productList", list);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();

		System.out.println(list.size());
		
		if(list.size() > 0) {
			forward.setRedirect(false);
			
			forward.setPath("product/product_search.jsp");
			
		}else {
			out.println("<script>");
			out.println("alert('검색된 제품이 없습니다 :(')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		
		return forward;
	}

}
