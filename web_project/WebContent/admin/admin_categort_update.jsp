<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페고리 수정 폼 페이지</title>
<link rel="stylesheet" href="./css/admin_register.css">

<style type="text/css">
	#c_code{
		border:none;
	}

</style>
</head>
<body>

	<jsp:include page="../include/admin_top.jsp"/>
		        
		<div class="col-sm-8 col-sm-offset-3">
		<br><br><br>
        <div class="page-header" align="center"><h2>카테고리 수정</h2></div>
        <br>
		
		
		<form method="post" enctype="multipart/form-data"
		action="<%=request.getContextPath() %>/admin_category_update_ok.do">
			
			<c:set var="dto" value="${CategoryCont }"/>
					
			<table>			
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
					<input id="c_code" type="text" name="c_code" value="${dto.getCategory_code() }" readonly>
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
					<img src="<%=request.getContextPath() %>/image_category/${dto.getCategory_image() }"
					width="150" height="120"><br>				
					<input type="file" name="c_image_new">
					
					<input type="hidden" name="c_image_old" value="${dto.getCategory_image() }">
				</td>
			</tr>
			
			<tr>
				<td class="lastTr" colspan ="2" align="center">
				<input class="btnBottom" type="submit" value="수정하기">&nbsp;&nbsp;	
				<input class="btnBottom" type="button" value="목록으로"
					onclick="location.href='<%=request.getContextPath()%>/admin_category_list.do?num=${dto.getCategory_no() }'">							
				</td>
					
			</table>
		</form>
	</div>
</body>
</html>