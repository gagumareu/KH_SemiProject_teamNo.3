<%@page import="com.apc.model.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    CategoryDAO dao = CategoryDAO.getInstance();
    
    List<CategoryDTO> list = dao.getCategory2();
    
    pageContext.setAttribute("list", list);
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>

<script src="https://kit.fontawesome.com/a705bacd4a.js" crossorigin="anonymous"></script>
</head>
<body>
	
	<div align="center">
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/inputCategory.do">
		<div>
			카테고리 넘버 <br>
			<select name="cno">
				<option value="1">
					여성 1번
				</option>
				
				<option value="2">
					남성 2번
				</option>
				
				<option value="3">
					골프3번
				</option>
			
			</select>
		</div>
		
		<div>
			카테고리 코드
			<input name="ccode">
		</div>
		
		<div>
			카테고리 이름
			<input name="cname">
		</div>
		<br>
		<div>
			카테고리 이미지
			<br>
			<input type="file" name="cimage">
		</div>
		<br>
		<div>
			<input type="submit" value="등록">
		</div>
		</form>
		
	
	</div>
	
	<br>
	<br>
	<br>
	
	<div align="center">
	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/insertProduct.do">
		<h2>상품 등록</h2>
		
		<div>
		이름
		<input name="pName">	
		</div>
		
		<div>
		<select name="pCategory">
		
			<c:forEach items="${list }" var="dto" >
				<option value="${dto.getCategory_code() }">
					${dto.getCategory_name() }[${dto.getCategory_code() }]
				</option>
			
			</c:forEach>
		</select>
		</div>
		
		
		<div>
		이미지
		<input type="file" name="pImage">	
		</div>
		
		<div>
		수량
		<input type="number" name="pQty">	
		</div>
		
		<div>
		가격
		<input name="price">	
		</div>
		
		<div>
		사이즈
		<input name="pSize">	
		</div>
		
		<div>
		색상
		<input name="pColor">	
		</div>
		
		 <div>
		포인트
		<input name="mileag">
		</div>
		
		<div>
		<textarea rows="20" cols="50" name="content"></textarea>	
		</div>
		
		
		
		<br>
		
		<input type="submit" value="등록">
		
		
		
	</form>
	</div>
	
</body>
</html>