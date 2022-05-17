package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//category_main2.jsp에서 넘어온 번호에 해당하는 제품리스트를 조회하여
		//view page로 이동하는 비즈니스 로직
		
		//참고: 골프-악세사리는 3A000000으로 넘어옴 그외는 코드4자리+0000
		String fullcode = request.getParameter("code").trim();
		String code = fullcode.substring(0,5);
		
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> productlist = dao.getProductList(code);
		
		//현재 단계에있는 카테고리 상위의 카테고리 정보를 가져오기 
		CategoryDAO cDao = CategoryDAO.getInstance();
		CategoryDTO cDto = cDao.getUpperCategory(fullcode);
		
		System.out.println("uppderCode"+cDto.getCategory_code());
		
		
		request.setAttribute("productList", productlist);
		request.setAttribute("upperCode", cDto.getCategory_code());
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("product/product_list.jsp");
		
		
		
		
		return forward;
	}

}
