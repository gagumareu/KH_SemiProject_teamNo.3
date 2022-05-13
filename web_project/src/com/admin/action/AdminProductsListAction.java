package com.admin.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;


public class AdminProductsListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//메인홈페이지에서 상품카테고리를 클릭하면 DB에서 상품리스트를 가져오는 비즈니스 로직.
		
		int rowsize = 10;
		int block=5;
		int totalRecode=0;		//db상의 전제 게시물
		int allPage = 0;		//전체 페이지 수
		
		int page=0;		//현재 페이지
		
		if(request.getParameter("page") !=null) {
			page =Integer.parseInt(request.getParameter("page").trim());
			
		}else {
			page = 1;
		}
		
		int startNo = (page * rowsize) - (rowsize-1);
		int endNo = (page *rowsize);
		int startBlock = (((page-1)/block)*block) +1;
		int endBlock = (((page-1)/block)*block) + block;
		
		ProductsDAO dao = ProductsDAO.getInstance();
		totalRecode = dao.getBoardCount();
		System.out.println("totalRecode >>" + totalRecode);
		
		allPage = (int)Math.ceil(totalRecode /(double)rowsize);
		
		if(endBlock>allPage) {
			endBlock = allPage;		
		}
		
		
		List<ProductsDTO> list = dao.getBoardList(page, rowsize);
		
		
		request.setAttribute("ProductsList", list);
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecode", totalRecode);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		 
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endNo", endNo);
		
		System.out.println("list>>" + list);
		
		ActionForward forward =  new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_products_list.jsp");

		return forward;
	}

}
