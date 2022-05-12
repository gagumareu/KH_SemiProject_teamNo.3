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

public class SecondCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//category_main.jsp에서 받은 2nd_category에 해당하는 3rd_category 정보를 DB에서 조회하여
		//view page로 이동 
		
		String fullcode = request.getParameter("code").trim();
		String code = fullcode.substring(0,1); // 맨앞자리 1st category 구분
		String code2 = fullcode.substring(1,2); // 2nd category 존재여부 구분 
		
		String second = null; //2nd category 이름 
		
		CategoryDAO dao = CategoryDAO.getInstance();
		List<CategoryDTO> list = null;
		
		
		if(code2.equals("0")) {//category.do를 거치지않고 main에서 바로넘어와 1st category code 가진 경우 
			
			list = dao.get3rdCategory(code);
			
		}else {//2nd category code로 넘어온 경우
			
			list = dao.get3rdCategory(fullcode);
			
		}
		

		
		if(code2.equalsIgnoreCase("W")) {
			second="WOMEN";
		}else if(code2.equalsIgnoreCase("M")) {
			second="MEN";
		}else if(code2.equalsIgnoreCase("A")) {
			second="ACC";
		}
		
		System.out.println("code2>>>"+code2);
		System.out.println("second>>>"+second);
		
		HttpSession productSession = request.getSession();
		
		
		
		ActionForward forward = new ActionForward();
		
		if(list.size() == 0 ) {
			
			productSession.setAttribute("second", second);
			
			forward.setRedirect(true);
			forward.setPath("product_list.do?code="+fullcode);
			
		}else {
			
			request.setAttribute("List", list);
			productSession.setAttribute("second", second);
			
			forward.setRedirect(false);
			forward.setPath("product/category_main2.jsp");
			
		}
			
		
		return forward;
	}

}
