package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.QaDAO;

public class AdminQaReplyDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int qa_no = Integer.parseInt(request.getParameter("no").trim());
		int nowPage = Integer.parseInt(request.getParameter("page").trim());
		int qa_group = Integer.parseInt(request.getParameter("group").trim());
		
		QaDAO dao = QaDAO.getInstance();
		
		int check = dao.qaDelete(qa_no);
		
		dao.adjustQaIndent(qa_no, qa_group);
		dao.adjustQaNo(qa_no);
		
		
		System.out.println(qa_no);
		System.out.println(qa_group);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_qa.do?page="+nowPage);
		}else {
			out.println("<script>");
			out.println("alert('문의사항 답변 삭제가 실패되었습니다.')");
			out.println("history.back()");			
			out.println("</script>");
		}
		
		return forward;
		
	}

}
