package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;


public class AdminProductsDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 넘어온 번호에 해당하는 상품을 삭제하는 비즈니스 로직.
		
		//이미지 삭제하기
		String saveFolder="C:\\Users\\JUNGHWAN\\git\\SemiProject_teamNo.3\\web_project\\WebContent\\image_products";
		
		String pimage = request.getParameter("image");
		
		String[] splitStr = pimage.split(",");
		for(int i=0; i<splitStr.length; i++) {
			File file = new File(saveFolder + splitStr[i]);
			file.delete();
		}
		
		
		int product_no = Integer.parseInt(request.getParameter("no").trim());
		
		System.out.println("produc_delte >> " + product_no);
		
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
