<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function deleteFile(num){
		
		document.querySelector("#old_image_" + num).remove();	
		
	}
	var cnt=1;
	function addFile(){		
		$("#a_file").append("<input type='file' name='new_image" +cnt+ "'/><br> ");
		cnt++;
	}


</script>

</head>
<body>

	<div align="center">
		<span>상품 수정</span>
		<hr width="600" color="gray">
		<br>
		
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath() %>/admin_products_update_ok.do">
		
		
			<table border="1" cellspacing="0" width="500">
			<c:set var="dto" value="${productCont }"/>
				
				<input type="hidden" name="p_no" value="${dto.getPno() }">
				
				<tr>
					<th>상품 코드</th>
					<td>
					<input name="p_code" value="${dto.getPcategory_fk() }" readonly>					
					</td>
				</tr>
				
				<tr>
					<th>상품명</th>
					<td>
						<input name="p_name" value="${dto.getPname() }"> 
					</td>
					
				</tr>
				
				
				<tr>
					<th>제품 규격</th>
					<td>
						
						<select name="p_size">
							<option value=""
							<c:if test="${dto.getPsize() =='' }">select</c:if>>선택</option>
							<option value="S" <c:if test="${dto.getPsize() =='S' }">selected</c:if>>small(S)</option>
							<option value="M" <c:if test="${dto.getPsize() =='M' }">selected</c:if>>Medium(M)</option>
							<option value="L" <c:if test="${dto.getPsize() =='L' }">selected</c:if>>Large(L)</option>
							<option value="XL" <c:if test="${dto.getPsize() =='XL' }">selected</c:if>>Extra Large(XL)</option>
							<option value="F" <c:if test="${dto.getPsize() =='F' }">selected</c:if>>Free(F)</option>
							
						</select>
					</td>
					
				</tr>
				
				<tr>
					<th>제품 색상</th>
					<td>
						<input name="p_color" value="${dto.getPcolor() }"> 
					</td>
					
				</tr>
				
				<tr>
					<th>제품 가격</th>
					<td>
						<input name="price" value="${dto.getPrice() }"> 
					</td>
					
				</tr>
				
				<tr>
					<th>제품 마일리지</th>
					<td>
						<input name="mileage" value="${dto.getMileage() }"> 
					</td>
					
				</tr>

				
				<tr>
					<th>재고 수량</th>
					<td>
						<input name="pqty" value="${dto.getPqty() }"> 
					</td>
					
				</tr>
				
				
				<tr>
					<th>제품 설명</th>
					<td>
						<textarea rows="7" cols="25" name="p_cont" value="${dto.getPcontents() }"></textarea>
					</td>
				</tr>
				
				<tr>
					<th>첨부 파일</th>
					<td>
						<input type="hidden" name="old_image_str" value="${dto.getPimage() }">
					
						<c:set var="imageList" value="${pimageList }"/>
							<c:if test="${!empty imageList }">
							<c:forEach items="${imageList }" var="listFile" begin="0" end="${imageList.size() -1 }" varStatus="status">
								
								<div id="old_image_${status.index}">
								<input type="hidden" name="index${status.index}" value="${status.index }">
								<a href="<%=request.getContextPath() %>/image_products/${listFile }" >${listFile.substring(10) }</a>
								<input type="button" value="삭제"  onclick="deleteFile('${status.index}')"><br>
								</div>
							</c:forEach>
							</c:if>
							
							
							
							
							<div id="a_file">
								
							</div>
							
						<%-- <input type="file" name="p_image_new">				 
				  		<input type ="hidden" name="p_image_old"
				  		value="${dto.getPimage() }"> --%>
					</td>
					
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="파일 추가"
						onclick="addFile()">&nbsp;&nbsp;&nbsp;
						<input type="submit" value="상품수정">&nbsp;&nbsp;&nbsp;
						<input type="button" value="작성 취소"
						onclick="location.href='admin_products_list.do'">
					</td>
				</tr>
			
			</table>		
		</form>
	
	</div>

</body>
</html>