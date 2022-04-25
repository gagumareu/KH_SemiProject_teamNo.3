package com.shop.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.apc.controller.Action;
import com.apc.controller.ActionForward;
import com.apc.model.ApcProductDAO;

public class ApcProductWomenList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		
		ApcProductDAO dao = ApcProductDAO.getInstance();
		
		dao.apcProductWomenList();
		
		return null;
	}

}
