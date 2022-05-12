package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class QaContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//qa_main에서 게시글을 클릭하면 해당 게시글의 정보를 조회하여
		//view page로 이동하는 비즈니스 로직
		
		int num = Integer.parseInt(request.getParameter("num"));
		int nowPage = Integer.parseInt(request.getParameter("page"));
		
		
		QaDAO dao = QaDAO.getInstance();
		dao.adjustQaHit(num); // 조회수 올려주는 메서드
		QaDTO dto = dao.getQaContent(num);
		
		ProductDAO pDao = ProductDAO.getInstance();
		ProductDTO pDto = null;
		String fileName = null; 
		
		//qa게시판에 이미지가 있다면 상품 정보 및 이미지 파일이름 받기
		if(dto.getQa_pno_fk() != 0 ) {
		
			pDto = pDao.getProductCont(dto.getQa_pno_fk());
			String arrImg[] = pDao.getPorudctImg(pDto);
			fileName = arrImg[0];
		}
		
		
		
		request.setAttribute("cont", dto);
		request.setAttribute("pDto", pDto);
		request.setAttribute("fileName", fileName);
		request.setAttribute("page", nowPage);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("board/qa_content.jsp");
		
		
		return forward;
	}

}
