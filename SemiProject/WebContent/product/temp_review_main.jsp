<%@page import="com.apc.model.ReviewDTO"%>
<%@page import="com.apc.model.ReviewDAO"%>
<%@page import="com.apc.model.PaymentDTO"%>
<%@page import="com.apc.model.PaymentDAO"%>
<%@page import="com.apc.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	PaymentDAO dao = PaymentDAO.getInstance();
	String id = "hong";
	List<PaymentDTO> paylist = dao.getPayList(id);
	
	pageContext.setAttribute("List", paylist);
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>hong님 구매내역 </h3>
	<table border="1" cellspacing="0">
	<c:set var="list" value="${List }" />
	<c:if test="${empty list }">
	정보가 없습니다.
	</c:if>
	<c:if test="${!empty list }">
	<c:forEach items="${list }" var="dto">
	<tr>
		<th>구매번호</th>
		<th>제품정보</th>
		<th>이동하기</th>
	</tr>
	<tr>	
		<td>${dto.getOrder_no() }</td>
		<td>${dto.getPname() }</td>
		<td>
		
		
			<a href="<%=request.getContextPath()%>/review_write.do?no=${dto.getOrder_no()}" 
			onclick="window.open( this.href, '_blank', 'width=470,height=490, scrollbars=yes,directories=no'); return false ">리뷰쓰기</a>
			<a href="<%=request.getContextPath()%>/qa_write.do?num=${dto.getPno_fk()}">문의하기</a>
			<a href="<%=request.getContextPath()%>/review_update.do?num=${dto.getPno_fk()}">리뷰수정</a>
		
		
		</td>
	</tr>	
	
	
	
	
	</c:forEach>
	</c:if>
	</table>

</body>
</html>