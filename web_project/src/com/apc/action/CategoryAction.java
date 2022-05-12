package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;

public class CategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//메인에서 카테고리를 누르면 1st category에 해당하는 2nd category정보를 DB에서 조회하여 
		//VIEW PAGE로 이동 (2nd category 가 없는 경우, 2nd_category.do 로 이동 
		
		String fullcode = request.getParameter("code").trim();
		String code = fullcode.substring(0,1);
		String first = ""; //첫번째 카테고리 이름 
		
		CategoryDAO dao = CategoryDAO.getInstance();
		
		ActionForward forward = new ActionForward();
		
		switch(code) {
			case "1" : 
				first ="WOMEN";
				break;
			case "2" :
				first="MEN";
				break;
			case "3":
				first="GOLF";
				break;
		}
		
		HttpSession productSession = request.getSession();
		

		if(code.equals("3")) {//카테고리가 3:골프인 경우, 2nd category불러오기

			List<CategoryDTO> list = dao.get2ndCategory(code);

			request.setAttribute("List", list);
			forward.setRedirect(false);
			forward.setPath("product/category_main.jsp");
			productSession.setAttribute("first", first);
			

		}else if (code.equals("1") || code.equals("2")){
			
			forward.setRedirect(true);
			forward.setPath("2nd_category.do?code="+fullcode);
			productSession.setAttribute("first", first);
		}else {
			System.out.println("오류 발생");
		}
		
		
		return forward;
	}

}
