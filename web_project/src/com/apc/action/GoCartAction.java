package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.apc.model.MemberDAO;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;

public class GoCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//product_detail.jsp에서 전달받은 정보를 DB apc_cart테이블에 저장하는 비즈니스 로직
		
		//get방식으로 넘어온 데이터
		String pname = request.getParameter("name");
		String color = request.getParameter("color");
		String size = request.getParameter("size");

		//form에 있던 자료
//		int qty = Integer.parseInt(request.getParameter("p_qty"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		System.out.println("gocart"+ pname+"/"+color+"/"+size+"/"+qty);
		//pname,color,size에 맞는 pno를 찾기
		ProductDAO dao = ProductDAO.getInstance();
		ProductDTO dto = dao.getProductCont(pname, color, size);
		
		//제품 대표이미지 불러오기 (pimage[0] : 대표이미지)
		String[] pimage = dao.getPorudctImg(dto);
		
		System.out.println("장바구니에 보내는 데이터 확인");
		System.out.println(dto.getPno());
		System.out.println(dto.getPname());
		System.out.println(dto.getPcolor());
		System.out.println(dto.getPsize());
		System.out.println(dto.getPqty());
		
		//로그인 정보 확인
		HttpSession session = request.getSession();
		String memberid = (String) session.getAttribute("member_id");
		if(memberid == null) {
			MemberDAO mdao = MemberDAO.getInstance();
			memberid = mdao.nonMemberId();
			session.setAttribute("member_id", memberid);
		}
		System.out.println("GoCartAction - memberid : "+memberid);
		
		//제품정보를 cartDTO에 넣어주기
		CartDTO cDto = new CartDTO();
		cDto.setPno_fk(dto.getPno());
		cDto.setCart_memid(memberid); //나중에 로그인 자료받으면 넣기
		cDto.setCart_pname(dto.getPname());
		cDto.setCart_pqty(qty);			//form에서 고객이 입력한 수량 
		cDto.setCart_psize(dto.getPsize());
		cDto.setCart_pcolor(dto.getPcolor());
		cDto.setCart_price(dto.getPrice());
		cDto.setCart_mileage(dto.getMileage());
		//배송비는 DB에서 default 3000, 일정금액은 0원으로 설정?
		cDto.setCart_pimage(pimage[0]);
		cDto.setCart_mileage(dto.getMileage());
		
		//DB에 데이터 저장하기
		CartDAO cartDao = CartDAO.getInstance();
		int result = cartDao.cartInsert(cDto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if ( result>0) {
		//저장한 정보를 cart_list.do로 전달하기
		
		out.println(result);
			
			
//		forward.setRedirect(true);
//		forward.setPath("cart_main.do");
		
		}else {
			out.println("<script>");
			out.println("alert('장바구니 저장 실패')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		return null;
	}

}
