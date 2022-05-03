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
	 	margin: 0px 20px 0px 20px;
	 	display: grid;
	 	grid-template-column: 200px 100%;
	 	padding-top: 150px;
 		
	}

	/************************************/	
	
	
	.product_contents{
		grid-column: 1;
		width: 200px;
		font-size: 0.8em;
		line-height: 1.8;

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
	
	<c:set var="clist" value="${clist }"/>
	
	<c:set var="slist" value="${slist }"/>
	
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
				색상 ${dto.getPcolor() }
			</div>
			<div>		
				<c:if test="${!empty clist }" >
				<c:forEach items="${clist }" var="list">
					<a href="#">${list.getPcolor() }</a>
				
				</c:forEach>
				</c:if>
				
				<c:if test="${empty clist }">
						검색된 데이터가 없어 :(
				</c:if>
				
			</div>
			
			<div>
				사이즈	
					<c:if test="${!empty slist }" >
					<select>
					<c:forEach items="${slist }" var="sizeList">
						<option>
							${sizeList.getPsize() }
						</option>
					</c:forEach>
					</select>
					</c:if>
					
					<c:if test="${empty slist }">
						검색된 데이터가 없어 :(
					</c:if>
			</div>
			
			<div>
				 수량
				 <select name="qty">
				 	<c:forEach begin="1" end="10" var="count">
				 		<option>
				 			${count }
				 		</option>
				 	</c:forEach>	
				 </select>
			</div>
			
			<div>
				적립금<fmt:formatNumber value="${dto.getMileage() }" />원 
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