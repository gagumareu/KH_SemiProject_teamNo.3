<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		
		input {
			width: 40%;
			height: 35px;
		}
		
		div.left{
			width: 70%;
			float: left;
		}
		
		div.right{
			width: 30%;
			float: right;
			text-align: right;
			align: right;
		}
		
		button {
			width: 130px;
			height: 40px;
			color: white;
			background-color: black;
		}
		
		button:hover {
			width: 130px;
			height: 40px;
			background-color: white;
			color: black;
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
		.confirmPws_wrapper {
			display: flex;
			flex-direction: column;
			min-height: 100vh;
			margin-left: 15px;
			
		}
		.confirmPws_container {
			flex: 1;
			margin-top: 40px;
		}
		
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
		}
		
	</style>
	
</head>
<body>
	
	<jsp:include page="../include/shop_top.jsp"/>
	<jsp:include page="../include/shop_top_right.jsp"/>
	
		
	<div class="confirmPws_wrapper">
	
		<div class="header_title_nav">
			<a class="home_link" href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
			비밀번호 확인
		</div>
		
		<div class="confirmPws_container" >
	
			<nav>
				<jsp:include page="../include/leftLayout.jsp" />
			</nav>
	
			<section>
			<b>비밀번호 확인</b>
			<hr width="100%">
			<br>
			<span style="color: gray;">회원님의 개인정보 보호를 위한 본인 확인 절차입니다.<br>
			비밀번호를 입력해 주세요.</span>
			<br><br><br>
			<b>비밀번호</b><br><br>
			<input type="password" name="" /><br><br><br>
			<hr>
			<div class="left">
				<br>
				<a onclick="history.back()" style="font-size:12px">◀ 돌아가기</a>
			</div>
			<div class="right">
				<button><b>비밀번호 확인</b></button>
			</div>
			</section>
			
			
		</div>
	</div>
	
	
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>