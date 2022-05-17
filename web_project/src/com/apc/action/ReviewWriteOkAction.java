package com.apc.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;
import com.apc.model.MemberDTO;
import com.apc.model.ProductDAO;
import com.apc.model.ProductDTO;
import com.apc.model.ReviewDAO;
import com.apc.model.ReviewDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//review_write.jsp에서 받은 정보를 DB에 저장하는 비즈니스로직
		
		//파일 저장경로
		String saveFolder = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree\\SourceTree_main\\web_project\\WebContent\\upload";
		
		//파일 사이즈
		int fileSize = 10*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		ReviewDAO dao = ReviewDAO.getInstance();
		ReviewDTO dto = new ReviewDTO();
		
		
		//GET방식으로 넘어온 값 : 제품번호, 아이디
		 int pno = Integer.parseInt(multi.getParameter("num").trim());
		 String loginId =multi.getParameter("id").trim();
		 int order_no = Integer.parseInt(multi.getParameter("order_num"));
		 
		//제품에 대한 정보 불러오기
		ProductDAO pDao =  ProductDAO.getInstance();
		ProductDTO pDto = pDao.getProductCont(pno);
		
		//from태그에서 받은 정보들 
		int rate = Integer.parseInt(multi.getParameter("rate"));
		String cont = multi.getParameter("review_cont");
		
		System.out.println("rate"+rate);
		
		//type="file"로 되어있으면 getFile()메서드로 받아야함
		File upload_file = multi.getFile("p_image");
		
		if(upload_file != null) { //첨부파일이 있다면
			
			//우선 첨부파일의 이름을 알아야함 
			//getName(): 첨부된 파일의 이름을 문자열로 반환해주는 메서드 
			String fileName = upload_file.getName();
			
			//1. 경로지정
			 String homedir = saveFolder+"/review";
		
			//2. 폴더만들기 File 변수명 = new File(저장경로); 
			 File path1 = new File(homedir);
			 
			 if(!path1.exists()) {//path1 폴더가 존재하지않는다면
				 path1.mkdir();   //실제 폴더를 만들어주기
			 }
			 
			 /* ***************수정***************************  */
			 
			 String reFileName = loginId+"_"+fileName; //memid넣어주기
			 
			 upload_file.renameTo(new File(homedir+"/"+reFileName)); //파일이름이 변경되어 저장
			 String fileDBName = "/review/"+reFileName;
			 dto.setReview_image(fileDBName);
		
		}

			MemberDAO mdao = MemberDAO.getInstance();
			String loginPwd = mdao.getPwd(loginId);
			dto.setPno_fk(pno);
			dto.setPname(pDto.getPname());
			dto.setPsize(pDto.getPsize());
			dto.setPcolor(pDto.getPcolor());
			dto.setMemid_fk(loginId);
			dto.setReview_rate(rate);
			dto.setReview_cont(cont);
			dto.setReview_pwd(loginPwd); // memberDTO에서 MEMID에 해당하는 비밀번호 넣기
			dto.setOrderno_fk(order_no);
			
			int result = dao.reviewInsert(dto);
			
			ActionForward forward = new ActionForward();
			PrintWriter out = response.getWriter();
			
		if(result>0) {
			
			forward.setRedirect(true);
			forward.setPath("member_orderView.do?id=" + loginId); //마이페이지 보여주기
		}else {
			out.println("<script>");
			out.println("alert('리뷰등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;

}
	
}
