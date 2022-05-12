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

public class productColorChooseAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String cColor = request.getParameter("cColor").trim();
		String cName = request.getParameter("cName").trim();
		String fullCode = request.getParameter("code").trim();	
		
		System.out.println("chose color code >>> " + fullCode);
		
		ProductsDAO dao = ProductsDAO.getInstance();
				
		ProductsDTO colorDto = dao.colorChoose(cColor, cName);
		
		List<ProductsDTO> clist = dao.getColor(cName);
		
		List<ProductsDTO> slist = dao.getSize(cName);
		
		CategoryDAO cDao = CategoryDAO.getInstance();
		
		CategoryDTO ctitleCode = cDao.getCategoryTitle(fullCode);
		
		CategoryDTO ltitleCode = cDao.getListTitle(fullCode);
		
		request.setAttribute("fullCode", fullCode);
		
		request.setAttribute("ltitleCode", ltitleCode);
		
		request.setAttribute("ctitleCode", ctitleCode);
		
		request.setAttribute("clist", clist);
		
		request.setAttribute("slist", slist);
		
		request.setAttribute("Detail", colorDto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("product/product_detail.jsp");
		
		
		return forward;
	}

}
