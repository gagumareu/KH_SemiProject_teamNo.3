<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a {
		text-decoration: none;
		color: black;
		font-family: 나눔고딕;
	}
	
	form {
		line-height: 175%;
		font-size: 13px;
		text-align: left;
		font-family: 나눔고딕;
	}
	
	div.left {
		width: 50%;
		float: left;
		text-align: center;
	}
	
	div.right {
		width: 50%;
		float: right;
	}
	
	select {
		width: 45%;
		height: 35px;
	}
	
	button.black {
		width: 100px;
		height: 40px;
		background-color: black;
		font-weight: bold;
		color: white;
	}
	
	button.black:hover {
		width: 100px;
		height: 40px;
		background-color: white;
		color: black;
	}
	
	.home_link:hover {
		font-family: Arial;
		color: white;
		text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px
			0 #000;
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
		width: 70%;
	}
	
	.cartUpdate_wrapper {
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
	
	div.left2{
			width: 70%;
			float: left;
		}
	
	div.right2{
				width: 30%;
				float: right;
				text-align: right;
				align: right;
			}
</style>
</head>
<body>

	<jsp:include page="../include/shop_top.jsp"/>
	<jsp:include page="../include/shop_top_right.jsp"/>
	
	<div class="cartUpdate_wrapper">

		<div class="header_title_nav">
			<a class="home_link" style="font-family: Arial;"
				href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 옵션변경
		</div>

		<section class="container">

			<div class="left_content">
				
			</div>

			<div class="right_content">
				<div>
					<b>상품옵션 변경</b>
					<c:set var="cDTO" value="${cartDTO }" />
					<c:set var="colorList" value="${colorList }" />
					<c:set var="sizeList" value="${sizeList }" />
					<c:set var="pDTO" value="${productDTO }" />
					<hr width="100%">
					<form method="post"
						action="<%=request.getContextPath()%>/cart_update_ok.do">
						<input type="hidden" name="cart_no" value="${cDTO.getCart_no() }" />
						<input type="hidden" name="pname" value="${cDTO.getCart_pname() }" />
						<br>
						<div class="left">
							<!-- 여기는 진짜 ajax 무조건 필요하다. -->
							<a><img
								src="<%=request.getContextPath() %>/upload/${cDTO.getCart_pimage() }"
								width="300" height="300"></a>
						</div>

						<div class="right">
							<b>${cDTO.getCart_pname() }</b><br> <br> 색상선택<br>
							<select name="color">
								<c:forEach items="${colorList }" var="cList">
									<c:if test="${cList == cDTO.getCart_pcolor()}">
										<option value="${cList }" selected>${cList }</option>
									</c:if>
									<c:if test="${cList != cDTO.getCart_pcolor()}">
										<option value="${cList }">${cList }</option>
									</c:if>
								</c:forEach>
							</select> <br> <br> 사이즈 선택<br> <select name="size">
								<c:forEach items="${sizeList }" var="sList">
									<c:if test="${sList == cDTO.getCart_psize()}">
										<option value="${sList }" selected>${sList }</option>
									</c:if>
									<c:if test="${sList != cDTO.getCart_psize()}">
										<option value="${sList }">${sList }</option>
									</c:if>
								</c:forEach>
							</select> <br> <br> 수량 선택<br> <select name="qty">
								<c:forEach begin="1" end="${pDTO.getPqty() }" var="k">
									<c:if test="${k == cDTO.getCart_pqty()}">
										<option value="${k }" selected>${k }</option>
									</c:if>
									<c:if test="${k != cDTO.getCart_pqty()}">
										<option value="${k }">${k }</option>
									</c:if>
								</c:forEach>
							</select> <br> <br>
						</div>

						<hr width="100%">
						<div class="left2">
							<br>
							<a class="back" onclick="history.back()" style="font-size:12px">◀ 돌아가기</a>
						</div>
						<div class="right2">
							<br>
							<button type="submit" class="black">변경하기</button>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>