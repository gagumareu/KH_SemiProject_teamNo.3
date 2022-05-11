package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;

public class ReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//마이페이지 구매내역에서 리뷰쓰기버튼을 누르면 제품번호가 넘어와 DB에서 정보를 조회하여
		//review_write.jsp로 이동하는 비즈니스 로직 
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProductDAO dao = ProductDAO.getInstance();
		ProductDTO dto = dao.getProductCont(num);

		
		String[] img = dao.getPorudctImg(dto);
		
		//제품 대표이미지(첫번째이미지)
		String productImage = img[0];
		
		
		request.setAttribute("cont", dto);
		request.setAttribute("image", productImage);
		
		
		ActionForward forward= new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("product/review_write.jsp");
		
		return forward;
	}

}
