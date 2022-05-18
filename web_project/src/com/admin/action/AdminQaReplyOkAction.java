package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class AdminQaReplyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 문의사항 답변 저장하기
		
		String reply_title = request.getParameter("reply_title").trim();
		String reply_content = request.getParameter("reply_content").trim().replace("\r\n","<br>");
		
		int qa_no = Integer.parseInt(request.getParameter("qa_no").trim());
		String qa_category = request.getParameter("qa_category").trim();
		
		int qa_pno_fk = 0;
		
		try {
			qa_pno_fk = Integer.parseInt(request.getParameter("qa_pno_fk").trim());
		}catch(Exception e){
			
		}
		
		int qa_group = Integer.parseInt(request.getParameter("qa_group").trim());
		int qa_step = Integer.parseInt(request.getParameter("qa_step").trim());
		int qa_indent = Integer.parseInt(request.getParameter("qa_indent").trim());
		
		int nowPage = Integer.parseInt(request.getParameter("page"));
		
		
		QaDTO dto = new QaDTO();
		
		dto.setQa_no(qa_no);
		dto.setQa_category(qa_category);
		dto.setQa_title(reply_title);
		dto.setQa_cont(reply_content);
		if(qa_pno_fk > 0) {
			dto.setQa_pno_fk(qa_pno_fk);
		}		
		dto.setQa_group(qa_group);
		dto.setQa_step(qa_step);
		dto.setQa_indent(qa_indent);
		
		QaDAO dao = QaDAO.getInstance();
		
		// 원글에 기존에 작성했던 답변글이 존재하는 경우
		// 해당 답변글에 step을 하나 증가시켜주는 메서드 호출
		//dao.replyUpdate(qa_group, qa_step);
		
		// 답변글을 DB에 저장하는 메서드 호출
		int check = dao.replyQa(dto);
				
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0 ) {
			forward.setRedirect(true);
			forward.setPath("admin_qa.do?page="+nowPage);
		}else {
			out.println("<script>");
			out.println("alert('문의사항 답변글 등록에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
