package com.admin.action;

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

public class AdminCategoryInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 카테고리 등록 폼 페이지에 입력된 값을 db에 저장하는 비즈니스 로직.
		


		//첨부파일
		String saveFolder = "C:\\Users\\ayss3\\Documents\\JSP_PROJECT\\web_project\\WebContent\\image_category";
		
		int fileSize = 1024*1024*10;	//10MB
				
		MultipartRequest multi = new MultipartRequest(
				request, 
				saveFolder, 
				fileSize, 
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		int c_no = Integer.parseInt(multi.getParameter("c_no"));
		String c_code = multi.getParameter("c_code");
		String c_name = multi.getParameter("c_name");
		String c_image = multi.getFilesystemName("c_image");
		
		System.out.println("c_code>>" +c_code);
		System.out.println("c_name>>" +c_name);
		
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(c_code.equals("")) {
			out.println("<script>");
			out.println("alert('상품코드를 입력해주세요')");
			out.println("history.back()");
			out.println("</script>");
			
		}else if(c_name.equals("")) {
			out.println("<script>");
			out.println("alert('상품명을 입력해주세요')");
			out.println("history.back()");
			out.println("</script>");
			
		}else {
			CategoryDTO dto = new CategoryDTO();
			
			dto.setCategory_no(c_no);
			dto.setCategory_code(c_code);
			dto.setCategory_name(c_name);
			dto.setCategory_image(c_image);
			
			
			CategoryDAO dao =  CategoryDAO.getInstance();
			
			int check = dao.insertCategory(dto);
			
			
			
			if(check>0) {
				forward.setRedirect(true);
				forward.setPath("admin_category_list.do");
				
				
			}else if(check==-1){
				out.println("<script>");
				out.println("alert('이미 존재하는 카테고리 코드입니다.')");
				out.println("history.back()");
				out.println("</script>");
				
			}else {
				out.println("<script>");
				out.println("alert('카테고리 추가에 실패했습니다.')");
				out.println("history.back()");
				out.println("</script>");								
			}					
		}						
		return forward;
	}

}
