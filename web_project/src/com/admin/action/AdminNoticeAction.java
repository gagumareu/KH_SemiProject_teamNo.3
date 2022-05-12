package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.NoticeDAO;
import com.apc.model.NoticeDTO;


public class AdminNoticeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 전체 리스트를 조회
		
		// 페이징 처리 작업 진행
		int rowsize = 5;		// 한 페이지당 보여질 게시물의 수
		int block = 3;			// 아래에 보여질 페이지 최대 수
		
		int totalRecord = 0;	// DB상의 게시물의 전체 수
		int allPage = 0;		// 전체 페이지 수
		int page = 0;			// 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
			
		}else {		// 처음으로 "전체 게시물 목록" a 태그를 선택한 경우
			page = 1;
		}
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
		
		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		// 해당 페이지에서 시작 블럭
		int startBlock = (((page - 1 ) / block) * block) + 1;
		
		// 해당 페이지에서 끝 블럭
		int endBlock = (((page - 1 ) / block) * block) + block;
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		List<NoticeDTO> list = dao.getNoticeList(page, rowsize);
		
		// DB상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord = dao.getNoticeCount();
		
		// 전체 게시물의 수를 한 페이지당 보여질 게시물의 수로 나누어 주어야 함.
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);

		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("noticeList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_notice.jsp");
		
		return forward;		

	}

}
