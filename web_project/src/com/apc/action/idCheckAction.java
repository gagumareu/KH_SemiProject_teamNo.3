package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;

public class idCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		// 파라미터로 넘어온 아이디가 customer 테이블에 등록되어 있는
				// 아이디인지 여부를 확인하는 비지니스 로직.
				
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
				
				
		String member_id = request.getParameter("id").trim();
				
		MemberDAO dao = MemberDAO.getInstance();
				
		String str = dao.idCheck(member_id);
				
		out.println(str);
		
		
		return null;
	}

}