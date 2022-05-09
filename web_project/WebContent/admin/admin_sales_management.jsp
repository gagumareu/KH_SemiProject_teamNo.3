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

	<jsp:include page="../include/admin_top.jsp" />
		        
		<div class="col-sm-8 col-sm-offset-3">
		<br><br><br>
        <div class="page-header" align="center"><h2>매출관리</h2></div>
        <br>
		<c:set var="list" value="${salesList }"/>
		
		<table class="table table-bordered table-hover">
			<colgroup>
        		<col width="40%">
        		<col width="20%">
        		<col width="40%">
        	</colgroup>
			<tr style="background-color: #383636; color:white;">
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
				<th colspan="2"><b>총금액</b></th>
				<td>
					<b><fmt:formatNumber value="${totalPrice }"/>원</b>
				</td>
				
			</tr>
			</c:if>
			</c:if>				
		</table>	
	</div>
	</div>		
</body>
</html>