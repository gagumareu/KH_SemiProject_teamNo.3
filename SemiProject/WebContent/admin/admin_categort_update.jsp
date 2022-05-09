<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페고리 수정 폼 페이지</title>

<style type="text/css">
	.btn{
		color: white;
		background-color: black;
		font-family:bold;
	}

</style>


</head>
<body>

	<div align="center">
		<span>카테고리 수정</span>
		<hr width="600" color="gray">
		<br>
		
		
		<form method="post" enctype="multipart/form-data"
		action="<%=request.getContextPath() %>/admin_category_update_ok.do">
			
			<c:set var="dto" value="${CategoryCont }"/>
		
			
			<table border="1" cellspacing="0" width="600" height="200">
			
			<tr>
				<th>카테고리 대분류</th>
				<td>
					<select name="c_no"> 
						<option value=""
						<c:if test="${dto.getCategory_no()==''}">selected</c:if>>
						선택
						</option>
						
						<option value="1"
						<c:if test="${dto.getCategory_no()=='1'}">selected</c:if>>
						Women
						</option>
						
						<option value="2"
						<c:if test="${dto.getCategory_no()=='2'}">selected</c:if>>
						Men
						</option>
						
						<option value="3"
						<c:if test="${dto.getCategory_no()=='3'}">selected</c:if>>
						Golf
						</option>													
					</select>
					
				</td>
			</tr>
			
			<tr>
				<th>카테고리 코드</th>
				<td>
					<input type="text" name="c_code" value="${dto.getCategory_code() }" readonly>
				</td>
			</tr>
			
			<tr>
				<th>카테고리 이름</th>
				<td>
					<input type="text" name="c_name" value="${dto.getCategory_name() }">
				</td>
			</tr>
			
			<tr>
				<th>카테고리 이미지</th>	
				<td>								
					<img src="<%=request.getContextPath() %>/image/${dto.getCategory_image() }"
					width="150" height="120"><br>				
					<input type="file" name="c_image_new">
					
					<input type="hidden" name="c_image_old" value="${dto.getCategory_image() }">
				</td>
			</tr>
			
			<tr>
				<td colspan ="2" align="center">
				<input class="btn" type="submit" value="수정하기">
				<input class="btn" type="reset" value="다시 작성">									
				</td>
					
			</table>
		</form>
	</div>
</body>
</html>