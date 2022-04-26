package com.apc.action;

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


public class InputCategory implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String saveFolder = "C:\\Users\\JUNGHWAN\\git\\SemiProject\\SemiProject_Team3\\WebContent\\upload";
		
		int fileSize = 50 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request, 
				saveFolder, 
				fileSize, 
				"UTF-8",
				new DefaultFileRenamePolicy()
		);
		
		int cno = Integer.parseInt(multi.getParameter("cno").trim());
		String ccode = multi.getParameter("ccode").trim();
		String cname = multi.getParameter("cname").trim();
		String cimage = multi.getFilesystemName("cimage");
		
		CategoryDTO dto = new CategoryDTO();
		
		dto.setCategory_no(cno);
		dto.setCategory_code(ccode);
		dto.setCategory_name(cname);
		dto.setCategory_image(cimage);
		
		CategoryDAO dao = CategoryDAO.getInstance();
		
		int check = dao.inputCategory(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(false);
			forward.setPath("shop/shop_wCategory_list.jsp");
			
		}else {
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		
		
		return forward;
	}

}
