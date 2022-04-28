<%@page import="com.apc.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
					골프 3번
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
		카테고리 코드 여성
		<select name="pCategory">
			<option selected>
			none
			</option>
			<option value="1w1n0000">
			new arrivals
			</option>
			<option value="1w1s0000">
			shoes
			</option>
			<option value="1w1b0000">
			bags
			</option>
		
		</select>
		</div>
		<br>
		<div>
		카테고리 코드 남성
		<select name="pCategory">
			<option selected>
			none
			</option>
			<option value="2man0000">
			new arrivals
			</option>
			<option value="2mbt0000">
			top
			</option>
			<option value="2mcp0000">
			pants
			</option>
		
		</select>
		</div>
		
		<div>
		이미지
		<input type="file" name="pImage">	
		</div>
		
		<div>
		수량
		<input type="number" name="pQty" min="1">	
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
		분류
		<select name="pIcon">
			<option value="new">
			신상
			</option>
			
			<option value="hit">
			인기
			</option>
			
			<option value="recommand">
			추천
			</option>
			
			<option value="none">
			보통
			</option>
			
		</select>	
		</div>
		
		<div>
		내용
		<textarea rows="20" cols="50" name="content"></textarea>	
		</div>
		
		
		
		<br>
		
		<input type="submit" value="등록">
	
	</form>
	</div>

	
	
	
	
</body>
</html>