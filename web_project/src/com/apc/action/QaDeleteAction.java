package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.QaDAO;

public class QaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//qa_content.jsp에서 전달받은 번호를 확인하여 
		//DB상 데이터 삭제하는 비즈니스 로직
		
		int num = Integer.parseInt(request.getParameter("num"));
		int page = Integer.parseInt(request.getParameter("page"));

		QaDAO dao = QaDAO.getInstance();
		int result = dao.qaDelete(num);
		dao.adjustQaNo(num);

		ActionForward forward= new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			forward.setRedirect(true);
			forward.setPath("qa_list.do?num="+num+"&page="+page);
		}else {
			out.println("<script>");
			out.println("alert(qa게시글 삭제 실패)");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return forward;
	}

}
