<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 폼 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin_register.css">

<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var cnt =2;
	function addFile(){
		$("#d_file").append("<input type='file' name='file" +cnt + "'/><br>");
		cnt++;		
	}
	
</script>

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
        <div class="page-header" align="center"><h2>상품 등록</h2></div>
        <br>
		
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath() %>/admin_products_insert_ok.do">
		
		
			<table>
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
					<th>상품 규격</th>
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
					<th>상품 색상</th>
					<td>
						<input name="p_color"> 
					</td>					
				</tr>
				
				<tr>
					<th>상품 가격</th>
					<td>
						<input name="price"> 
					</td>					
				</tr>
				
				<tr>
					<th>상품 마일리지</th>
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
					<th>상품 설명</th>
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
					<td colspan="2" align="center" class="lastTr">
						<input class="btnBottom" type ="button" value="파일추가" onclick="addFile()">&nbsp;&nbsp;&nbsp;
						<input class="btnBottom" type="submit" value="상품등록">&nbsp;&nbsp;&nbsp;
						<input class="btnBottom" type="reset" value="다시작성">
					</td>
				</tr>
											
			</table>							
		</form>	
	</div>	
</body>
</html>