package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;

public class X_CategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 메인 카테고리 페이지에서 선택하면 선택한 카테고리에 해당하는 두번쨰 카테고리를 DB에서 불러와
		// view page로 이동 시킴 , 만약 두 번쨰 카테고리가 없는 경우, 2nd category.do로 이동
		// 3nd 카테고리 페이지에서 카테고리를 보여줘야 함
		
//		String fullcode = request.getParameter("code").trim();
//		String code = fullcode.substring(0, 1);
//		
//		CategoryDAO dao = CategoryDAO.getInstance();
//				
//		
//		ActionForward forward = new ActionForward();
//
//		PrintWriter out = response.getWriter();
//		
//		if(code.equals("3")) {   // 카테고리가 3: 골프인 경우, 2nd category() 불러옴
//			
//			
//			List<CategoryDTO> list = dao.get2ndCategory(code);
//			
//
//			request.setAttribute("List", list);
//			forward.setRedirect(false);
//			forward.setPath("product/category_main.jsp");
//			
//		}else if(code.equals("1") || code.equals("2")) {
//			
//			
//			forward.setRedirect(true);
//			forward.setPath("2nd_category.do?code="+fullcode);
//			
//		}else {
//			out.println("<script>");
//			out.println("alert('실패')");
//			out.println("history.back()");
//			out.println("</script>");
//		}
		
		
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
