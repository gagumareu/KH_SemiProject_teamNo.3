<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리</title>
</head>
<body>

	<div align="center">
	
	<h3>일자별 매출관리</h3>
	<hr>
		<c:set var="list" value="${salesList }"/>
		
		<table border="1" cellspacing="0" width="500">
			<tr>
				<th>매출일</th>
				<th>판매 건수</th>
				<th>매출금액</th>				
			</tr>
			
			<c:if test="${!empty list}">
			<c:forEach items="${list }" var="dto">
			<tr>	
				<td>${dto.getOrderdate() }</td>
				<td>${dto.getCount() }</td>
				<td>
					<fmt:formatNumber value="${dto.getPrice_sum() }"/>원			
				</td>				
			</tr>		
			</c:forEach>
			
			<c:if test="${!empty totalPrice }">
			<tr>
				<th colspan="2">총금액</th>
				<td>
					<fmt:formatNumber value="${totalPrice }"/>원
				</td>
				
			</tr>
			</c:if>
			</c:if>				
		</table>	
	</div>		
</body>
</html>