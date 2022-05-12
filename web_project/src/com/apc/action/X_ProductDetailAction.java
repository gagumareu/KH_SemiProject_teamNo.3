package com.apc.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CategoryDAO;
import com.apc.model.CategoryDTO;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;
import com.apc.model.ReviewDAO;
import com.apc.model.ReviewDTO;

public class X_ProductDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//product_list.jsp에서 넘겨받은 코드에 해당하는 상세데이터를 조회 + 해당 제품에 대한 리뷰 정보를 조회하여
		//product_detail.jsp로 이동하는 비즈니스 로직
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProductDAO dao = ProductDAO.getInstance();

		//제품정보 불러오기
		ProductDTO cont = dao.getProductCont(num);
		
		//제품이름에 사이즈,칼라 각각다름. 제품에 해당하는 사이즈와 칼라를 불러오기
		String[] colors = dao.getProductColor(cont.getPname()); //pno가 아닌 pname기준이어야함
		String[] sizes = dao.getProductSize(cont.getPname());
		
		
		//page_title에 들어갈 상위카테고리 코드 불러오기 
		CategoryDAO cDao = CategoryDAO.getInstance();
		CategoryDTO cDto = cDao.getUpperCategory(cont.getPcategory_fk());
		
		
		//Review 리스트 조회
		ReviewDAO rDao = ReviewDAO.getInstance();
		List<ReviewDTO> rDto = rDao.getReviewList(cont.getPname()); //제품명+칼라에 해당하는 리뷰를 불러오기
		
		
		//product관련 정보 
		request.setAttribute("cont", cont);
		request.setAttribute("categoryCode", cont.getPcategory_fk());
		request.setAttribute("upperCode", cDto.getCategory_code());
		request.setAttribute("colors", colors);
		request.setAttribute("sizes", sizes);
		request.setAttribute("rList", rDto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("product/product_detail.jsp");
		
		return forward;
	}

}
