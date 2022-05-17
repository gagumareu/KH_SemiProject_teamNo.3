<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.wrapper {
		position: absolute;
		top: 35%;
		left: 40%;
		font-family: arial;
		width: 500px;
	}
	
	.fieldset {
		height: 200px;
		border: 3px double black;
	}
	
	legend {
		font-size: 17pt;
		font-weight: bold;
		color: black;
	}
	
	.login_link {
		display: flex;
		flex-direction: row;
		justify-content: space-around;
	}
	
	.button2 {
		width: 45%;
		height: 35px;
		background-color: black;
		color: white;
		font-weight: bold;
	}
	
	.content {
		font-weight: bold;
		font-size: 14pt;
		padding-left: 28%;
		padding-top: 12%;
	
	}
</style>
</head>
<body>

	<h1>A.P.C MEMBER JOIN</h1>

	<div class="wrapper">
	
	<fieldset class="fieldset">
		<legend>비밀번호 찾기</legend>
		<div class="content">
		${memId }님의 비밀번호는 <br>
		<span>${memPwd.substring(0, 4) } ****
		
		</span> 입니다.
		</div>
	</fieldset>
	
	<br>
	<br>
	
	<div class="login_link">
			<input type="button" value="로그인하기" class="button2"
				onclick="location.href='loginMain.do'">
			<input type="button" value="메인으로" class="button2"
				onclick="location.href='main.do'">				
	</div>
	
	</div>

</body>
</html>