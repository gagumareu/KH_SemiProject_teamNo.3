package com.admin.action;

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
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class AdminProductsInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 제품 등록 폼 페이지에서 넘어온 데이터를 DB에 저장시켜 주는 비즈니스 로직.
		
		ProductsDTO dto = new ProductsDTO();
		
		// ***********업로드 파일경로: 파일이름은 'upload'로 해주세요*************8
		String saveFolder="C:\\Users\\ayss3\\Documents\\JSP_PROJECT\\web_project\\WebContent\\upload";
		
		int fileSize=1024*1024*10;
		
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize,"UTF-8", new DefaultFileRenamePolicy());
		
		String p_code = multi.getParameter("p_code").trim();
		String p_name = multi.getParameter("p_name").trim();		
		String p_size = multi.getParameter("p_size").trim();
		String p_color = multi.getParameter("p_color").trim();
		int pirce = Integer.parseInt(multi.getParameter("price").trim());
		int mileage = Integer.parseInt(multi.getParameter("mileage").trim());		
		int pqty = Integer.parseInt(multi.getParameter("pqty").trim());
		String p_cont = multi.getParameter("p_cont").trim();	
		
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		System.out.println("p_name>>"+p_name);
		
		if(p_name.equals("")) {
			out.println("<script>");
			out.println("alert('상품명을 입력해주세요')");
			out.println("history.back()");
			out.println("</script>");
			
		}else {						
			
			//이미지 파일
			List<String> fileList = new ArrayList<String>();
		
			Enumeration enu = multi.getFileNames();
			
			while(enu.hasMoreElements()) {
				String parameter = (String)enu.nextElement();
				File value = multi.getFile(parameter);
				String fileName = multi.getFilesystemName(parameter);
				//System.out.println("parameter >>"+  parameter);
				//System.out.println("value >>"+  value);
				
				if(value != null) {
					
					String homedir = saveFolder+"/"+ p_code ;
					File path = new File(homedir);
					
					if(!path.exists()) {
						path.mkdir();
					}		
					value.renameTo(new File(homedir+"/"+fileName));
					
					String fileDBName = "/"+p_code+"/"+fileName;
					
					fileList.add(fileDBName);		
				}else if(value == null) continue;
				
			}
			dto.setPimage(String.join(",",fileList).trim());	
			
			//System.out.println("tostring"+ String.join(",",fileList).trim());
	
			
			dto.setPcategory_fk(p_code);
			dto.setPname(p_name);
			dto.setPsize(p_size);
			dto.setPcolor(p_color);
			dto.setPrice(pirce);
			dto.setMileage(mileage);		
			dto.setPqty(pqty);
			dto.setPcontents(p_cont);
			
			
			ProductsDAO dao = ProductsDAO.getInstance();
			
			int check = dao.prodcutsInsert(dto);
			
			
			
			if(check>0) {
				forward.setRedirect(true);
				forward.setPath("admin_products_list.do");
				
				
			}else {
				out.println("<script>");
				out.println("alert('상품 등록에 실패했습니다.')");
				out.println("history.back()");
				out.println("</script>");
				
			}
		
			
		}
				
		return forward;
	}
	
}
