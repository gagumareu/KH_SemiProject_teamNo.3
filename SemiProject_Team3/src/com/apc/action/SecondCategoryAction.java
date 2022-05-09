package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;

public class SecondCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// category_main.jsp(golf)에서 받은 골프 카테고리 코드와  남녀 메인에서 받은 코드로
		// 3rd category.do로 코드를 가져가서 DB에서 정보를 가져와 view page로 이동
		
		String fullcode = request.getParameter("code").trim();
		String code = fullcode.substring(0, 1); // 첫 번째 자리만 뽑기
		String code2 = fullcode.substring(1, 2); // 두 번째 자리만 뽑기
		
		System.out.println("main2 >>> " +fullcode);
		
		CategoryDAO dao =CategoryDAO.getInstance();
				
		List<CategoryDTO> list = null;
		
		if(code2.equals("0")) { // 남녀 카테고리 에서 넘어온 코드 
			
			list = dao.get3rdCategory(code);  // 1,2 코드 넘김
			
		}else {              // 2nd category 에서 넘어온 코드
			 
			list = dao.get3rdCategory(fullcode); // 3w0.., 3m0.., 3a0.. 넘김
			
		}
		
		ActionForward forward = new ActionForward();
		
		if(list.size() == 0) {
			
			forward.setRedirect(true);
			forward.setPath("product_list.do?code="+fullcode);
			
		}else {
			
			CategoryDTO ctitleCode = dao.getCategoryTitle(fullcode);

			request.setAttribute("ctitleCode", ctitleCode);
			request.setAttribute("List", list);
			request.setAttribute("code", fullcode); // 남녀 : 100.., 200,,
													// 골프 : 3w00.., 3m00.., 3a00..
			forward.setRedirect(false);
			forward.setPath("product/category_main2.jsp");
		}
		
		
		return forward;
	}

}
