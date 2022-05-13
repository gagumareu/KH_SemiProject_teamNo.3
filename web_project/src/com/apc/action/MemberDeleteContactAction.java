package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.QaDAO;

public class MemberDeleteContactAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int qa_no = Integer.parseInt(request.getParameter("no"));
		String id = request.getParameter("id");
		System.out.println(id);

		QaDAO qadao = QaDAO.getInstance();
		int result = qadao.qaDelete(qa_no);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result >0) {
			
			forward.setRedirect(true);
			forward.setPath("member_contactView.do?id=" + id);
			
		}else {
			
			out.println("<script>");
			out.println("alert('실패')");	
			out.println("history.back()");
			out.println("</script>");
			
		}
		
		return forward;
	}

}
