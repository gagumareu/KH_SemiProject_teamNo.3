<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 폼 페이지</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var cnt =2;
	function addFile(){
		$("#d_file").append("<input type='file' name='file" +cnt + "'/><br>");
		cnt++;		
	}
	
	

</script>

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
		<span>상품 등록</span>
		<hr width="600" color="gray">
		<br>
		
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath() %>/admin_products_insert_ok.do">
		
		
			<table border="1" cellspacing="0" width="500">
			<c:set var="category" value="${categoryList }"/>
								
				<tr>
					<th>상품 코드</th>
					<td>
					<select name="p_code">
					<c:if test="${empty category }">
						<option value="코드선택">
					</c:if>
					<c:if test="${!empty category }">
						<c:forEach items="${category }" var="dto">
							<option value="${dto.getCategory_code() }">
							${dto.getCategory_name() }[${dto.getCategory_code() }]								
							</option>
						
						</c:forEach>
					</c:if>
					</select>
					</td>
				</tr>
				
				<tr>
					<th>상품명</th>
					<td>
						<input name="p_name"> 
					</td>
					
				</tr>
				
				
				<tr>
					<th>제품 규격</th>
					<td>
						
						<select name="p_size">
							<option value="">선택</option>
							<option value="S">small(S)</option>
							<option value="M">Medium(M)</option>
							<option value="L">Large(L)</option>
							<option value="XL">Extra Large(XL)</option>
							<option value="F">Free(F)</option>
							
						</select>
					</td>
					
				</tr>
				
				<tr>
					<th>제품 색상</th>
					<td>
						<input name="p_color"> 
					</td>
					
				</tr>
				
				<tr>
					<th>제품 가격</th>
					<td>
						<input name="price"> 
					</td>
					
				</tr>
				
				<tr>
					<th>제품 마일리지</th>
					<td>
						<input name="mileage"> 
					</td>
					
				</tr>
				
				<tr>
					<th>재고 수량</th>
					<td>
						<input name="pqty"> 
					</td>
					
				</tr>
				
				
				<tr>
					<th>제품 설명</th>
					<td>
						<textarea rows="7" cols="25" name="p_cont"></textarea>
					</td>
				</tr>
				
				<tr>
					<th>첨부 파일</th>
					<td>					
						<input type="file" name="file1">	
						<div id="d_file"> 
						
						</div>
						
					</td>
					
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input class="btn" type ="button" value="파일 추가" onclick="addFile()">&nbsp;&nbsp;&nbsp;
						<input class="btn" type="submit" value="상품추가">&nbsp;&nbsp;&nbsp;
						<input class="btn" type="reset" value="다시작성">
					</td>
				</tr>
				
				
			
			</table>	
			
			
			
		</form>
	
	</div>
	

</body>
</html>