package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.apc.model.MemberDAO;
import com.apc.model.PaymentDAO;
import com.apc.model.PaymentDTO;


public class semiOrderOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		// 회원 관련 내용
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String member_id = request.getParameter("member_id").trim();
		
		String ordername = request.getParameter("order_name").trim();
		
		String orderaddr = request.getParameter("order_addr").trim();
		
		int paytype = 
				Integer.parseInt(request.getParameter("payment").trim());
		
		String phone1 =
				request.getParameter("phone1").trim();
		
		String phone2 =
				request.getParameter("phone2").trim();
		
		String phone3 =
				request.getParameter("phone3").trim();
		
		String orderphone =
				phone1 + "-" + phone2 + "-" + phone3;	
		
		
		
		String[] cartno1 = request.getParameterValues("cartno");
				
		String[] pno_fk1 = request.getParameterValues("pno_fk");
		
		String[] pname1 = request.getParameterValues("panme");
		
		String[] pqty1 = request.getParameterValues("pqty");
		
		String[] price1 = request.getParameterValues("price");
		
		String[] trans1 = request.getParameterValues("transcost");
		
		String[] pimage1 = request.getParameterValues("pimage");
		
		String[] mileage1 = request.getParameterValues("mileage");
		
		int check = 0;

		for(int i=0; i<cartno1.length; i++) {
			
			int cartno = Integer.parseInt(cartno1[i]);
			int pno_fk = Integer.parseInt(pno_fk1[i]);
			int pqty = Integer.parseInt(pqty1[i]);
			int price = Integer.parseInt(price1[i]);
			int trans = Integer.parseInt(trans1[i]);
			int mileage = Integer.parseInt(mileage1[i]);
			String pname = pname1[i];
			String pimage = pimage1[i];
			
			PaymentDTO dto = new PaymentDTO();
			
			dto.setCartno_fk(cartno);
			dto.setOrder_id(member_id);
			dto.setPno_fk(pno_fk);
			dto.setPname(pname);
			dto.setPqty(pqty);
			dto.setPrice(price);
			dto.setTranscost(trans);
			dto.setPaytype(paytype);
			dto.setOrdername(ordername);
			dto.setOrderaddr(orderaddr);
			dto.setOrderphone(orderphone);
			dto.setPay_pimage(pimage);
			
			
			PaymentDAO dao = PaymentDAO.getInstance();
			
			check = dao.paymentInsert(dto);
			
			MemberDAO dao1 = MemberDAO.getInstance();
			
			dao1.mileageInsert(member_id, mileage);
			
			CartDAO dao2 = CartDAO.getInstance();
			
			// dao2.deleteAllCart(cartno);
			
			
		}
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(check > 0) {
			
			out.println("<script>");
			out.println("alert('결제 완료')");
			out.println("</script>");
			
		 	forward.setRedirect(true);
		 	forward.setPath("orderafter.do?member_id="+member_id);  // 주문 완료 페이지로 이동
		}else {
			out.println("<script>");
			out.println("alert('결제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		


		
		return forward;
	}

}