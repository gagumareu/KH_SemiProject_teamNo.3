<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//쇼핑몰 우측 상단 장바구니 구현에 필요한 로직
	CartDAO semiDao = CartDAO.getInstance();
	HttpSession semiSession = request.getSession();
	String id = (String)semiSession.getAttribute("member_id");
	List<CartDTO> semeList = semiDao.getSemiCartList(id);
	request.setAttribute("semiCartList", semeList);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>
		
		a{
			text-decoration: none;
			color: black;
			font-family: 나눔고딕;
		}
		
		header a{
			font-family: Arial;
		}
		
		header a:hover{
			font-family: Arial;
			color : white;
			text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
		}
		
		nav{
			float: left;
			margin: 10px;
		}
		
		section{
			margin: 75px 325px 25px 100px;
			padding: 0px 100px;
			font-size: 13px;
			font-family: 나눔고딕;
		}
		
		div.left{
			width: 90%;
			float: left;
			font-size: 13px;
		}
		
		div.right{
			width: 10%;
			float: right;
			align: right;
		}
		
		.transfort_content {
			margin: 75px 325px 25px 100px;
			padding: 0px 100px;
			font-size: 13px;
			font-family: 나눔고딕;
		}

		button {
			width: 60px;
			height: 40px;
			font-size: 13px;
			color: black;
			background-color: white;
		}
		
		button:hover {
			width: 60px;
			height: 40px;
			font-size: 13px;
			background-color: black;
			color: white;
		}
		
		
		.home_link:hover{
			font-family: Arial;
			color : white;
			text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
		}
		
		.header_title_nav {
			font-family: Arial;
			font-weight: bold;
			font-size: 60px;
			padding-top: 60px;
		}
		.transfort_wrapper {
			display: flex;
			flex-direction: column;
			min-height: 100vh;
			margin-left: 15px;
			
		}
		.transfort_container {
			flex: 1;
			margin-top: 40px;
		}
		
		.transfort_container {
			display: grid;
			grid-template-columns: 200px 100%;
		}
		
		html, body {
			margin: 0;
			padding: 0;
			
		}
		
		
	</style>
</head>
<body>

	<jsp:include page="../include/shop_top.jsp"/>
	<jsp:include page="../include/shop_top_right.jsp"/>

	
	
	<div class="transfort_wrapper">

	<div class="header_title_nav">
		<a class="home_link" style="font-family: Arial;" href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
		배송지관리
	</div>

	<div class="transfort_container">
		<nav>
			<jsp:include page="../include/leftLayout.jsp" />
		</nav>
	
			<section class="transfort_content">
			<b>배송지</b>
			<hr width="100%">
			<br> 
			
			<div class="left">
				<c:set var="mem" value="${memDTO }" />
				<br>
				<b>${mem.getMem_name() }</b>&nbsp;${mem.getAddr() } <br>
				${mem.getPhone() }
			</div>
			
			<div class="right">
				<br>
				<table border="0" cellspacing="0">
					<tr align="right">
						<td>
							<button onclick="location.href='<%=request.getContextPath() %>/member_updateAddr.do?id=${mem.getMem_id() }'" ><b>수정</b></button>
						</td>
					</tr>
				</table>
			</div>
			
			<br><br><br><br><br>
			<hr width="100%">
			<br>
			<a onclick="history.back()" style="font-size:12px">◀ 돌아가기</a>
			</section>
	
	
		</div>
	</div>
	
	<jsp:include page="../include/shop_bottom.jsp"/>
	
	
</body>
</html>