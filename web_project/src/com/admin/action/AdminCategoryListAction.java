package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;

public class AdminCategoryListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 카테고리 클릭하면 db에서 정보를 받아와 카테고리 list 출력
		
		CategoryDAO dao = CategoryDAO.getInstance();
		
		List<CategoryDTO> list =  dao.getCategoryList();
		
		request.setAttribute("CategoryList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("admin/admin_categoryList.jsp");
		
		
		return forward;
	}

}
