package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.NoticeDAO;
import com.apc.model.NoticeDTO;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;
import com.apc.model.QaDAO;
import com.apc.model.QaDTO;

public class AdminMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
	      
      	ProductDAO pdao = ProductDAO.getInstance();
      	QaDAO qdao = QaDAO.getInstance();
      	NoticeDAO ndao = NoticeDAO.getInstance();
      	
      	List<ProductDTO> plist = pdao.getProductsImage();
      	List<QaDTO> qlist = qdao.getMainQaList();
      	List<NoticeDTO> nlist = ndao.getNoticeList();
		
		request.setAttribute("productList", plist);
		request.setAttribute("qaList", qlist);
		request.setAttribute("noticeList", nlist);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_main.jsp");
		
		return forward;	
	}

}
