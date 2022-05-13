<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">

	<h1>Main</h1>
	<c:set var="dto" value="${memberDb }" />
	
	<c:if test="${empty dto }">
	<a href="<%=request.getContextPath() %>/loginMain.do">로그인/주문조회</a>

	<a href="<%=request.getContextPath()%>/order.do">결제하기</a>
	</c:if>
	
	<c:if test="${!empty dto }">
	<a href="<%=request.getContextPath() %>/memberLogout.do">로그아웃</a>

	<a href="<%=request.getContextPath()%>/order.do?member_id=${dto.getMemid() }">결제하기</a>
	
	<a href="<%=request.getContextPath() %>/orderlist.do?member_id=${dto.getMemid() }">결제내역</a>
	</c:if>

	</div>
	
</body>
</html>