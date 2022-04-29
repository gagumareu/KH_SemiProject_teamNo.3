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


	html, body{
		margin:0px;
		padding: 0px;
	}
	
	
 	.detail_wrapper{
	 	margin: 150px 20px 0px 20px;
	 	display: grid;
	 	grid-template-column: 200px 100%;
 		
	}

	/************************************/	
	
	
	.product_contents{
		grid-column: 1;
		width: 200px;
		font-size: 0.8em;

	}
		
	/*************************************/	
	
	.product_images {
		grid-column: 2;
	
	}
	
	.product_image{
		width: 100%;
		
	}
	
	
	/*
	.product_images {
		grid-column: 2;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
	.product_image{
		width: 50%;
		
	}
	.product_image > img{
		width: 100%;
	}
	*/
</style>
</head>
<body>
	
	<jsp:include page="../include/shop_top.jsp"/>
	<jsp:include page="../include/shop_top_right.jsp"/>
	
	<c:set var="dto" value="${Detail }"/>
	
	<c:set var="snc" value="${sNcList }"/>
	
	<div class="detail_wrapper">

		
		<div class="product_contents">
		
			<hr>
			<div>
				<strong>${dto.getPname() }</strong>
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
				색상
			</div>
			<div>
			
				<c:forEach items="${snc }" var="c">
					<a href="#">${c.getPcolor() }</a>
				
				</c:forEach>
				
				
			</div>
			
			
			<div>
				사이즈 
			</div>
			
			<div>
								
				<select>
				
					<c:forEach items="${snc }" var="s">
						<option>
							${s.getPsize() }
						</option>
					</c:forEach>
				
				
				</select>
				
		
				
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
	
	
	
	
	
		<div class="product_images">
		
			<div class="product_image">
				<img alt="" src="<%=request.getContextPath() %>/upload/${dto.getPimage() }">
			</div>

		
		</div> <!-- product_contents end -->
	
	
	
	</div>
	
	<jsp:include page="../include/shop_bottom.jsp"/>
	
	
	
</body>
</html>