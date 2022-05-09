package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;
import com.apc.model.QaCategoryDAO;
import com.apc.model.QaCategoryDTO;

public class MemberWriteContactOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String mem_id = request.getParameter("mem_id");
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO member = dao.getMember(mem_id);
		
		request.setAttribute("memDTO", member);
		
		QaCategoryDAO qaDAO = QaCategoryDAO.getInstance();
		List<QaCategoryDTO> list = qaDAO.insertContact();
		
		request.setAttribute("qaList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("member/ContactView.jsp");
		
		return forward;
	}

}
