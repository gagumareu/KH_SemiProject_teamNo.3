<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<style>
		a{
			text-decoration: none;
			color: black;
		}
		
		header{
			font-family: Arial;
		}
		
		header a:hover{
			font-family: Arial;
			color : white;
			text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
		}

		section{
			margin: 75px;
			text-align: center;
			font-size: 0.75em;
			font-family: 나눔고딕;
		}
		
		div{
			display: inline-block;
			text-align: left;
			width: 75%;
		}
		form{
			border-left: thin solid lightgray;
			width: 30%;
			padding: 0 0 0 2%;
			float: right;
		}
		div.left{
			width: 65%;
			padding: 0 2% 0 0;
			float: left;
		}
		
		div.left2{
			width: 20%;
			padding: 0 2% 0 0;
			float: left;
		}
		
		div.left3{
			width: 25%;
			float: left;
			color: gray;
		}
		
		div.center{
			width: 60%;
			float: left;
		}
		
		div.right{
			width: 30%;
			float: right;
			text-align:right;
		}
		
		div.right2{
			width: 15%;
			float: right;
			text-align:right;
		}
		
		button.black{
			background-color: black;
			color: white;
			width: 100%;
			height: 40px;
		}
		
		button.white{
			border: 0;
			font-size: 15px;
			background-color: white;
		}
		
		input.check{
			position: relative;
        	top: 5px;
			width: 17px;
			height: 17px;
		}
		
		input.image{
			position: relative;
        	top: -85px;
			width: 17px;
			height: 17px;
		}
		
		select{
			width: 75px;
			border: 0;
		}
		
	</style>
</head>
<body>
	<header>
		<h1 style="font-size: 60px;"><a href="mainPage.jsp">A.P.C.</a> 
		CART</h1>
	</header>
	
	<section>
		<c:set var="cList" value="${cartList }" />
		<div>
			<div class="left">
			 	<input type="checkbox" class="check" /> <b>전체상품선택</b>
				<hr color="lightgray">
				<br><br>
				<c:forEach items="${cList }" var="cDTO">
					<div class="left2">
						<input type="checkbox" class="image" />
						<a><img src="<%=request.getContextPath() %>/upload/${cDTO.getCart_pimage() }"
					       width="100" height="100"></a>
					</div>
					
					<!-- ajax가 필요해 보인다. ajax로 jsp 페이지 안에서 dao 메서드를 연산이 가능한가를 알아봐야한다. -->
					<div class="center">
						<a><b>${cDTO.getCart_pname() }</b></a><br><br><br>
						<div class="left3">
							SIZE<br><br>
							<select>
								<option value="${cDTO.getCart_psize() }" selected>${cDTO.getCart_psize() }</option>
							</select>
						</div>
						<div class="left3">
							COLOR<br><br>
							<select>
								<option value="${cDTO.getCart_pcolor() }" selected>${cDTO.getCart_pcolor() }</option>
							</select>
						</div>
						<div class="left3">
							QTY<br><br>
							<button class="white">-</button>
							&nbsp;<span style="font-size: 15px;">${cDTO.getCart_pqty() }</span>&nbsp;
							<button class="white">+</button>
						</div>
					</div>
					
					<!-- ajax를 공부하고 다시 봐봐야겠다. ajax로 jsp 페이지 안에서 dao 메서드를 연산이 가능한가를 알아봐야한다. -->
					<div class="right2">
						<a href="<%=request.getContextPath() %>/deleteCart.do?num=${cDTO.getCart_no() }">X</a><br><br>
						적립금 <fmt:formatNumber value="555555" />원<br><br>
						<b><fmt:formatNumber value="${cDTO.getCart_price() * cDTO.getCart_pqty() }" />원</b>
					</div>
					<br><br>
					<hr width="100%" color="white">
					<br><br>
				</c:forEach>
			</div>
			<form><b>장바구니 결제금액</b>
				<hr>
				<br><br>
				
				<div class="left">
					<b>판매가</b><br><br>
					할인금액<br><br>
					적립금<br><br>
					배송비<br><br>
				</div>
				
				<!-- ajax로 판매가 합산이 가능하지 않을까 기대해보며 넘어간다. -->
				<div class="right">
					<b>원</b><br><br>
					원<br><br>				
					<fmt:formatNumber value="5555555" />원<br><br>
					원<br><br>
				</div>
				
				<hr color="lightgray" width="100%">
				<br><br>
				
				<div class="left">
					<b>구매예상금액</b>
				</div>
				
				<div class="right">
					<b>원</b>
				</div>
				<br><br><br><br>
				<button type="submit" class="black"><b>구매하기</b></button>
			</form>
		</div>
	</section>
</body>
</html>