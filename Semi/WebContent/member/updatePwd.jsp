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
			font-size: 0.75em;
			font-family: 나눔고딕;
		}
		section{
			margin: 75px 325px 25px 100px;
			padding: 0px 100px;
			font-size: 12px;
			font-family: 나눔고딕;
			
		}

	</style>
	
</head>
<body>
	
	<header>
	<h1 style="font-size: 50px;"><a href="mainPage.jsp">A.P.C.</a> 
	비밀번호관리</h1>
	</header>

	<nav>
		<jsp:include page="../include/leftLayout.jsp" />
	</nav>

	<section>
	<b>비밀번호 변경</b>
	<hr width="100%">
	<br>
	<span style="color: gray;">회원님의 개인정보 보호를 위해 비밀번호를 변경해 주십시오.</span>
	<br><br>
	<b>현재 비밀번호</b>
	
	</section>
	
	
</body>
</html>