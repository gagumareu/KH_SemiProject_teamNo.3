package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;

public class AdminCategoryDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 카테고리 삭제 
		
		//저장 된 파일 삭제
		String saveFolder = "C:\\Users\\jsjo5\\git\\KH_SemiProjeckt_teamNo3_da\\web_project\\WebContent\\image_category";
		
		String c_image = request.getParameter("image");
		System.out.println("image>>" + c_image);
		
		File file = new File(saveFolder +"/" + c_image);
		
		file.delete();
		
		
		String category_code = request.getParameter("code");
		
		CategoryDAO dao = CategoryDAO.getInstance();
		
		int check = dao.categoryDelete(category_code);
		
		PrintWriter out  = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(check>0) {
			forward.setRedirect(true);
			forward.setPath("admin_category_list.do");
		}else {
			out.println("<script>");
			out.println("alert('카테고리 삭제에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
				
		
		
		return forward;
	}

}
