<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	
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
	
	
	
</style>
</head>
<body>

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
		
		
	
	</div>
	
	
	
	


</body>
</html>