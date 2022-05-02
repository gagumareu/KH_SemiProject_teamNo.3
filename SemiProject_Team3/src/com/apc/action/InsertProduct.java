package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertProduct implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String saveFolder = "C:\\Users\\JUNGHWAN\\git\\SemiProject\\SemiProject_Team3\\WebContent\\upload";
		
		int fileSize = 50 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request, 
				saveFolder, 
				fileSize, 
				"UTF-8",
				new DefaultFileRenamePolicy()
		);
		
		String pName = multi.getParameter("pName").trim();
		String pCategory = multi.getParameter("pCategory").trim();
		int pQty = Integer.parseInt(multi.getParameter("pQty").trim());
		int price = Integer.parseInt(multi.getParameter("price").trim());
		String pSize = multi.getParameter("pSize").trim();
		String pColor = multi.getParameter("pColor").trim();
		String content = multi.getParameter("content").trim();
		String pImage = multi.getFilesystemName("pImage").trim();
		int mileage = Integer.parseInt(multi.getParameter("mileag").trim());
		
		System.out.println(pCategory);
		
		ProductsDTO dto = new ProductsDTO();
		
		dto.setPname(pName);
		dto.setPcategory_fk(pCategory);
		dto.setPqty(pQty);
		dto.setPrice(price);
		dto.setPsize(pSize);
		dto.setPcolor(pColor);
		dto.setPcontents(content);
		dto.setMileage(mileage);
		dto.setPimage(pImage);
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		int check = dao.insertProduct(dto);
		
		System.out.println(dto.getPcategory_fk());
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(false);
			forward.setPath("");
			
		}else {
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		
		
		return forward;

		
		
	
	}

}
