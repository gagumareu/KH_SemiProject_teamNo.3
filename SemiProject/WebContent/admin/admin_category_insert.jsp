<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페고리 추가 페이지</title>
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
		<span>카테고리 등록</span>
		<hr width="600" color="gray">
		<br>
		
		
		<form method="post" enctype="multipart/form-data"
		action="<%=request.getContextPath() %>/admin_category_insert_ok.do">
			
			<table border="1" cellspacing="0" width="600" height="200">
			
			<tr>
				<th>카테고리 대분류</th>
				<td>
					<select name="c_no"> 
						<option value="">대분류</option>
						<option value="1">Women</option>
						<option value="2">Men</option>
						<option value="3">Golf</option>					
					</select>
					
				</td>
			</tr>
			
			<tr>
				<th>카테고리 코드</th>
				<td>
					<input type="text" name="c_code">
				</td>
			</tr>
			
			<tr>
				<th>카테고리 이름</th>
				<td>
					<input type="text" name="c_name">
				</td>
			</tr>
			
			<tr>
				<th>카테고리 이미지</th>
				<td>
					<input type="file" name="c_image">
				</td>
			</tr>
			
			<tr>
				<td colspan ="2" align="center">
				<input class="btn" type="submit" value="등록하기">
				<input class="btn" type="reset" value="다시 작성">				
					
				</td>
					
			</table>
		
			
		
		
		</form>
		
		
	
	</div>

</body>
</html>