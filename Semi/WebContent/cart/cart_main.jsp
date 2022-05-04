<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		div.right{
			width: 30%;
			float: right;
			text-align:right;
		}
		
		button{
			background-color: black;
			color: white;
			width: 100%;
			height: 40px;
		}
		
		input{
			position: relative;
        	top: 5px;
			width: 17px;
			height: 17px;
		}
		
	</style>
</head>
<body>
	<header>
		<h1 style="font-size: 60px;"><a href="mainPage.jsp">A.P.C.</a> 
		CART</h1>
	</header>
	
	<section>
		<div>
			<div class="left">
			 	<input type="checkbox" /> <b>전체상품선택</b>
				<hr color="lightgray">
				<br><br>
				<div class="left">
					<input type="checkbox" />
					
					
				</div>
				<div class="right">
					
				</div>
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
				
				<div class="right">
					<b>원</b><br><br>
					원<br><br>				
					적립금<br><br>
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
				<button type="submit"><b>구매하기</b></button>
			</form>
		</div>
	</section>
</body>
</html>