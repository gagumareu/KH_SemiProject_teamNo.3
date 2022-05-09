package com.apc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FrontController extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	
	public FrontController() {	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//한글 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri=request.getRequestURI();
		System.out.println("uri>>>"+uri);
		
		String path = request.getContextPath();
		System.out.println("path>>>"+path);
		
		String command = uri.substring(path.length()+1);
		System.out.println("command>>>"+command);
		
		Action action = null;
		ActionForward forward = null;
		
		Properties prop = new Properties();
		
		FileInputStream fis = new FileInputStream
				("C:\\NCS\\workspace(jsp)\\APC_semi\\src\\com\\apc\\controller\\mapping.properties");//파일경로를 넣어주기
		
		prop.load(fis);
		
		String value = prop.getProperty(command);
		System.out.println("value>>>"+value);
		
		if(value.substring(0,7).equals("execute")) {
			
			StringTokenizer st = new StringTokenizer(value, "|");
			String url_1 = st.nextToken(); // "execute"
			String url_2 = st.nextToken(); //"패키지명.클래스명"
			
			try {
				Class url = Class.forName(url_2); //              ex)이전에 했던거랑 비교해보면 if(command.equals("*.do"))구간에 해당 

				//동적객체 생성하는 방법
				action = (Action) url.newInstance(); //인터페이스로 받기  ex)이전에 했던 거랑 비교해보면 action = new BoardListAction() 구간

				//비즈니스 로직을 실행하는 메서드
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {//value값이 execute가 아닌 경우
			//view page로 이동 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {//true인경우
				
				response.sendRedirect(forward.getPath()); //다시 *.do로 넘길때 동작
				
			}else {// false인경우 
				//view page로 이동
			
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	
	
	}
	
	
}
