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
		
		section{
			font-size: 13px;
			font-family: 나눔고딕;
		}
		
		input.black {
			font-size : 12px;
			width: 50px; 
			height: 35px; 
			text-align: center; 
			color: white;
			background-color: black;
			font-weight: bold;
			font-family: 나눔고딕;
		}
		
		input.white {
			font-size : 12px;
			width: 50px; 
			height: 35px; 
			text-align: center; 
			color: black;
			background-color: white;
			font-weight: bold;
			font-family: 나눔고딕;
		}
		
		input.text{
			letter-spacing: 1.5px;
			font-size: 15px;
			width: 150px; 
			height: 30px; 
			text-align: center; 
			background-color: white;
		}
		
		div.left{
			width: 90%;
			float: left;
			text-align: left;
			font-size: 13px;
			font-family: 나눔고딕;
		}
		
		div.right{
			width: 10%;
			float: right;
			align: right;
			font-family: 나눔고딕;
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
		
		.container {
			display: grid;
			grid-template-columns: 15% 85%;;
			grid-template-rows: 40% 60%;
			margin-top: 40px;
		}
		
		.left_bar {
			grid-column: 1;
			grid-row: 1 / 2;
		
		}
		
		.right_content {
			width: 70%;
			
		
		}
		.orderCancelView_wrapper {
			display: flex;
			flex-direction: column;
			min-height: 100%;
			margin-left: 15px;
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

	<div class="orderCancelView_wrapper">
	
		<div class="header_title_nav">
			<nav>
				<a class="home_link" style="font-family: Arial;" href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
				취소/반품조회
			</nav>
		</div>

		<section class="container">
		
			<div class="left_bar">			
				<jsp:include page="../include/leftLayout.jsp" />
			</div>
	
			<div class="right_content">
				<b>주문취소/반품조회</b>
				<hr width="100%">
				<div align="center">
					<br>
					<b>기간조회 :</b>
					
					<!-- 이 부분 ajax를 좀더 공부하고 와서 완성할 것 -->
					
					<c:set var="date_3" value="${date_3 }" />
					<c:set var="date_now" value="${date_now }" />
					<c:set var="mem" value="${memDTO }" />
					<c:set var="qList" value="${qaList }"/>
					
					<input type="button" value="3개월" class="black" />
					<input type="button" value="6개월" class="white" />
					<input type="text" value=${date_3 } class="text" />
					~
					<input type="text" value=${date_now } class="text" />
					<input type="button" value="조회" class="black" />
					&nbsp; &nbsp;
					<br> <br> <br>
				</div>
				
				<div class="orderCancelView_wrapper2">
					<hr>
					<c:forEach items="${cancelList }" var="cDTO">
					<br>
				
					<div class="left">
						<b>${cDTO.getPname() } &nbsp; ${cDTO.getPcolor() } &nbsp;
						${cDTO.getPsize() } &nbsp; ${cDTO.getPqty() }매</b> <br>
						<span style="color: gray;">
							${cDTO.getCancel_category() }<br>
							${cDTO.getCancel_date().substring(0,10) }
						</span>
					</div>
					<div class="right">
						<span style="color: gray;">
							<c:if test="${cDTO.getCancel_state() == 0 }">
								취소/반품 대기
							</c:if>	
						</span>
						<span style="color: blue;">
							<c:if test="${cDTO.getCancel_state() == 1 }">
								취소/반품 완료
							</c:if>			
						</span>
						<span style="color: red;">
							<c:if test="${cDTO.getCancel_state() == 2 }">
								취소/반품 실패
							</c:if>
						</span>
					</div>
					<br><br><br><br>
					</c:forEach>

				</div>
				
			</div>
			
		</section>

	</div>
	
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>