package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class QaCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//qa_list.jsp에서 선택박스 이벤트 있을경우 카테고리 코드를 받아 해당하는 게시물 정보를 조회하여
		//뷰페이지로 이동하는 비즈니스 로직 
		
		//넘겨받은 코드
		String code = request.getParameter("code");
		
		int rowsize = 3 ; 
		int block = 3 ;
		int totalRecord = 0;
		int allPage = 0 ;
		
		int page =0 ;
		
		if(request.getParameter("page") != null ) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1; 
		}
		
		int startNo = (page * rowsize) - (rowsize-1);
		int endNo = page*rowsize; 
		
		int startBlock = (((page-1)/block)*block)+1;
		int endBlock = (((page-1)/block)*block)+block;
		
		QaDAO dao = QaDAO.getInstance();
		
		totalRecord = dao.getBoardCount(code); //코드에 해당하는 레코드 수 구하기
		
		allPage = (int)( Math.ceil(totalRecord/(double)rowsize));
		
		if(endBlock>allPage) {
			endBlock = allPage; 
		}
		
		List<QaDTO> list = dao.getQaList(code, page, rowsize);
		ActionForward forward = new ActionForward();
		
		if(code.equalsIgnoreCase("all")) {
			forward.setRedirect(true);
			forward.setPath("qa_list.do");
		}else {
		
		request.setAttribute("List", list);

		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("code", code);
		
	
		forward.setRedirect(false);
		forward.setPath("board/qa_list_category.jsp");
		}
		return forward;
	}

}
