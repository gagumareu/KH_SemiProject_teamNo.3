<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>A.P.C 주문내역</h1>

	<div class="content">
	<c:set var="list" value="${payInfo }" />
	
	<table>
		<c:if test="${!empty list }">
		<c:forEach items="${list }" var="dto">
		<tr>
			<td colspan="4" align="center">
				${dto.getOrderdate().substring(0, 7) }
			</td>
		</tr>
		
		<tr>
		<td rowspan="3" align="center">
			이미지 넣기
		</td>
		
		<td colspan="2">
			${dto.getPname() }
		</td>
		
		<td rowspan="3" align="center">
			<input type="button" class="button" value="Q/A">
		</td>
		</tr>
		
		<tr>
		<td>
			<fmt:formatNumber value="${dto.getPrice() }" />
		</td>
		
		<td>
			${dto.getOrderdate().substring(0, 10) }
		</td>
		</tr>
		
		</c:forEach>	
		</c:if>
		</table>
		
		
	
		
		
		
		<c:if test="${empty list }">
		<tr>
		<td> <h2>결제내역이 없습니다.</h2> </td>
		</tr>
		</c:if>


	</div>


</body>
</html>