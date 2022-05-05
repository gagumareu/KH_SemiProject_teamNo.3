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
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		List<NoticeDTO> list = dao.getNoticeList();
		
		request.setAttribute("noticeList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_notice.jsp");
		
		return forward;		

	}

}
