package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminCategoryUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 수정 폼 페이지에서 수정이 완료되면 db로 데이터를 이동시킨다. 
		
		//첨부파일
		String saveFolder = "C:\\Users\\ayss3\\Documents\\JSP_PROJECT\\web_project\\WebContent\\image_category";
		
		int fileSize = 1024*1024*10;
		
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize,"UTF-8", new DefaultFileRenamePolicy());
		
		int c_no = Integer.parseInt(multi.getParameter("c_no").trim());
		String c_code = multi.getParameter("c_code").trim();
		String c_name = multi.getParameter("c_name").trim();
	
		
		String c_image_new;
		String c_image_old;
		
		if(multi.getFilesystemName("c_image_new")==null) {
			c_image_new = multi.getParameter("c_image_old");
	
		}else {
			c_image_new = multi.getFilesystemName("c_image_new");
			c_image_old = multi.getParameter("c_image_old");
			File file = new File(saveFolder +"/"+ c_image_old);
			file.delete();
			
			
		}
		System.out.println("파일이름>>" + c_image_new);
		
		CategoryDTO dto = new CategoryDTO();
		
		dto.setCategory_no(c_no);
		dto.setCategory_code(c_code);
		dto.setCategory_name(c_name);
		dto.setCategory_image(c_image_new);
		
		
		CategoryDAO dao =  CategoryDAO.getInstance();
		
		int check = dao.CategoryUpdate(dto);
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(check>0) {
			forward.setRedirect(true);
			forward.setPath("admin_category_list.do");
			
			
		}else {
			out.println("<script>");
			out.println("alert('카테고리 수정에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
				
		return forward;
	}

}
