<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.kor{
		font-family:"나눔고딕";
	}
	.eng{
		font-family: "arial";
	}
	
	#navi-container ul{
		padding:0;
	}
	
	#navi-container li{
		display:inline-block;
		width: auto;
		vertical-align: middle;
	}

	#right_menu{
		display:flex;
		position:absolute;
		top:25px;
		right:10px;
		text-align:right;
		flex-direction: column;
	}

</style>
</head>
<body>
	<div id="header">
	<div id="navi-container">
		<ul>
			<li class="eng"><a href="<%=request.getContextPath() %>/category.do?code=">Women</a></li>
			<li class="eng"><a href="<%=request.getContextPath() %>/category.do?code=">Men</a></li>
			<li class="eng"><a href="<%=request.getContextPath() %>/category.do?code=">Golf</a></li>
		</ul>
	</div>
	
	<div id="right_menu" class="kor">
		<div id="shopping_cart">
		<a href="<%=request.getContextPath() %>/shoppingcart.do">장바구니</a>
		</div>
		<div id="login">
		<a href="<%=request.getContextPath() %>/loginForm.do">내계정/로그인</a>
		</div>
		<div id="newsletter">
			뉴스레터
		</div>
		<div id="customer_center">
			<a href="<%=request.getContextPath() %>/customer_center.do">고객센터</a>
		</div>
		<div id="find_store">
			<a href="<%=request.getContextPath() %>/find_store.do">매장찾기</a>
		</div>
	</div>
	
	</div>
	
</body>
</html>