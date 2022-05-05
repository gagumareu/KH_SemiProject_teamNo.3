package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;


public class AdminQaAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// QnA 전체리스트 조회
		
		QaDAO dao = QaDAO.getInstance();
		
		List<QaDTO> list = dao.getQaList();
		
		request.setAttribute("qaList", list);
				
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_QnA.jsp");
		
		return forward;
	}

}
