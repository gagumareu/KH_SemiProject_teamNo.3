<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

	.wrapper{
	display: flex;
	flex-direction: row;
	
	}
	.wNewList{
	width:20%;
	}
	.wNewList img{
	width:100%;
	}

</style>
</head>
<body>

	<jsp:include page="/include/shop_top.jsp"/>

	<c:set var="list" value="${womenList }"/>
	
	<div>
	A.P.C. WOMEN/NEW ARRIVLAS
	</div>
	
	<br>
	
	<div class="wrapper">
	
		
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				
				<div class="wNewList">
				<a>
					<img alt="" src="upload/${dto.getPimage() }">
					<span>${dto.getPname() }</span>
					<span><fmt:formatNumber value="${dto.getPrice() }"/></span>
				</a>
			
				</div>
			</c:forEach>		
		</c:if>
		
		
		
		<c:if test="${empty list }">
			<h4>리스트에 품목이 없습니다.</h4>
		
		</c:if>
	
	
	</div>
	
	<jsp:include page="/include/shop_bottom.jsp"/>
	
</body>
</html>