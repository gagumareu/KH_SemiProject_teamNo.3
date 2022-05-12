package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class QaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//QA게시판 목록을 불러와 VIEW PAGE로 이동시키는 비즈니스 로직 
		
		//페이징처리
		int rowsize= 3; //한페이지당 보여질 게시글 수 
		int block = 3; //아래 보여질 페이지 수 
		int totalRecord = 0;    // DB상의 게시물의 전체 수 
		int allPage =0;         //전체페이지 수
		
		int page = 0 ; //현재 페이지  나타내는 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			
		}else {
			page = 1; 
		} 
		
		//해당페이지에서 시작번호
		int startNo = (page*rowsize) - (rowsize-1);
		
		//해당 페이지에서 끝번호
		int endNo=(page*rowsize);
		
		//해당페이지에서 시작블럭
		int startBlock= (((page-1)/block)*block)+1;
		
		//해당페이지에서 끝블럭
		int endBlock = (((page-1)/block)*block)+block;
		
		
		
		QaDAO dao = QaDAO.getInstance();
		
		totalRecord = dao.getBoardCount();
		
		
		//전체게시물의 수를 한 페이지당 보여질 게시물의 수로 나누어주어야함
		//이 과정을 거치면 전체 페이지수가 나옴
		//전체피이지수가 나올때 나머지가 있으면 무조건 페이지수를 하나 올려주어야하기때문에 Math.ceil메서드 사용
		allPage = (int)Math.ceil((totalRecord/(double)rowsize));
		
		if(endBlock>allPage) {
			endBlock = allPage; 
		}
		
		List<QaDTO> list = dao.getQaList(page, rowsize);
		
		//지금까지 페이징 처리 시 작업했던 모든 값들을 view로 이동하기 
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
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("board/qa_list.jsp");
		
		return forward;
	}

}
