package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.NoticeDAO;
import com.apc.model.NoticeDTO;

public class AdminNoticeUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int notice_no = Integer.parseInt(request.getParameter("no").trim());
		int nowPage = Integer.parseInt(request.getParameter("page"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		NoticeDTO dto = dao.noticeContent(notice_no, 2);
				
		request.setAttribute("noticeCont", dto);
		request.setAttribute("page", nowPage);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_notice_update.jsp");
		
		return forward;
	}

}
