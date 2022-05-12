package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.PaymentDAO;
import com.apc.model.PaymentDTO;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;

public class ReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//마이페이지 구매내역에서 리뷰쓰기버튼을 누르면 제품번호가 넘어와 DB에서 정보를 조회하여
		//review_write.jsp로 이동하는 비즈니스 로직 
		//구매번호를 넘겨받음
		int no = Integer.parseInt(request.getParameter("no").trim());
		
		PaymentDAO dao = PaymentDAO.getInstance();
		PaymentDTO dto = dao.getPaymentContent(no);
		
		//제품 상세정보 가져오기 (사이즈,칼라)
		ProductDAO pdao = ProductDAO.getInstance();
		ProductDTO pdto = pdao.getProductCont(dto.getPno_fk());
		

		request.setAttribute("cont", dto);
		request.setAttribute("product", pdto);
		
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("product/review_write.jsp");
		
		return forward;
	}

}
