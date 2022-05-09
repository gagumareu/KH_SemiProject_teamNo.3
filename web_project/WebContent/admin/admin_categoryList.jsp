<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 리스트</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin_category_list.css">

</head>
<body>
	
	<jsp:include page="../include/admin_top.jsp" />

	<div class="col-sm-8 col-sm-offset-3">
   <br><br><br>
        
	<div class="page-header" align="center"><h2>카테고리 관리</h2></div>
	
	<div class="catePaging">
	
	<a class="paging" href="<%=request.getContextPath() %>/admin_category_list.do?num=1">Women</a>
	<a class="paging" href="<%=request.getContextPath() %>/admin_category_list.do?num=2">Men</a>
	<a class="paging" href="<%=request.getContextPath() %>/admin_category_list.do?num=3">Golf</a>
	<input class="btn_add" type="button" value="추가"
						onclick="location.href='admin/admin_category_insert.jsp'">	
	
	</div>
	
	<table border="1" cellspacing="0" width="100%">
		<colgroup>
       		<col width="15%">
       		<col width="25%">
       		<col width="40%">      		
       		<col width="20%">
       		
       	</colgroup>
	
	
		<tr>
			<th>대분류</th>
			<th>카테고리 코드</th>
			<th>카테고리 이름</th>
			<th>수정 | 삭제</th>		
		</tr>
		<c:set var="list" value="${CategoryList }"/>
		
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.getCategory_no() }</td>
					<td>${dto.getCategory_code() }</td>
					<td>${dto.getCategory_name() }</td>
					<td align="center">
						<input class="btn" type="button" value="수정"
						onclick="location.href='admin_category_update.do?code=${dto.getCategory_code() }'">
						&nbsp;|&nbsp;
						<input class="btn" type="button" value="삭제"
						onclick="if(confirm('삭제하시겠습니까?')){
							location.href='admin_category_delete.do?code=${dto.getCategory_code() }&image=${dto.getCategory_image() }'
						}else{
							return;
						}">
					</td>
				</tr>
			
			</c:forEach>		
		</c:if>
		
		<c:if test="${empty list }">
			<tr>
				<td colspan="4" align="center">
					<h3>검색된 카테고리가 없습니다.</h3>
				</td>
			
		</c:if>
	
	</table>
	<br>
	<hr>
	<br>
	</div>
	

</body>
</html>