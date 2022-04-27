package com.apc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//product_upload.jsp에서 받은 정보를 DB에 저장는 로직 비즈니스 로직
		
		//파일 저장경로
		String saveFolder = "C:\\NCS\\workspace(jsp)\\APC_semi\\WebContent\\upload";
		
		//파일 최대크기
		int fileSize = 10*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		
		String category = multi.getParameter("p_category").trim();
		String p_name = multi.getParameter("p_name").trim();
		int qty = Integer.parseInt(multi.getParameter("p_qty").trim());
		int price = Integer.parseInt(multi.getParameter("p_price").trim());
		String size = multi.getParameter("p_size").trim();
		String color = multi.getParameter("p_color").trim();
		String spec = multi.getParameter("p_icon").trim();
		String contents = multi.getParameter("p_contents").trim();
		int mileage = Integer.parseInt(multi.getParameter("p_mileage").trim());
		String image = multi.getFilesystemName("p_image");
		
		ProductDTO dto = new ProductDTO();
		dto.setPcategory_fk(category);
		dto.setPname(p_name);
		dto.setPqty(qty);
		dto.setPrice(price);
		dto.setPsize(size);
		dto.setPcolor(color);
		dto.setPicon(spec);
		dto.setPcontents(contents);
		dto.setMileage(mileage);
		dto.setPimage(image);
		
		ProductDAO dao = ProductDAO.getInstance();
		int result = dao.productUpload(dto);
		
		return null;
	}

}
