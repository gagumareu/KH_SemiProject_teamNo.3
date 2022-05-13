package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;
import com.apc.model.QaCategoryDAO;
import com.apc.model.QaCategoryDTO;

public class QaWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//qa_list.jsp에서 글쓰기 버튼을 누르거나 구매목록에서 문의하기버튼을 누르면
		//상품정보와 qa카테고리와 조회하여 뷰페이지로 전달하는 비즈니스 로직
		
		String id = request.getParameter("id");
		
		QaCategoryDAO dao = QaCategoryDAO.getInstance();
		
		ActionForward forward = new ActionForward();
		
		//qa게시판 카테고리 불러오기 
		List<QaCategoryDTO> dto =  dao.getQaCategoryList();
		
		
		//제품번호가 있으면 그대로 실행, 없으면 예외처리에서 실행
		try {
			
			//마이페이지->구매내역에서 문의하기 눌렀을경우 구매정보를 참고해 qa_write.jsp로 넘어감 
			//상품정보도 같이 불러와 넘겨주기
			int num = Integer.parseInt(request.getParameter("num"));
			
			ProductDAO pDao = ProductDAO.getInstance();
			ProductDTO pDto = pDao.getProductCont(num);
			String [] image = pDao.getPorudctImg(pDto);
			
			request.setAttribute("id", id);
			request.setAttribute("qac", dto); 		//qa게시판 카테고리 넘겨주기
			request.setAttribute("pCont", pDto);   //제품정보 넘겨주기
			request.setAttribute("pimage", image[0]); //제품의 대표이미지 전달
			
			forward.setRedirect(false);
			forward.setPath("board/qa_write.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
			//get방식으로 넘어온 no가 없으면 (qa_list.jsp에서 글쓰기버튼 누름)
			request.setAttribute("qac", dto);
			request.setAttribute("id", id);
			
			forward.setRedirect(false);
			forward.setPath("board/qa_write.jsp");
			
			System.out.println("no없음");
			
		}
		
		
		return forward;
	}

}
