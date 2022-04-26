<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


	.include_wrapper{
	width:100%;
	position: absolute;
	top:0px;
	
	display: flex;
	
	}


	/********** include end **********/


	
	#navr{
	margin: 10px 0px 0px 10px;
	width: 200%;
	display: flex;
	}
	
	#navr_ul{
	height: 20px;
	
	}
	
	
	ul {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	/*justify-content: space-evenly;*/
	padding-left: 0px;
	margin: 0px;
	
	
	}
	
	
	#navr_ul > li{
	font-size: 13px;
	font-weight: bold;
	padding: 0 38px 0px 0px;
	}
	
	
	span {
	opacity: 0;

	}
	
	span:hover{
	opacity: 1;
	
	}
	
	
	
	.navr_ul >:hover{
	cursor: ponter;
	color:pink;
	}
	
	.dropDown{
	display: flex;
	flex-direction: column;
	
	}
	
	.dropDown li{
	display: none;
	}
	
	.dropDown li:hover{
	display: block;
	background-color: pink;
	}
	
	.navr_ul > li:hover > .dropDown{
	display: block
	}
	
	.navr_ul li:hover .dropDown{
	display:block;
	
	}
	
	/********** left side end **********/
	
	#right_menu{
	margin-top: 10px;
	width: 200px;
	
	}
	
	#right_menu>ul{
	display:flex;
	flex-direction:column;
	font-size: 13px;
	}
	
	
	#right_menu ul> li > a{
	text-decoration: none;
	color: black;
	}
	
	#right_menu >ul > li > a:hover{
	text-decoration: underline;
	}
	
	.hello:hover{
	text-decoration: underline;
	}
	
	/********** right side end **********/
	
</style>
</head>
<body>
	<div class="include_wrapper"> 
	
	<div id="navr">
		<ul id="navr_ul">
			<li>Women
				<ul class="dropDown">
					<li>New Arrivals</li>
					<li>Permanent</li>
					<li>Dresses</li>
					<li>Outerwear</li>
					<li>Jackets</li>
					<li>Jeans</li>
					<li>Pants</li>
					<li>Skirts, Shors</li>
					<li>T-Shirts, Tops</li>
					<li>Blouses, Shirts</li>
					<li>Knitwear</li>
					<li>Sweatshirts</li>
				</ul>
			</li>
			<li>Men</li>
			<li>Denim</li>
			<li>Golf</li>
			<li>Objects</li>
			<li>Surplus</li>
			<li>A.P.C.X Jessica Ogden</li>
			<li>
				<a id="search" href="#"><img src="images/search.png" width="20px" ><span>search</span></a>
			</li>
		</ul>
	</div> <!-- navr end -->
	
	
	
	
	
	
	<div id="right_menu">
		<ul>
			<li><a href="#"><img src="images/bag1.png" width="20px">장바구니</a></li>
			<li><a href="#">내계정/로그인</a></li>
			<li>&nbsp;</li>
			<li><a href="#">South Korea</a></li>
			<li><a href="#">뉴스레터</a></li>
			<li><a href="#">고객센터</a></li>
			<li><a href="#">매장찾기</a></li>
			<li>&nbsp;</li>
			<li><a href="#">아이디룩몰</a></li>
		
		</ul>
	</div>	<!--  right_menu end  -->
	
	
	</div> <!-- include_wrapper end -->

</body>
</html>