<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 선택</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>

	#popup_container{
		
		width:90%;
		height:90%;
	}
	#top{
		margin:20px;
		padding:10px;
		border: 5px solid gray;
	}
</style>
</head>
<body>

	<div id="popup_container" align="center">
		<div id="top">
			<select name="search_field">
				<option value="p_name">제품명</option>
				<option value="category">카테고리</option>
			</select>
			<input type="text" name="search_word">
			<button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath()%>/qa_write.do'">
					검색
			</button>
		</div>
		
		<div id="middle">
			<span> </span>
		</div>
		<div id="bottom">
			<table class="table table-hover ">
				<thead>
					<tr class="table-secondary">
						<th scope="col">상품이미지</th>
						<th scope="col">상품정보</th>
						<th scope="col">선택</th>
					</tr>
				</thead>
			</table>
		</div>
		
	</div>

</body>
</html>