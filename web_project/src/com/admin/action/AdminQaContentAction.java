package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class AdminQaContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		int nowPage = Integer.parseInt(request.getParameter("page"));
		
		QaDAO dao = QaDAO.getInstance();
	
		QaDTO dto = dao.getQaContent(no);
		
		request.setAttribute("Cont", dto);
		request.setAttribute("page", nowPage);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("admin/admin_qa_content.jsp");
		
		return forward;
	}

}
