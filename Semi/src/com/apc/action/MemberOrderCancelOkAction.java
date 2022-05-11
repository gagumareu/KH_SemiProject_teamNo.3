package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class MemberOrderCancelOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		String mem_id = request.getParameter("mem_id");
		String pname = request.getParameter("pname");
		String pcolor = request.getParameter("pcolor");
		String psize = request.getParameter("psize");
		int pqty = Integer.parseInt(request.getParameter("pqty"));
		String category = request.getParameter("category");
		String cont = request.getParameter("content").trim();
		
		String title = pname + ' ' + pcolor + ' ' + psize + ' ' + pqty + "매 취소/환불";
		QaDTO dto = new QaDTO();
		
		dto.setQa_orderno(order_no);
		dto.setQa_title(title);
		dto.setQa_category(category);
		dto.setQa_memid(mem_id);
		dto.setQa_title(title);
		dto.setQa_cont(cont);
		dto.setQa_pno_fk(pno);
		
		QaDAO dao = QaDAO.getInstance();
		int result = dao.cancelQa(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			forward.setRedirect(true);
			forward.setPath("member_orderCancelView.do");
		}else {
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
