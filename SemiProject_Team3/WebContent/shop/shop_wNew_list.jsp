<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<div>
	A.P.C. WOMEN/NEW ARRIVALS
	</div>
	<c:set var="list" value="${womenList }"/>
	
	<c:if test="${!empty list }">
	<div class="wNewList">
		<c:forEach items="${list }" var="dto">
			<a>
				<img alt="" src="upload/${dto.getPimage() }">
				<span>${dto.getPname() }</span>
				<span>${dto.getPrice() }</span>
			</a>
		
		
		</c:forEach>
	
	
	</div>
	</c:if>
	<c:if test="${empty list }">
		<h4>리스트에 품목이 없습니다.</h4>
	
	</c:if>
	
</body>
</html>