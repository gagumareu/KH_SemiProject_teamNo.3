<%@page import="com.apc.model.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	CategoryDAO dao = CategoryDAO.getInstance();
	List<CategoryDTO> list = dao.getCategoryCode();
	
	pageContext.setAttribute("cList", list);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 상품등록</title>
</head>
<body>

	<hr width="65%" color="teal">
		<h3>상품 등록 페이지</h3>
		<hr width="65%" color="teal">
		<br>
		
		<form method="post" enctype = "multipart/form-data" 
			action="<%=request.getContextPath() %>/product_upload.do">
			<table border="1" cellspacing="0" width="400">
			<c:set var="list" value="${cList }"/>
				<tr>
					<th>카테고리 코드</th>
					<td>
						<select name="p_category">
						<c:if test="${empty list }">
							<option value="">::카테고리코드 없음::</option>
						</c:if>
						<c:if test="${!empty list }">
							<c:forEach items="${list }" var="dto">
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
					<td><input type="text" name="p_name"></td>
				</tr>			
				<tr>
					<th>상품 이미지</th>
					<td><input type="file" name="p_image" multiple></td>
				</tr>			
				<tr>
					<th>상품 수량</th>
					<td><input type="number" name="p_qty" min="1" max="100" value="1"></td>
				</tr>			
				<tr>
					<th>상품 가격</th>
					<td><input type="text" name="p_price" maxlength="8">원</td>
				</tr>			
				<tr>
					<th>상품 사이즈</th>
					<td><input type="text" name="p_size" maxlength="8"></td>
				</tr>			
				<tr>
				<tr>
					<th>상품 칼라</th>
					<td><input type="text" name="p_color" maxlength="8"></td>
				</tr>			
				<tr>
					<th>상품 아이콘</th>
					<td>
						<select name="p_icon">
							<option value="none" selected>일반</option>
							<option value="hit" >인기</option>
							<option value="new" >최신</option>
							<option value="recommend" >추천</option>
						</select>
					</td>
				</tr>			
				<tr>
					<th>상품 소개</th>
					<td><textarea rows="7" cols="30" name="p_contents"></textarea></td>
				</tr>			
				<tr>
					<th>상품 포인트</th>
					<td><input type="text" name="p_mileage"></td>
				</tr>			
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록"> &nbsp;&nbsp;
						<input type="reset" value="새로고침">
					</td>
				</tr>			
			</table>		
		</form>
	</div>

</body>
</html>