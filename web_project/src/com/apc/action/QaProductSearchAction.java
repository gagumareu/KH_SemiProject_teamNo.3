package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;

public class QaProductSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//qa_popup_product.jsp에서 검색한 내용을 받아 DB에서 조회하여 뷰페이지로 전달하는 비즈니스 로직
		
		//페이징 처리
		int rowsize = 3; //보여줄 게시글 수
		int block = 3; //한번에 페이지 블록 단위
		int totalRecord = 0; // 전체 레코드 수
		int allPage = 0; //전체 페이지 수 
		
		int page = 0; //현재 페이지 수 
		
		if(request.getParameter("page") != null ) {
			
			page = Integer.parseInt(request.getParameter("page").trim());
			
		}else { //현재페이지가 null 인경우 , 최초 전체리스트 버튼(a 태그) 을 클릭하면 이부분이 실행됨
			page =1;  //1페이지가 나옴
		}
		
		//해당페이지에서 시작 번호
		int startNo = (page* rowsize) - (rowsize - 1);
		
		//해당페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		//해당 페이지에서 시작 블럭
		int startBlock = (((page-1)/ block)*block)+1; 

		//해당 페이지에서 끝 블럭
		int endBlock = (((page-1)/ block)*block)+block; 
		
		
		String search_field = request.getParameter("search_field").trim(); //제품명 또는 카테고리
		String search_word = request.getParameter("search_word").trim();
		
		ProductDAO dao = ProductDAO.getInstance();
		
		totalRecord = dao.getProductSearchCount(search_field, search_word);
		
		//검색한 내용
		List<ProductDTO> list = dao.getProductSearch(search_field, search_word, page, rowsize);

		//전체게시물의 수를 한 페이지당 보여질 게시물의 수로 나누어주어야함
		//이 과정을 거치면 전체 페이지수가 나옴
		//전체피이지수가 나올때 나머지가 있으면 무조건 페이지수를 하나 올려주어야하기때문에 Math.ceil메서드 사용
		allPage = (int)Math.ceil((totalRecord/(double)rowsize));

		if(endBlock>allPage) {
			endBlock = allPage; 
		}
		
		//지금까지 페이징 처리 시 작업했던 모든 값들을 view로 이동하기 
		request.setAttribute("Search", list);

		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("search_field", search_field);
		request.setAttribute("search_word", search_word);
		
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("board/qa_popup_product.jsp");
		
		
		return forward;
	}

}
