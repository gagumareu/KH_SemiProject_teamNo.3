<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	body {
		height: 100%;
	}
	.cart_btn {
		background-color: black;
		color: white;
		width: 100%;
	}

	.semiCart_wrapper {
		width: 500px;
		height: 900px;;
		border: 2px solid red;
		display: flex;
		flex-direction: column;
	}
	
	.semi_image > img {
		width: 100%;
		
	}
	

	.semiCart_list {
		display: grid;
		grid-template-columns: 13% 87%;
		border-bottom: 1px solid gray;
	}
	
	.semi_image {
		width: 48px;
		grid-column: 1;
	}
	
	.semi_right_side {
		grid-column: 2;
	
	}
	
	.semi_name {
		grid-column: 2;
		font-size: 10px;
	}
	.semiCart_container {
		display: flex;
		flex-direction: column;
	}
	
	.delete_btn {
		float: right;
	}
	
	.cart_list_cont {
		display: flex;
		flex-direction: row;
		justify-content: space-evenly;
	}
	
	.btn {
		margin: 20px 0px;
	}
	
	.contin_btn {
		padding: 20xp 0px;
	
	}
</style>
</head>
<body>
	
	<c:set var="list" value="${semiCartList }"/>
	
	<div class="semiCart_wrapper">
	
		<div class="semiCart_container">
		
			<c:forEach items="${list }" var="dto">
			
				<div class="semiCart_list">
				
					<div class="semi_image">
					<img alt="" src="<%=request.getContextPath()%>/upload/${dto.getCart_pimage() }">
					</div>
					
					<div class="cart_list_cont">
						<div class="semi_name">
							${dto.getCart_pname() }
						</div>
						<div class="semi_right_side">
							${dto.getCart_psize() }
						</div>
						<div class="semi_right_side">
							${dto.getCart_pcolor() }
						</div>
						<div class="semi_right_side">
							${dto.getCart_pqty() }
						</div>
						<div class="semi_right_side">
							${dto.getCart_price() }
						</div>
						<div class="delete_btn"> 
						<a href="#">x</a>
						</div>
					</div>
				</div>
				
			</c:forEach>
			
		</div>
			
			<div>
				A.P.C.KOREA 온라인 스토어는 무료배송 서비스를 제공합니다.(제주, 도서산간 지역도 무료)
			</div>
			
			<div>
				<span>TOTAL PRICE</span>
				<span></span>
			</div>
			
			<div class="btn">
				<div class="cart_btn">장바구니</div>
				<div class="contin_btn">쇼핑계속</div>
			</div>
	</div>



</body>
</html>