<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	tr th{
		background-color: black;
		color:white;
		height: 50px;
		
	}
	.btn_add{
		color: white;
		background-color: black;
		font-family:bold;		
		width:113px;
		height: 35px;		
		margin-top: 14px;
		margin-left: 642px;
	}
	
	.btn{
		background-color: transparent;
		border:0;
		outline:0;	
	}
	
	table{
		margin-left: 0;
	}
	
	


</style>
</head>
<body>
	
	<div align="center" width="1000px">
	
	<span>카테고리 관리</span>
	<hr>
	
	<table border="1" cellspacing="0" width="800">
		<tr>
			<th>카테고리 번호</th>
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
							location.href='admin_category_delete.do?code=${dto.getCategory_code() }'
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
			<input class="btn_add" type="button" value="추가"
						onclick="location.href='admin/admin_category_insert.jsp'">						
				
	
	
	</div>
	

</body>
</html>