package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class QaUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//qa_update.jsp에서 수정한 내용을 DB에 저장 후 VIEWPAGE로 이동하는 비즈니스 로직
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		String qa_title = request.getParameter("qa_title");
		String qa_cont = request.getParameter("qa_cont");
		
		QaDAO dao = QaDAO.getInstance();
		QaDTO dto = new QaDTO();
		
		dto.setQa_title(qa_title);
		dto.setQa_cont(qa_cont);
		
		int result = dao.qaUpdate(dto, num);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			forward.setRedirect(true);
			forward.setPath("qa_content.do?num="+num+"&page="+page);
		}else {
			out.println("<script>");
			out.println("alert('수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
