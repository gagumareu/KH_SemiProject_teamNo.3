<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A.P.C. 장바구니</title>
<style>
a {
	text-decoration: none;
	color: black;
}

a.delete:hover {
	cursor: pointer;
}

section {
	font-size: 0.75em;
	font-family: 나눔고딕;
}

form {
	border-left: thin solid lightgray;
	width: 30%;
	padding: 0 0 0 2%;
	float: right;
}

div.left {
	width: 65%;
	padding: 0 2% 0 0;
	float: left;
}

div.left2 {
	width: 20%;
	padding: 0 2% 0 0;
	float: left;
}

div.left3 {
	width: 25%;
	float: left;
	color: gray;
}

div.center {
	width: 60%;
	float: left;
}

div.right {
	width: 30%;
	float: right;
	text-align: right;
}

div.right2 {
	width: 15%;
	float: right;
	text-align: right;
}

button.black {
	background-color: black;
	color: white;
	width: 100%;
	height: 40px;
}

button.white {
	border: 0;
	font-size: 15px;
	background-color: white;
}

input.check {
	position: relative;
	top: 5px;
	width: 17px;
	height: 17px;
}

input.image {
	position: relative;
	top: -85px;
	width: 17px;
	height: 17px;
}

select {
	width: 75px;
	border: 0;
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
		width: 80%;
	}
	
	.cartMain_wrapper {
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
	<jsp:include page="../include/shop_top.jsp" />
	<jsp:include page="../include/shop_top_right.jsp" />

	<div class="cartMain_wrapper">

		<div class="header_title_nav">
			<a class="home_link" style="font-family: Arial;"
				href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 장바구니
		</div>

		<section class="container">

			<div class="left_content"></div>

			<c:set var="cList" value="${cartList }" />
			<div class="right_content">
				<div class="left">
					<b>전체상품</b>
					<hr color="lightgray">
					<br>
					<br>
					<c:forEach items="${cList }" var="cDTO">
						<input type="hidden" name="id" value="${cDTO.getCart_memid() }" />
						<div class="left2">
							<a
								href="<%=request.getContextPath() %>/product_detail.do?num=${cDTO.getPno_fk() }">
								<img
								src="<%=request.getContextPath() %>/upload/${cDTO.getCart_pimage() }"
								width="100" height="100">
							</a>
						</div>

						<!-- ajax가 필요해 보인다. ajax로 jsp 페이지 안에서 dao 메서드를 연산이 가능한가를 알아봐야한다. -->
						<div class="center">
							<a
								href="<%=request.getContextPath() %>/product_detail.do?num=${cDTO.getPno_fk() }">
								<b>${cDTO.getCart_pname() }</b>
							</a><br>
							<br>
							<br>
							<div class="left3">
								SIZE<br>
								<br> <a
									href="<%=request.getContextPath() %>/cart_update.do?num=${cDTO.getCart_no() }">
									<b>${cDTO.getCart_psize() }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼</b>
								</a>
							</div>
							<div class="left3">
								COLOR<br>
								<br> <a
									href="<%=request.getContextPath() %>/cart_update.do?num=${cDTO.getCart_no() }">
									<b>${cDTO.getCart_pcolor() }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼</b>
								</a>
							</div>
							<div class="left3">
								QTY<br>
								<br> <a style="font-size: 13px"
									<c:if test="${cDTO.getCart_pqty() != 1}">
							href="<%=request.getContextPath() %>/cart_qtyDown.do?num=${cDTO.getCart_no() }"
							</c:if>>-</a>
								&nbsp;&nbsp;&nbsp;<span style="font-size: 13px;"><b>${cDTO.getCart_pqty() }</b></span>&nbsp;&nbsp;&nbsp;
								<a style="font-size: 13px"
									href="<%=request.getContextPath() %>/cart_qtyUp.do?num=${cDTO.getCart_no() }">+</a>
							</div>
						</div>

						<!-- ajax를 공부하고 다시 봐봐야겠다. ajax로 jsp 페이지 안에서 dao 메서드를 연산이 가능한가를 알아봐야한다. -->
						<div class="right2">
							<a class="delete"
								onclick="if(confirm('해당 상품을 쇼핑백에서 삭제하시겠습니까?')){
									location.href='<%=request.getContextPath() %>/cart_delete.do?num=${cDTO.getCart_no() }'}
									else{ return; }">
								X</a><br>
							<br> 적립금
							<fmt:formatNumber
								value="${cDTO.getCart_mileage() * cDTO.getCart_pqty() }" />
							원<br>
							<br> <b><fmt:formatNumber
									value="${cDTO.getCart_price() * cDTO.getCart_pqty() }" />원</b>
						</div>
						<br>
						<br>
						<hr width="100%" color="white">
						<br>
						<br>
					</c:forEach>
				</div>
				<form method="post" action="<%=request.getContextPath()%>/">
					<b>장바구니 결제금액</b>
					<c:set var="pSum" value="${price_sum }" />
					<c:set var="mSum" value="${mileage_sum }" />
					<c:set var="tCost" value="${tCost }" />
					<hr>
					<br>
					<br>

					<div class="left">
						<b>판매가</b><br>
						<br> 적립금<br>
						<br> 배송비<br>
						<br>
					</div>

					<!-- ajax로 판매가 합산이 가능하지 않을까 기대해보며 넘어간다. -->
					<div class="right">
						<b><fmt:formatNumber value="${pSum }" />원</b><br>
						<br>
						<fmt:formatNumber value="${mSum }" />
						원<br>
						<br>
						<fmt:formatNumber value="${tCost }" />
						원<br>
						<br>
					</div>

					<hr color="lightgray" width="100%">
					<br>
					<br>

					<div class="left">
						<b>구매예상금액</b>
					</div>

					<div class="right">
						<b><fmt:formatNumber value="${pSum + tCost}" />원</b>
					</div>
					<br>
					<br>
					<br>
					<br>
					<button type="submit" class="black">
						<b>구매하기</b>
					</button>
				</form>
			</div>
		</section>
	</div>
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>