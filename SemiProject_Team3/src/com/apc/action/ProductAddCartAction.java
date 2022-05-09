package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.CartDAO;
import com.apc.model.CartDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductAddCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String saveFolder = "C:\\Users\\JUNGHWAN\\git\\SemiProject\\SemiProject_Team3\\WebContent\\upload2";
		
		int fileSize = 50 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request, 
				saveFolder, 
				fileSize, 
				"UTF-8",
				new DefaultFileRenamePolicy()
		);
		// memid 추가 해야 됌!!!!
		int pno = Integer.parseInt(multi.getParameter("pno").trim());
		int mileage = Integer.parseInt(multi.getParameter("mileage").trim());
		String color = multi.getParameter("color").trim();
		String size = multi.getParameter("size").trim();
		int qty = Integer.parseInt(multi.getParameter("qty").trim());
		int price = Integer.parseInt(multi.getParameter("price").trim());
		String name = multi.getParameter("name").trim();
		String image = multi.getFilesystemName("image").trim();
		
		CartDTO dto = new CartDTO();
		
		dto.setPno_fk(pno);
		dto.setCart_pname(name);
		dto.setCart_pqty(qty);
		dto.setCart_psize(size);
		dto.setCart_pcolor(color);
		dto.setCart_price(price);
		dto.setCart_pimage(image);
		
		CartDAO dao = CartDAO.getInstance();
		
		int check = dao.productAddCart(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			forward.setRedirect(false);
			
			forward.setPath("product/cart_list.jsp");
			
		}else {
			out.println("<script>");
			out.println("alert('카트 담기 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return forward;
	}

}
