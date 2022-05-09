package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;


public class AdminProductsDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 넘어온 번호에 해당하는 상품을 삭제하는 비즈니스 로직.
		
		int product_no = Integer.parseInt(request.getParameter("no").trim());
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		int check = dao.productDelete(product_no);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check>0) {
			forward.setRedirect(true);
			forward.setPath("admin_products_list.do");			
		}else {
			out.println("<script>");
			out.println("alert('상품 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return forward;
	}

}
