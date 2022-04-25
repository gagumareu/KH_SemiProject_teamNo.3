<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	html, body {
	font-family: arial;
	font-size: 58px;
	height: 100%;
	margin:0px;
	
	
	}
	
	#wrapper{
	height: 100%;
	
	}
	
	#right_side{
	width: 100%;
	background-image: url('images/1.jpg');
	background-size: cover;
	background-position: center;
	}
	
	.right {
	width: 100%;
	background-size: cover;
	background-position: center;
	}
	
	#left_side{
	margin-left: 15px;
	}
	
	#main_text{
	margin-left: 15px;
	
	}
	
	#main_text{
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	height: 100%;
	}
	
	#left_side{
	width:100%;
	}
	
	#left_side > ul{
	
	display: flex;
	flex-direction: column;
	}
	
	#left_side > ul >li > a {
	text-decoration: none;
	color: black;
	font-weight:bold;
	}
	
	li {
	list-style-type: none;
	}
	
	#left_side > ul >li > a:hover{
	color: white;
	text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
	
	}

	#"title"{
	color: black;
	font-weight:bold;
	}
	
	#main{
	}
	
	
</style>
</head>
<body>


	<div id="wrapper">
	
		<jsp:include page="include/shop_top.jsp"/>
		
		<div id="main">
		<ul>
			<li>
				<div id="left_side">
					<ul>
						<li id="title">A.P.C</li>
						<li>
						<a class="womenImage" href="<%=request.getContextPath() %>/apc_product_women_list">A.P.C WOMEN
						</a>
						</li>
						<li><a class="manImage" href="">A.P.C MEN</a></li>
						<li><a href="">A.P.C DENIM</a></li>
						<li><a href="">A.P.C GOLF</a></li>
						<li><a href="">A.P.C SURPLUS</a></li>
						<li><a href="">A.P.C X JESSICA <br>OGDEN</a></li>
					
					</ul>
				</div>
			</li>	
			<li>
				<div id="right_side">
				<img class="right" alt="" src="images/man1.jpg" width="100%"> 
				</div>
			</li>	
		</ul>
		</div>
		
		
		
		
	</div> <!-- wrapter end   --> 

</body>
</html>
	
	
	
	