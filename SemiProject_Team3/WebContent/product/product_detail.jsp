<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 	.detail_wrapper{
	 	margin-top: 150px;
	 	display: flex;
	 	flex-directin: column;
 
	}

	html, body{
		margin:0px;
		padding: 0px;
	}
	
	.product_image > img{
		width: 100%;
	}
	
</style>
</head>
<body>
	
	<jsp:include page="../include/shop_top.jsp"/>
	
	<c:set var="dto" value="${Detail }"/>
	<div class="detail_wrapper">
	
	
		
		<div class="product_contents">
			<div>
				${dto.getPname() }
			</div>
			<br>
			<div>
				${dto.getPcontents() }
			</div>
			<br>
			<div>
				<fmt:formatNumber value="${dto.getPrice() }"/>원
			</div>
			<div>
				색상 &nsp; ${dto.getPcolor() }
				<br>
				[ 각 컬러별 색상 링크 만들어야 함 ]
			</div>
			<div>
				사이즈 [ 사이즈는 생각 해야  :( ]
			</div>
			
			<div>
				수량 &nsp; <input type="number" min="1" max="8">
			</div>
			
			<div>
				적립금 &nsp; ${dto.getMileage() }
			</div>
			
			<div>
				<a>SIZE GUIDE</a>
			</div>
			<div>
				<a>무이자할부 안내</a>
			</div>
			
			<div>
				<input type="button" value="바로구매">
				<input type="button" value="장바구니">
			</div>

			
		</div> <!-- product_contents end -->
	
	
	
	
	
		<div class="product_contents">
		
			<div class="product_image">
				<img alt="" src="<%=request.getContextPath() %>/upload/${dto.getPimage() }">
			</div>
		
		
		
		</div> <!-- product_contents end -->
	
	
	
	</div>
	
	<jsp:include page="../include/shop_bottom.jsp"/>
	
	
	
</body>
</html>