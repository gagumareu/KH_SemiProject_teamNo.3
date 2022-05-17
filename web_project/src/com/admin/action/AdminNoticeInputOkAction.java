package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.NoticeDAO;
import com.apc.model.NoticeDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminNoticeInputOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 저장

		NoticeDTO dto = new NoticeDTO();
		
		// 첨부파일 저장 경로
		String saveFolder = 
			"C:\\Users\\ayss3\\Documents\\JSP_PROJECT\\web_project\\WebContent\\upload\\notice";
		
		// 첨부파일 최대 크기
		int fileSize = 10 * 1024 * 1024;
		
		// 이진 파일 업로드를 위한 객체 생성
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		String notice_title = multi.getParameter("n_title");
		String notice_writer = multi.getParameter("n_writer");
		String notice_cont = multi.getParameter("n_cont").replace("\r\n","<br>");
		String notice_pwd = multi.getParameter("n_pwd");
		
		File notice_file = multi.getFile("n_file");
		
		if(notice_file != null) {
			
			String fileName = notice_file.getName();
			
			Calendar cal = Calendar.getInstance();
			
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1 ;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			
			// ....../upload/notice/2022-MM-DD
			String homedir = saveFolder + "/notice/" + year + "-" + month + "-" + day;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdir();
			}
			
			String reFileName = notice_writer + "_" + fileName;
			
			notice_file.renameTo(new File(homedir + "/" + reFileName));
			
			// DB저장 파일명
			String fileDBName = "/" + year + "-" + month + "-" + day + "/" + reFileName;
			
			dto.setNotice_image(fileDBName);
		}
		
		dto.setNotice_writer(notice_writer);
		dto.setNotice_title(notice_title);
		dto.setNotice_cont(notice_cont);
		dto.setNotice_pwd(notice_pwd);
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		int check = dao.insertNotice(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_notice.do");
		}else {
			out.println("<script>");
			out.println("alert('공지사항 등록이 실패되었습니다. 다시 한번 확인해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
