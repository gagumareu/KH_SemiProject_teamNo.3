package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.NoticeDAO;
import com.apc.model.NoticeDTO;


public class AdminNoticeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 상세정보 view page로 보내기
		
		int notice_no = Integer.parseInt(request.getParameter("no").trim());
		int nowPage = Integer.parseInt(request.getParameter("page"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		// 조회수 증가
		// dao.noticeHit(notice_no);
		
		// 상세내역 조회
		NoticeDTO dto = dao.noticeContent(notice_no, 1);
		
		request.setAttribute("noticeCont", dto);
		request.setAttribute("page", nowPage);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_notice_content.jsp");
		
		return forward;
	}

}
