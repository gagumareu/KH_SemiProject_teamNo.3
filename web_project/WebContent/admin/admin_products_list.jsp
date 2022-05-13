<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 리스트</title>

<script type="text/javascript">
	function delchk(){
	    return confirm("해당 상품을 삭제하시겠습니까?");
	}


</script>
<link rel="stylesheet" href="./css/admin_products_list.css">
	
</head>
<body>
<jsp:include page="../include/admin_top.jsp" />

<div class="col-sm-8 col-sm-offset-3">
   <br><br><br>
        
	<div class="page-header" align="center"><h2>제품관리</h2></div>
	
	<div>
		<div class="search" align ="right">
			<form  method ="post" action="<%=request.getContextPath() %>/admin_products_search.do">
				<select name = "search_field">
					<option value="code">제품코드</option>
					<option value="name">제품명</option>		
				</select>
				
				<input name ="search_keyword">
				<input type="submit" value="검색">&nbsp;&nbsp;	
				<input class="btn" type="button" value="상품 추가"
						onclick="location.href='admin_products_insert.do'">		
			</form>
		</div>
	
	
	<table border="1" cellspacing="0" width="100%">
		<colgroup>
       		<col width="12%">
       		<col width="13%">
       		<col width="21%">      		
       		<col width="6%">
       		<col width="7%">
       		<col width="10%">      		
       		<col width="7%">
       		<col width="12%">
       		<col width="12%">
       	</colgroup>

		<tr>
			<th>제품코드</th>			
			<th>이미지</th>
			<th>제품명</th>			
			<th>사이즈</th>
			<th>색상</th>
			<th>가격</th>
			<th>재고량</th>
			<th>등록일</th>
			<th>수정  | 삭제</th>
		</tr>
		
		<c:set var="list" value="${ProductsList }"/>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.getPcategory_fk() }</td>								
						<td>
							<c:forTokens var="fileName" items="${dto.getPimage() }" delims="," varStatus="st">
								<c:if test="${st.first }">
									<img src="<%=request.getContextPath() %>/upload/${fileName }" width="100" height="80">
												
								</c:if>
							</c:forTokens>
						</td>
						<td>${dto.getPname() }</td>	
						
						<td>${dto.getPsize() }</td>
						<td>${dto.getPcolor() }</td>
						<td>
							<fmt:formatNumber value="${dto.getPrice() }"/>원
						</td>
						<td>${dto.getPqty() }</td>
						<td>${dto.getPinputdate().substring(0,10) }</td>
						<td>
							<a href="<%=request.getContextPath() %>/admin_products_update.do?no=${dto.getPno() }">
							수정</a>
							&nbsp;|&nbsp;
							<a href="<%=request.getContextPath() %>/admin_products_delete.do?no=${dto.getPno() }&image=${dto.getPimage() }" 
							onclick="return delchk();">
							삭제</a>
						</td>
					</tr>

				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
				<tr>
					<td colspan="9" align="center">
						<h3>검색된 상품이 없습니다. </h3>
					</td>
				</tr>	
			</c:if>
		

	</table>
				
						
		<br>
		<div class="paging_products" align="center">
		<c:if test="${page> block }">
			<a class="paging" href ="admin_products_list.do?page=1">《《</a>
			<a class="paging" href = "admin_products_list.do?page=${startBlock -1 }">《</a>
		</c:if>
		
		<c:forEach begin="${startBlock }"  end="${endBlock }" var ="i">
			<c:if test="${i == page }">
				<b><a class="paging" href="admin_products_list.do?page=${i }">${i }</a></b>
			</c:if>
			
			<c:if test="${i != page }">
				<a class="paging" href="admin_products_list.do?page=${i }">${i }</a>
			</c:if>
		
		</c:forEach>
		
		<c:if test="${endBlock <allPage }">
			<a class="paging" href="adnim_products_list.do?page=${allPage }">》》</a>
			<a class="paging" href="adnim_products_list.do?page=${endBlock +1 }">》</a>
		</c:if>
		</div>
		
		<br>
	</div>
	</div>

	

</body>
</html>