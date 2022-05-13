package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class AdminQaReplyUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
			
		String reply_title = request.getParameter("reply_title").trim();
		String reply_content = request.getParameter("reply_content").trim().replace("\r\n","<br>");
				
		// hidden으로 넘어온 데이터들도 받아주어야 한다.
		int qa_no = Integer.parseInt(request.getParameter("qa_no").trim());
		String qa_category = request.getParameter("qa_category").trim();
		int qa_pno_fk = Integer.parseInt(request.getParameter("qa_pno_fk").trim());
		int qa_group = Integer.parseInt(request.getParameter("qa_group").trim());
		int qa_step = Integer.parseInt(request.getParameter("qa_step").trim());
		int qa_indent = Integer.parseInt(request.getParameter("qa_indent").trim());
		
		int nowPage = Integer.parseInt(request.getParameter("page"));
		
		QaDTO dto = new QaDTO();
		
		dto.setQa_no(qa_no);
		dto.setQa_category(qa_category);
		dto.setQa_title(reply_title);
		dto.setQa_cont(reply_content);
		dto.setQa_pno_fk(qa_pno_fk);
		dto.setQa_group(qa_group);
		dto.setQa_step(qa_step);
		dto.setQa_indent(qa_indent);
		
		
		QaDAO dao = QaDAO.getInstance();
		
		int check = dao.qaUpdate(dto, qa_no);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_qa_content.do?no="+ qa_no + "&page=" + nowPage + "&indent=" + qa_indent);
			
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 비밀번호를 확인해 주십시오.)");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('문의사항 답변 수정에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
