package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;

public class SemiCartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		int cart_no = Integer.parseInt(request.getParameter("num"));
		
		CartDAO dao = CartDAO.getInstance();
		
		int result = dao.semiCartDelete(cart_no);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			
			out.println(cart_no);//shop_top_right.jsp에 삭제할 카트넘버 보내기
			
//		    forward.setRedirect(false);
//			forward.setPath("");
			
		}else {
			
			out.println("<script>");
			out.println("alert('실패')");	
			out.println("history.back()");
			out.println("</script>");
		}
		return null; //forward -> null 수정
		
		
	}

}
