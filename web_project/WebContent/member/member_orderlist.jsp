<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.wrapper {
		position: absolute;
		top: 170px;
		left: 35%;
		text-align: center;
		font-family: arial;
		width: 500px;
	}
	
	.cart_table {
		width: 100%;
	}
	
	.button {
		width: 45%;
		height: 35px;
		background-color: black;
		color: white;
		font-weight: bold;
	}
	
	h1 a{
		margin-left:10px;
		text-decoration: none;
		color:black;
	}
	
</style>
</head>
<body>

	<h1><a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a>/주문내역</h1>

	<div class="wrapper">

	<div class="content">
	<c:set var="cartList" value="${cartInfo }" />
	<c:set var="dto" value="${memberInfo }" />
	
	<h2>주문 결제가 완료 되었습니다.</h2>
	<hr>
	<h3>${dto.getMem_name() } 고객님 감사합니다.</h3>
	
	<table class="cart_table">
		<tr>
		<td colspan="5" align="center">
			<h3>결제정보</h3>
		</td>
		</tr>
		
		<tr align="center">
			<th>상품 이미지</th> <th>상품 가격</th> <th>색상</th> <th>수량</th> <th>결제 금액</th>
		</tr>
		
		<c:if test="${!empty cartList }">
			<c:forEach items="${cartList }" var="cart">
			<tr align="center">
			<td><img src="<%=request.getContextPath() %>/upload/${cart.getCart_pimage() }" width="80" height="80">
			<td> <fmt:formatNumber value="${cart.getCart_price() }"></fmt:formatNumber>원 </td>
			<td> ${cart.getCart_pcolor() } </td>
			<td> ${cart.getCart_pqty() } </td>
			<c:set var="price"  value="${cart.getCart_price() }" />
			<c:set var="amount" value="${cart.getCart_pqty() }" />
			<td> <fmt:formatNumber value="${price * amount }" />원 </td>
			</tr>
			<c:set var="total" value="${total + (price * amount) }" />
			</c:forEach>
		</c:if>
		
		<tr>
			<td colspan="3" align="left">
				<th>총결제금액</th>
			</td>
			
			<td colspan="2">
				<fmt:formatNumber value="${total }" />원
			</td>
		</tr>
	</table>
		
	<br>
	<br>	
		
	<div class="link">
			<input type="button" value="메인으로" class="button"
				onclick="location.href='cart_delete_all_a.do'">
			<input type="button" value="결제내역" class="button"
				onclick="location.href='cart_delete_all_b.do'">				
	</div>
		
	</div>

</div>
</body>
</html>