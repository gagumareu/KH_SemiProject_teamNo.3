package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ProductsDAO;
import com.apc.model.ProductsDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminProductsUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 수정 폼 페이지에서 넘어온 정보를 db에 저장하는 비즈니스 로직.
		ProductsDTO dto = new ProductsDTO();
		
		String saveFolder="C:\\\\Users\\\\ayss3\\\\Documents\\\\JSP_PROJECT\\\\web_project\\\\WebContent\\\\upload";
		
		int fileSize=1024*1024*10;
		
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize,"UTF-8", new DefaultFileRenamePolicy());
		
		int p_no = Integer.parseInt(multi.getParameter("p_no").trim());
		String p_code = multi.getParameter("p_code").trim();
		String p_name = multi.getParameter("p_name").trim();		
		String p_size = multi.getParameter("p_size").trim();
		String p_color = multi.getParameter("p_color").trim();
		int pirce = Integer.parseInt(multi.getParameter("price").trim());
		int mileage = Integer.parseInt(multi.getParameter("mileage").trim());
		int pqty = Integer.parseInt(multi.getParameter("pqty").trim());
		String p_cont = multi.getParameter("p_cont").trim();
		
		
		String old_image = multi.getParameter("old_image_str");
		
		List<String> list = new ArrayList<String>();
		
		String[] splitStr = old_image.split(",");
		
		for(int i=0; i<splitStr.length; i++) {
			list.add(splitStr[i]);	
		}			
		
		//삭제할 파일
		for(int i=0; i<list.size(); i++) {
			if(multi.getParameter("index"+i) == null) {
				//System.out.println("index"+i);
				//System.out.println(multi.getParameter("index"+i));
				if(list.get(i) != null) {
					String fileName = list.get(i);
					File file = new File(saveFolder+fileName);
					file.delete();
					list.remove(i);
				}
			}		
		}
		
		//새로 추가된 파일
		Enumeration enu = multi.getFileNames();
		
		while(enu.hasMoreElements()) {
			String parameter = (String)enu.nextElement();
			File value = multi.getFile(parameter);
			String fileName = multi.getFilesystemName(parameter);
		
			if(value !=null) {
				
				String homedir = saveFolder+"/"+p_code;
				File path = new File(homedir);
				
				if(!path.exists()) {
					path.mkdir();
				}
				value.renameTo(new File(homedir +"/"+ fileName));
				
				String fileDBName = "/"+p_code+"/"+fileName;
				
				list.add(fileDBName);
				
				
				
			}else if(parameter == null) continue;
	
		}
		dto.setPimage(String.join(",", list).trim());
		System.out.println("tostring"+ String.join(",",list).trim());

		
	
		dto.setPno(p_no);
		dto.setPcategory_fk(p_code);
		dto.setPname(p_name);
		dto.setPsize(p_size);
		dto.setPcolor(p_color);
		dto.setPrice(pirce);
		dto.setMileage(mileage);
		dto.setPqty(pqty);		
		dto.setPcontents(p_cont);
		
		
		ProductsDAO dao = ProductsDAO.getInstance();
		
		int check = dao.prodcutsUpdate(dto);
		
		PrintWriter out = response.getWriter();
		
		ActionForward forward = new ActionForward();
		
		if(check>0) {
			forward.setRedirect(true);
			forward.setPath("admin_products_list.do");
			
			
		}else {
			out.println("<script>");
			out.println("alert('상품 수정에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
				
		return forward;
	}

}
