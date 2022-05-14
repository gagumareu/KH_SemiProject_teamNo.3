package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;
import com.apc.model.PaymentDAO;
import com.apc.model.PaymentDTO;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;

public class GoPayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//제품상세리스프 -> 바로구매 -> 결제화면 로직
		//product_detail.jsp에서 바로 바로구매하기 버튼을 눌렀을때 로그인/비회원 구분한 뒤 카트테이블에 내용을 저장한 후 
		//결제화면으로 이동하는 비즈니스 로직 
		
		HttpSession session = request.getSession();
		
		String loginId = (String) session.getAttribute("member_id");
		
		if( loginId == null) {//로그인된 아이디가 세션에 저장되어있지않다면 
			//비회원용 아이디 생성
			MemberDAO dao = MemberDAO.getInstance();
			loginId= dao.nonMemberId();
			session.setAttribute("member_id", loginId); //비회원용아이디 세션에 저장
		}
		
		
		//get방식으로 넘어온 정보들
		String pname = request.getParameter("name");
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		
		//form에서 넘겨받은 정보
		int pqty= Integer.parseInt(request.getParameter("p_qty"));
		
		//pname,color,size에 맞는 pno를 찾기
		ProductDAO productDao = ProductDAO.getInstance();
		ProductDTO productDto = productDao.getProductCont(pname, color, size);

		
		//제품 대표이미지 불러오기 (pimage[0] : 대표이미지)
		String[] pimage =  productDao.getPorudctImg(productDto);
		
		
		//장바구니 테이블에 저장
		CartDAO cdao = CartDAO.getInstance();
		CartDTO cdto = new CartDTO();
		
		cdto.setPno_fk(productDto.getPno());
		cdto.setCart_memid(loginId); 
		cdto.setCart_pname(productDto.getPname());
		cdto.setCart_pqty(pqty);			//form에서 고객이 입력한 수량 
		cdto.setCart_psize(productDto.getPsize());
		cdto.setCart_pcolor(productDto.getPcolor());
		cdto.setCart_price(productDto.getPrice());
		cdto.setCart_pimage(pimage[0]);
		cdto.setCart_mileage(productDto.getMileage());
		
		//장바구니 테이블에 저장 
		int result = cdao.cartInsert(cdto);
		
		// 멤버 정보 불러오기
		MemberDAO fdao = MemberDAO.getInstance();
		
		ActionForward forward= new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(result > 0 ) {
		//저장된 장바구니 정보 불러오기
		//뷰페이지에서 list로 foreach문을 돌리기때문에 통일시켜 바로구매 로직에서도 list로 받기
//		cdto = cdao.getCartContent(loginId, productDto.getPno());
		List<CartDTO> list = cdao.getCartContent(loginId, productDto.getPno());
		
		MemberDTO dto = fdao.orderMemberInfo(loginId); 
		
		//20220514이슬 수정 : 비회원 또는 정회원에 따라 넘기는 값 차이  
		if(loginId.substring(0,3).equals("non")) {
			request.setAttribute("nonId", loginId);
		}else {
			
			request.setAttribute("memberInfo", dto);
			
		}
		
		request.setAttribute("cartInfo", list);
		forward.setRedirect(false);
		forward.setPath("member/member_order.jsp");
		
		
		}else {
			out.println("<script>");
			out.println("alert('장바구니 저장실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}