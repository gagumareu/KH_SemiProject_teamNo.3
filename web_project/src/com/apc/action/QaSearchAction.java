package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductDAO;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class QaSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//qa_list.jsp에서 검색한 정보를 받아 DB에서 조회하여
		//view page에 전달하는 비즈니스 로직 
		
		String search_field = request.getParameter("search_field").trim();
		String search_word = request.getParameter("search_word").trim();
		
		int rowsize = 3;
		int block = 3;
		int totalRecord= 0;
		int allPage = 0 ;
		
		int page = 0 ;
		
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

		QaDAO dao = QaDAO.getInstance();
		
		totalRecord = dao.getSearchCount(search_field, search_word);
		
		allPage = (int)Math.ceil((totalRecord/(double)rowsize));
		
		if(endBlock>allPage) {
			endBlock = allPage; 
		}

		List<QaDTO> list = dao.getSearchList(search_field, search_word, page, rowsize);
		
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
		forward.setPath("board/qa_search.jsp");
		
		
		return forward;
	}

}
