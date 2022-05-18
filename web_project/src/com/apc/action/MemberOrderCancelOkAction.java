package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CancelDAO;
import com.apc.model.CancelDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberOrderCancelOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 첨부파일이 저장될 위치(경로)를 설정.
		String saveFolder = 
			"C:\\Users\\JUNGHWAN\\Documents\\SourceTree\\SourceTree_main\\web_project\\WebContent\\upload";
			
		// 첨부파일 용량(크기) 제한 - 파일 업로드 최대 크기
		int fileSize = 50 * 1024 * 1024;  // 10MB
				
		// 이미지파일 업로드를 위한 객체 생성
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
		);
		
		int order_no = Integer.parseInt(multi.getParameter("order_no"));
		int pno = Integer.parseInt(multi.getParameter("pno"));
		String mem_id = multi.getParameter("mem_id");
		String pname = multi.getParameter("pname");
		String pcolor = multi.getParameter("pcolor");
		String psize = multi.getParameter("psize");
		int pqty = Integer.parseInt(multi.getParameter("pqty"));
		String category = multi.getParameter("category");
		String image = multi.getFilesystemName("image");
		String cont = multi.getParameter("content").trim();
		
		CancelDTO dto = new CancelDTO();
		
		dto.setOrderno_fk(order_no);
		dto.setPno_fk(pno);
		dto.setMemid_fk(mem_id);
		dto.setPname(pname);
		dto.setPcolor(pcolor);
		dto.setPsize(psize);
		
		dto.setPqty(pqty);
		dto.setCancel_category(category);
		dto.setCancel_cont(cont);
		dto.setCancel_image(image);
		
		CancelDAO dao = CancelDAO.getInstance();
		int result = dao.insertCancel(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			forward.setRedirect(true);
			forward.setPath("member_orderCancelView.do?id="+mem_id);
		}else {
			out.println("<script>");
			out.println("alert('사진 용량이 너무 큽니다.(10MB 이하)')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
