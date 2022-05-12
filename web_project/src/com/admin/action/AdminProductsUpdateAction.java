package com.admin.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;

public class AdminProductsUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 상품 번호에 해당하는 정보를 가져와 수정 폼 페이지로 보내는 비즈니스 로직.
		
		int product_no = Integer.parseInt(request.getParameter("no").trim());
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		ProductsDTO dto = dao.getProductCont(product_no);
		
		request.setAttribute("productCont", dto);
		
		String pimage = dto.getPimage();
		
		System.out.println("pimage>>" +pimage);
		
		//다중 파일이 들어갈 list 생성
		List<String> list = new ArrayList<String>();
		
		if(pimage!=null) {
			String[] splitStr = pimage.split(",");
			
			for(int i=0; i<splitStr.length; i++) {
				list.add(splitStr[i]);
			}
			
			request.setAttribute("pimageList",list);
			
			System.out.println("pimageList>>" +pimage);
			
			
		}
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_products_update.jsp");
		
		return forward;
	}

}
