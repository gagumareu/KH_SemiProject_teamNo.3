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
		form {
			line-height: 175%;
			width: 50%;
			align: center;
			font-size: 13px;
			text-align: left;
			font-family: 나눔고딕;
		}
		
		div.left{
			width: 50%;
			float: left;
			text-align:center;
		}
		
		div.right{
			width: 50%;
			float: right;
		}
		
		select {
			width: 45%;
			height: 35px;
		}
		
		button.black{
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
			color:black;
		}
		
	</style>
</head>
<body>
	<div align="center">
		<h2>상품옵션 변경</h2>
		<c:set var="cDTO" value="${cartDTO }" />
		<c:set var="colorList" value="${colorList }"/>
		<c:set var="sizeList" value="${sizeList }"/>
		<c:set var="pDTO" value="${productDTO }" />
		<hr width="50%" color="lightgray">
		<form method="post" action="<%=request.getContextPath() %>/cart_update_ok.do">
			<input type="hidden" name="cart_no" value="${cDTO.getCart_no() }" />
			<input type="hidden" name="pname" value="${cDTO.getCart_pname() }" />
			<br>
			<div class="left">
				<!-- 여기는 진짜 ajax 무조건 필요하다. -->
				<a><img src="<%=request.getContextPath() %>/upload/${cDTO.getCart_pimage() }"
					    width="300" height="300"></a>
			</div>
			
			<div class="right">
				<b>${cDTO.getCart_pname() }</b><br><br>
				색상선택<br>
				<select name="color">
					<c:forEach items="${colorList }" var="cList">
						<c:if test="${cList == cDTO.getCart_pcolor()}">
							<option value="${cList }" selected>${cList }</option>
						</c:if>
						<c:if test="${cList != cDTO.getCart_pcolor()}">
							<option value="${cList }">${cList }</option>
						</c:if>
					</c:forEach>
				</select> <br><br>
				사이즈 선택<br>
				<select name="size">
					<c:forEach items="${sizeList }" var="sList">
						<c:if test="${sList == cDTO.getCart_psize()}">
							<option value="${sList }" selected>${sList }</option>
						</c:if>
						<c:if test="${sList != cDTO.getCart_psize()}">
							<option value="${sList }">${sList }</option>
						</c:if>
					</c:forEach>
				</select> <br><br>
				수량 선택<br>
				<select name="qty">
					<c:forEach begin="1" end="${pDTO.getPqty() }" var="k">
						<c:if test="${k == cDTO.getCart_pqty()}">
							<option value="${k }" selected>${k }</option>
						</c:if>
						<c:if test="${k != cDTO.getCart_pqty()}">
							<option value="${k }">${k }</option>
						</c:if>
					</c:forEach>
				</select> <br><br>
			</div>
			
			<hr width="100%" color="white">
			<br>
			<div align="center">
				<button type="submit" class="black">변경하기</button>
			</div>
		</form>
	</div>
</body>
</html>