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

public class AdminNoticeUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 수정하기
					
		String saveFolder = 
				"C:\\Users\\ayss3\\Documents\\JSP_PROJECT\\web_project\\WebContent\\upload\\notice";
		
		int fileSize = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		String notice_title = multi.getParameter("n_title").trim();
		String notice_writer = multi.getParameter("n_writer").trim();
		String notice_cont = multi.getParameter("n_cont").trim().replace("\r\n","<br>");
		String notice_pwd = multi.getParameter("n_pwd").trim();
		int notice_no = Integer.parseInt(multi.getParameter("n_no").trim());
		int nowPage = Integer.parseInt(multi.getParameter("page"));
		
		String notice_image_new = multi.getFilesystemName("n_image_new");
		
		NoticeDTO dto = new NoticeDTO();
		
		if(notice_image_new == null) {	// 수정할 첨부파일 이미지가 없는 경우
			
			notice_image_new = multi.getParameter("n_image_old").trim();
			dto.setNotice_image(notice_image_new);
			
		}else {
			
			 String old_fileName = multi.getParameter("n_image_old").trim();
			 File file = new File(saveFolder + old_fileName);
			 file.delete();		// 기존의 이진파일을 제거하는 메서드.	

			 
			 File notice_file = multi.getFile("n_image_new");
			
	         String fileName = notice_file.getName();
	         
	         Calendar cal = Calendar.getInstance();
	         
	         int year = cal.get(Calendar.YEAR);
	         int month = cal.get(Calendar.MONTH) + 1;
	         int day = cal.get(Calendar.DAY_OF_MONTH);
	         
	         String homedir = saveFolder + "/" + year + "-" + month + "-" + day;
	         
	         File path1 = new File(homedir);
	         
	         if(!path1.exists()) {   // 폴더가 존재하지 않으면
	            path1.mkdir();
	         }
	         
	         String reFileName = notice_writer + "_" + fileName;
	         
	         notice_file.renameTo(new File(homedir + "/" + reFileName));
	         
	         // 실제 DB에 저장되는 파일 이름
	         String fileDBName = "/" + year + "-" + month + "-" + day + "/" + reFileName;
	         
	         dto.setNotice_image(fileDBName);
		}
		
		dto.setNotice_no(notice_no);
		dto.setNotice_writer(notice_writer);
		dto.setNotice_title(notice_title);
		dto.setNotice_cont(notice_cont);
		dto.setNotice_pwd(notice_pwd);
		
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		int check = dao.updateNotice(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_notice_content.do?no="+notice_no + "&page=" + nowPage);
			
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 다시 한번 확인해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
		
		}else {
			out.println("<script>");
			out.println("alert('공지사항 수정이 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
