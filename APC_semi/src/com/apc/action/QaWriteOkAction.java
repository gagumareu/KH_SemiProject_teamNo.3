package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class QaWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//qa_write.jsp 글쓰기에서 전달받은 정보를 DB에 저장하는 비즈니스로직
		
		//form에서 넘겨받은 정보
		String qa_category = request.getParameter("qa_category");
		int pno = Integer.parseInt(request.getParameter("pno")); //원래 넘겨받은 제품정보
		int num = Integer.parseInt(request.getParameter("num")); // 직접선택한 제품정보
		String title = request.getParameter("qa_title");
		String writer = request.getParameter("qa_writer");
		String cont = request.getParameter("qa_cont");
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getMemberInfo(writer);
		
		String pwd = dto.getMempwd();
		int pno_fk = 0;
		
		if(pno == 0) {
			pno_fk = num;
		}else if(num == 0){
			pno_fk = pno;
		}

		QaDTO qdto = new QaDTO();
		
		qdto.setQa_category(qa_category);
		qdto.setQa_memid(writer);
		qdto.setQa_title(title);
		qdto.setQa_cont(cont);
		qdto.setQa_pwd(pwd);
		qdto.setQa_pno_fk(pno_fk);
		
		QaDAO qdao = QaDAO.getInstance();
		int result = qdao.qaInsert(qdto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			forward.setRedirect(true);
			forward.setPath("qa_list.do");
			
		}else {
			out.print("<script>");
			out.print("alert('게시글 등록 실패')");
			out.print("history.back()");
			out.print("</script>");
		}
		
		
		return forward;
	}

}
