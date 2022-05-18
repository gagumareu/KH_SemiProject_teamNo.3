<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		
		.header_title_nav {
			font-family: Arial;
			font-weight: bold;
			font-size: 60px;
			padding-top: 60px;
		}
		
		.home_link:hover{
			font-family: Arial;
			color : white;
			text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
		}
		
		section{	
			font-size: 0.75em;
			font-family: 나눔고딕;
		}
		
		span a:hover {
			color: black;
		}
		
		.right_content a {
			font-size: 0.75em;
			color: gray;
		}
		
		html, body {
			height: 100%;
			padding: 0;
			margin: 0;
			
		}
		
		.container {
			flex: 1;
			width: 80%;
			margin-top: 40px;
		}
		
		.myPage_wrapper {
			display: flex;
			flex-direction: column;
			min-height: 100%;
			margin-left: 15px;
		}
		
		.container {
			display: grid;
			grid-template-columns: 200px 100%;
			grid-template-rows: 400px 100%;
			margin-top: 40px;
		}
		
		.left_bar {
			grid-column: 1;
			grid-row: 1 / 2;
		
		}
		
		.member_info_wrapper {
			display: flex;
			flex-direction: column;
			grid-column-start: 2;
			grid-row: 1;
		}
		
		.order_info {
			display: flex;
			flex-direction: column;
			grid-column: 2;
			grid-row: 2;
		}
		
		.member_infor {
			display: grid;
			grid-template-columns: 1fr 1fr;
			margin-bottom: 100px;
			
		}
		
		.member_info_left {
			grid-column: 1;
		
		}
		
		.member_info_right {
			grid-column: 2; 	
		}
		
		.info_modify_btn > a {
			float: right;
		
		}
		
		.right_content {
			width: 75%;
		
		}
	
	</style>
</head>
<body>
	
	<jsp:include page="../include/shop_top.jsp"/>
	<jsp:include page="../include/shop_top_right.jsp"/>


	<div class="myPage_wrapper">
	
	
		<div class="header_title_nav">
			<nav>
			<a class="home_link" style="font-family: Arial;" href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
			마이페이지
			</nav>
		</div>
		

		<section class="container">
			
			<div class="left_bar">			
				<jsp:include page="../include/leftLayout.jsp" />
			</div>
			
			<div class="right_content">
			
				<div class="member_info_wrapper">
				
					<div class="member_infor_container">
						<h1 style="display:inline; font-size: 50px;">회원정보</h1>
					</div> <!-- member_infor -->
				
					<span class="info_modify_btn">
						<a>정보수정</a>
					</span> <!-- info_modify_btn -->
			
					<hr width="100%">
					
					<div class="member_infor">
						<div class="member_info_left">	
							<br>
							<c:set var="mem" value="${memDTO }" />
							<b>${mem.getMem_name() }</b> <br>
							${mem.getPhone() } <br>
							${mem.getEmail() }
							<br><br>
						
							<b>배송지관리</b> <br>
							<a href="<%=request.getContextPath() %>/member_addrView.do?id=${mem.getMem_id() }">전체관리</a>
							<br> <br>
						
							<b>비밀번호변경</b>	<br>
							<a href="<%=request.getContextPath() %>/member_updatePwd.do?id=${mem.getMem_id() }">변경하기</a>
							<br> <br>
						</div> <!--  member_info -->
						
						<div class="member_info_right">
							<br>
							<b>온라인상담</b> <br>
							<a href="<%=request.getContextPath() %>/member_contactView.do?id=${mem.getMem_id() }">전체보기</a>	
							<br> <br> <br>
							
							<b>적립금: <fmt:formatNumber value="${mem.getMem_mileage() }" />원</b> <br>
						</div>
					</div>	<!--  -->
				</div> <!-- member_info_wrapper -->
				
				
			
				<h1 style="display:inline; font-size: 50px;">구매 내역</h1>
				<hr width="100%">
				<div class="member_infor">		
					<div class="member_info_left">		
						<br>
						<b>구매 내역</b> <br>
						<a href="<%=request.getContextPath() %>/member_orderView.do?id=${mem.getMem_id() }">전체보기</a>	
					</div> <!-- member_info_left -->
					
					
					<div class="member_info_right">	
						<br>
						<b>취소/반품 신청</b> <br>
						<a href="<%=request.getContextPath() %>/member_orderCancelView.do?id=${mem.getMem_id() }">조회하기</a>
					</div> <!-- member_info_right -->
				</div>
				
			</div>
		
			
		</section> <!-- container -->
		
		
		
	</div> <!-- myPage_wrapper -->
	
	<jsp:include page="../include/shop_bottom.jsp"/>
	
	
</body>
</html>