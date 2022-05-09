<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 추가 페이지</title>
<link rel="stylesheet" href="../css/admin_register.css">

<style type="text/css">
	.btnBottom{
		color: black;
		background-color: white;
		font-family: airal;
		font-size:12px;
		font-weight:bold;
		padding: 6px;
		
		border:1px solid gray;
		border-radius: 4px;
		width:65px;
		
		box-shadow: -1px -1px 0px gray;
	}

</style>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp"/>
		        
		<div class="col-sm-8 col-sm-offset-3">
		<br><br><br>
        <div class="page-header" align="center"><h2>카테고리 등록</h2></div>
        <br>		
		
		<form method="post" enctype="multipart/form-data"
		action="<%=request.getContextPath() %>/admin_category_insert_ok.do">
									
			<table>			
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
				<td class="lastTr" colspan ="2" align="center">
				<input class="btnBottom" type="submit" value="등록하기">&nbsp;&nbsp;
				<input class="btnBottom" type="reset" value="다시 작성">									
				</td>					
			</table>	
		</form>
	</div>
</body>
</html>