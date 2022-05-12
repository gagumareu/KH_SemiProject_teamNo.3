package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.NoticeDAO;
import com.apc.model.NoticeDTO;

public class AdminNoticeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int notice_no = Integer.parseInt(request.getParameter("no").trim());
		int nowPage = Integer.parseInt(request.getParameter("page").trim());
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		NoticeDTO dto = dao.noticeContent(notice_no, 1);
		
		// upload 폴더에 업로드된 파일까지 삭제
		String upload = 
				"C:\\Users\\fontk\\git\\KH_SemiProjeckt_team3\\SemiProject\\WebContent\\upload\\notice";
		
		// DB에서 업로드된 파일을 가져오자.
		String fileName = dto.getNotice_image();		
			
		int check = dao.deleteNotice(notice_no);
				
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			if(fileName != null) {	// 첨부파일이 존재하는 경우
				File file = new File(upload + fileName);
				file.delete();		// 기존의 이진파일을 제거하는 메서드.		
			}
			
			forward.setRedirect(true);
			forward.setPath("admin_notice.do?page="+nowPage);

		}else {
			out.println("<script>");
			out.println("alert('공지사항 삭제가 실패되었습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
