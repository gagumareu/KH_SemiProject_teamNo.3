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
	
	
 	
	/************************************/	
	
	.apcTitle{
		margin-top: 50px;
		font-size: 63px;
		margin-left: 15px;
		font-weight: bold;
		width: 100%;
	}
	
	.apcTitle > a{
		color: black;
		text-decoration: none;
	}
	
	.apcTitle > a:hover{
		color: white;
		text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
	}

	.col > a > img{
		width:100%;
	}
	
	/**************************/
	
	.detail_wrapper{
	 	display: flex;
		flex-direction: column;
		min-heigth: 100vh;
 		
	}
	
	
	.product_contents{
		display: grid;
	 	grid-template-column: 200px 100%;		
	 	
		

	}
		
	/*************************************/	
	
	.product_left_detail {
		grid-column: 1;
		width: 200px;
		font-size: 0.8em;
		line-height: 1.8;
		margin-top: 40px;
		margin-left: 20px;
		height: 450px;
		position: sticky;
		top: 0;
	}
	
	.product_images {
		width: 50%;
		grid-column: 2;
		place-self: center;
	}
	

	
	.product_images img {
		width: 100%;
		
	}
	
	.company_contact {
	
		
	}
	
	.company_contact ul{
		
	}
	

	
</style>
</head>
<body>

	
	<c:set var="dto" value="${Detail }"/>
	
	<c:set var="clist" value="${clist }"/>
	
	<c:set var="slist" value="${slist }"/>
	
	<div class="detail_wrapper">

		<jsp:include page="../include/shop_top.jsp"/>
		<jsp:include page="../include/shop_top_right.jsp"/>
		
		<div class="apcTitle">
			<a href="<%=request.getContextPath() %>/index.jsp">A.P.C.</a> 
		</div>
		
		<div class="product_contents">	
			
			<div class="product_left_detail">
				
				<form method="post" action="<%=request.getContextPath() %>/product_cart_list.do">
			
					<input type="hidden" name="pno" value="${dto.getPno() }">
					<input type="hidden" name="mileage" value="${dto.getMileage() }">
					<input type="hidden" name="color" value="${dto.getPcolor() }">
			
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
								검색된 데이터가 없어요 :(
						</c:if>
						
					</div>
					
					<div>
						사이즈	
							<c:if test="${!empty slist }" >
							
							<select name="size">
								<c:forEach items="${slist }" var="sizeList">
									<option value="${sizeList.getPsize() }">
									
										<c:if test="${sizeList.getPqty() == 0 }">
											${sizeList.getPsize() } (SOLD OUT)
										</c:if>
										
										<c:if test="${sizeList.getPqty() != 0 }">
											${sizeList.getPsize() }
										</c:if>
										
									</option>
								</c:forEach>
							</select>
							
							</c:if>
							
							<c:if test="${empty slist }">
								검색된 데이터가 없어요 :(
							</c:if>
					</div>
					
					<div>
						 수량
						 <select name="qty">
						 	<c:forEach begin="1" end="10" var="count">
						 		<option value="${count }">
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
						<input type="submit" value="바로구매">
						<input type="button" value="장바구니">
					</div>
					
					 
					
			</form>
			
			
			</div><!-- product_left_detail end -->
				
				<!-- <div class="company_contact">
						<ul>
							<li>상품필수정보</li>
							<li>배송안내</li>
							<li>공유하기</li>
						</ul>
						<div class="callNo">
							고객센터 1833-2250
						</div>
					</div>
				 -->
			
			
			<div class="product_images">
			
					<img alt="" src="<%=request.getContextPath() %>/upload/${dto.getPimage() }">
					
			</div><!-- product_images end -->
	
		</div> <!-- product_contents end -->
	
	
	
	
	
		
	
	
	</div> <!-- detail_wrapper END -->
	
	<jsp:include page="../include/shop_bottom.jsp"/>
	
	
	
</body>
</html>