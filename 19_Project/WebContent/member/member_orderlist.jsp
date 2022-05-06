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
			<td colspan="3" align="center">
				${dto.getOrderdate() }
			</td>
		</tr>
	
		</c:forEach>	
		</c:if>
		
		
		<c:if test="${empty list }">
		<tr>
		<td> <h2>결제내역이 없습니다.</h2> </td>
		</tr>
		</c:if>
	</table>

	</div>


</body>
</html>