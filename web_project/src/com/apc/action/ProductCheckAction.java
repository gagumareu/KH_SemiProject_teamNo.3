package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;

public class ProductCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//product_detail.jsp에서 칼라를 클릭하면 칼라에 해당하는 제품 pno를 찾아
		//product_detail.do로 다시 전달해주는 중간 연결 비즈니스 로직 
		
		String pname = request.getParameter("name").trim();
		String color = request.getParameter("color").trim();
		
		System.out.println("pname:"+pname);
		System.out.println("color:"+color);
		
		ProductDAO dao = ProductDAO.getInstance();
		ProductDTO dto = dao.getProductCont(pname, color);
		
		ActionForward forward = new ActionForward();
		
		System.out.println("pno:"+dto.getPno());
		System.out.println("pCOLOR:"+dto.getPcolor());
		System.out.println("pSIZE:"+dto.getPsize());
		
		forward.setRedirect(true);
		forward.setPath("product_detail.do?num="+dto.getPno()+"&color="+dto.getPcolor()+"&size="+dto.getPsize());
		
		return forward;
	}

}
