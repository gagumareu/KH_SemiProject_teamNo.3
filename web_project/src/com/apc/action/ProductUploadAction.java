package com.apc.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

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
		//(임시)product_upload.jsp에서 받은 정보를 DB에 저장는 로직 비즈니스 로직
		
		//파일 저장경로
		String saveFolder = "C:\\NCS\\workspace(jsp)\\APC_semi\\WebContent\\upload";
		
		//파일 최대크기
		int fileSize = 10*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//넘겨받은 정보
		String category = multi.getParameter("p_category").trim();
		String p_name = multi.getParameter("p_name").trim();
		int qty = Integer.parseInt(multi.getParameter("p_qty").trim());
		int price = Integer.parseInt(multi.getParameter("p_price").trim());
		String size = multi.getParameter("p_size").trim();
		String color = multi.getParameter("p_color").trim();
		String contents = multi.getParameter("p_contents").trim();
		int mileage = Integer.parseInt(multi.getParameter("p_mileage").trim());
		
		
		//다중파일 업로드
		Enumeration files = multi.getFileNames();
		
		List<String> uploadFiles = new ArrayList<String>();
		
		
		while(files.hasMoreElements()) {
			String paramName = (String) files.nextElement(); //파라미터이름을 받는 변수. (key값)
//			String originalName = multi.getOriginalFileName(paramName); //key값에 해당하는 파일의 오리지날이름 저장
			File upload_file = multi.getFile("p_image");
			String realName = multi.getFilesystemName(paramName); // 시스템에 업로드된 파일의 이름 		
			
			System.out.println("originalName:"+upload_file+"/realName:"+realName);
			
			if(paramName != null) {
				
				String homedir = saveFolder+"/"+ category ;
				File path = new File(homedir);
				
				if(!path.exists()) {
					path.mkdir();
				}		
				
				upload_file.renameTo(new File(homedir+"/"+realName));
				
				//DB에 저장되는 파일명이름 
				String dbImage = "/"+category+"/"+realName;
				
				uploadFiles.add(dbImage);
				
			}
		}
		
		String image = ""; //DB에 저장될 이미지 변수
		
		for(int i =0; i<uploadFiles.size();i++) {
			if(i<=uploadFiles.size()-2) {
				image += uploadFiles.get(i)+",";
			}else {
				image += uploadFiles.get(i);
			}
		}
		System.out.println("uploadFilesName:"+ image);
		

		
		
		ProductDTO dto = new ProductDTO();
		dto.setPcategory_fk(category);
		dto.setPname(p_name);
		dto.setPqty(qty);
		dto.setPrice(price);
		dto.setPsize(size);
		dto.setPcolor(color);
//		dto.setPicon(spec);
		dto.setPcontents(contents);
		dto.setMileage(mileage);
		dto.setPimage(image);
		
		ProductDAO dao = ProductDAO.getInstance();
		int result = dao.productUpload(dto);
		
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			out.println("<script>");
			out.println("alert('성공')");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	
		return null;
	}

}
