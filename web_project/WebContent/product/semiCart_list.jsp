<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	body {
		height: 100%;
	}
	
	
	.btn {
		font-weight: bold;
		padding: 20px 0px;
		text-align: center;
	}
	
	
	.cart_btn {
		background-color: black;
		color: white;
		width: 100%;
		height: 40px;
		margin-bottom: 30px;
		
	}
	
	.cart_btn:hover {
		background-color: white;
		border: 1px solid black;
		color: black;
	
	}
	
	.cart_btn div {
		padding-top: 10px;
	}

	.contin_btn {
		padding: 20xp 0px;
		
	
	}

	.semiCart_wrapper {
		width: 500px;
		height: 900px;;
		display: flex;
		flex-direction: column;
	}
	
	
	.semiCart_container {
		display: flex;
		flex-direction: column;
		height: 500px;
	}
	
	
	.semi_image > img {
		width: 100%;
		
	}
	
	
	
	.semiCart_container {
		display: grid;
		grid-template-columns: 15% 15% 45% 25%; 
	
		border-bottom: 1px solid gray;
		
		font-size: 14px;
		height: 100px;
	}
	
	.semi_image {
		width: 70px;
		grid-column: 1;
		
	}
	.semi_image > img {
		width: 100%;
	}
	
	.semi_name {
		grid-column: 2;
		font-size: 10px;

	}
	
	.semi_Name_text {
		padding-top: 20px;
	
	}
	.semi_list {
		gird-column: 3;
	}
	
	.semi_price {
		grid-column: 4;
		padding-top: 35px;
	}
	
	.semi_list > ul > li{
		width: 100%;
		list-style:none;
		display: flex;
		flex-direction: row;
		
	}
	.semi_list > ul {
		display: flex;
		flex-direction: row;
	}
	
	.semiCart_price {
		grid-column: 3;
	}
	
	.ulList {
		display: flex;
		flex-direction: row;
	}
	.sub_text {
		padding: 20px 0px 0px 0px;
		font-size: 0.8em;
		font-weight: 600;
	
	}
	
	.totalPrice {
		padding: 14px 0px 0px 0px;
		font-weight: bold;
	}
</style>
</head>
<body>
	
	<c:set var="list" value="${semiCartList }"/>
	
	<div class="semiCart_wrapper">
	
		
		
			<c:forEach items="${list }" var="dto">
			
			
			<div class="semiCart_container">	
					<div class="semi_image">
					<img alt="" src="<%=request.getContextPath()%>/upload/${dto.getCart_pimage() }">
					</div>
					
					<div class="semi_Name">	
						<div class="semi_Name_text">${dto.getCart_pname() }</div>
					</div>
					
					<div class="semi_list">
					
						<ul class="ulList">
							<li>
								SIZE
							</li>
							<li>
								COLOR
							</li>
							<li>
								QTY
							</li>
						</ul>	
						
						<ul class="ulList">
							<li class="semi_right_side">
								${dto.getCart_psize() }	
							</li>
							<li class="semi_right_side">
								${dto.getCart_pcolor() }
							</li>
							<li class="semi_right_side">
								${dto.getCart_pqty() }
							</li>
												
						</ul>
					</div>	
					
					<div class="semi_price">
					<fmt:formatNumber value="${dto.getCart_price()*dto.getCart_pqty() }" />원
							
					</div>

					
				</div>
			</c:forEach>
			
	
			<div class="sub_text">
				A.P.C.KOREA 온라인 스토어는 무료배송 서비스를 제공합니다.(제주, 도서산간 지역도 무료)
			</div>
			
			<div class="totalPrice">
				<span>TOTAL PRICE</span>
				<span></span>
			</div>
			
			<div class="btn">
				<div class="cart_btn"><div>장바구니</div></div>
				<div class="contin_btn">쇼핑계속</div>
			</div>
			
	</div>



</body>
</html>