package com.apc.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.MemberDAO;

public class semiSameMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String member_name = request.getParameter("name").trim();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		String str = dao.getMemberInfoAjax(member_name);
		
		PrintWriter out = response.getWriter();
		
		out.println(str);
		
		return null;
	}

}
