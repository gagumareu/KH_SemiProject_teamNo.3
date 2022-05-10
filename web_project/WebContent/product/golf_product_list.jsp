<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A.P.C. 아페쎄 공식 온라인 스토어 > GOLF > 제품 목록</title>
</head>
<body>

	<div id="golf_product">
			<div id="golf_sub_top">
		<ul>
		<li class="home">
		<a href="../index.jsp">A.P.C.</a>
		</li>
		<li class="eng">
			GOLF
		</li>
		</ul> 
		</div> <!-- id="golf-top" end -->
		
		<c:set var="list" value="${productList }"/>
		<c:if test="${empty list }">
		<h3>정보가 없습니다.</h3>
		</c:if>
		
		<c:if test="${!empty list }">
		<div id="golf_product_body">
			<c:forEach items="${list }" var="dto">
				<div class="gw_sub">
					<a href="<%=request.getContextPath() %>/golf_product_detail.do?code=${dto.getCategory_code()}">
					<!-- ++dto파일이미지 받아 화면표시하기 -->
						<img src="../e_image/wTshirt1_1.jpg" alt="gw_tshirt1">
					<div class="overlay">
						<p>${dto.getCategory_name() }</p>
					</div>
				</a>		
				</div>
			</c:forEach>
		
		
		
		</div>
		
		</c:if>
	
	
	
	</div>

</body>
</html>