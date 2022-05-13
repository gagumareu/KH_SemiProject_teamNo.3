package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;

public class AdminCategoryUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 수정을 누르면 수정 페이지 db에 있는 내용을 가져와 수정 폼에 전달.
		
		String category_code = request.getParameter("code").trim();
		
		CategoryDAO dao = CategoryDAO.getInstance();
		CategoryDTO dto = dao.categoryContent(category_code);
		
		request.setAttribute("CategoryCont", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_categort_update.jsp");

		
 		return forward;
	}

}
