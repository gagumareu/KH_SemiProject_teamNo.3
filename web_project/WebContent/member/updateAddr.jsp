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
	
		form {
			line-height: 175%;
			font-size: 11px;
			text-align: left;
		}
		
		input {
			width: 300px;
			height: 30px;
			font-size: 15px;
		}
		
		input.small{
			width: 75px;
			height: 30px;
			font-size: 15px;
			text-align: center;
			letter-spacing: 1.5px;
		}
		
		select {
			width: 75px;
			height: 35px;
			font-size: 15px;
		}
		
		h2 {
			align: center;
		}
		
		button {
			width: 100px;
			height: 40px;
			background-color: black;
			color: white;
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
		
		.left_content {
			grid-column: 1;
		}
		
		.right_content {
			width: 50%;
		}
		
		.updateAddr_wrapper {
			display: flex;
			flex-direction: column;
			min-height: 100%;
			margin-left: 15px;
		}
		
		.container {
			display: grid;
			grid-template-columns: 15% 85%;
			grid-template-rows: 40% 60%;
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
	
	<div class="updateAddr_wrapper">

		<div class="header_title_nav">
			<a class="home_link" style="font-family: Arial;" href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
			배송지관리
		</div>
		
		<section class="container">
		
			<div class="left_content">
				<nav>
					<jsp:include page="../include/leftLayout.jsp" />
				</nav>
			</div>
			
			<div class="right_content">
				
					<b>배송지 수정</b>
					<hr width="100%">
					<c:set var="mem" value="${memDTO }" />
					<form method="post" action="<%=request.getContextPath() %>/member_updateAddr_ok.do">
						<input type="hidden" name="id" value="${mem.getMem_id() }">
						받으시는 분 <br>
						<input type="text" value="${mem.getMem_name() }" readonly />
						<br> 
						<br>
						휴대폰 번호 <br>
						<select name="first_phone">
							<option value="${mem.getPhone().substring(0,3) }" selected>${mem.getPhone().substring(0,3) }</option>
				        	<option value="010">010</option>		<!-- 국번 테이블이 있다면 중복을 막을 수 있어보입니다. 일단은 보류 했습니다... -->
				        	<option value="011">011</option>
				        	<option value="016">016</option>
				        	<option value="017">017</option>	      
				        	<option value="018">018</option>	      
				        	<option value="019">019</option>
				      	</select>
				      	-
						<input class="small" type="text" name="middle_phone" value="${mem.getPhone().substring(4,8) }" />
						-
						<input class="small" type="text" name="last_phone" value="${mem.getPhone().substring(9,13) }" />
						<br>
						<br>
						배송지주소 <br>			<!-- 이 부분 고민 해보기 -->
						<input type="text" name="first_addr" value="${mem.getAddr() }" />
						<span><br><br></span>
						<input type="text" name="last_addr" />
						<br>
						<br>
						<hr width = "100%">
						
						<div class="left">
							<br>
							<a class="back" onclick="history.back()" style="font-size:12px">◀ 돌아가기</a>
						</div>
						<div class="right">
							<br>
							<button><b>저장하기</b></button>
						</div>
						
					</form>
				
			</div>
	
		</section>
	
	</div>
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>