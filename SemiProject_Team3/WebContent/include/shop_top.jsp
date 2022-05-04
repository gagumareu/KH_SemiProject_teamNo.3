<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


	
	
	li {
		list-style-type: none;
	}
	
	.seach_text{
		display: none;
	
	}
	
	

	/********** include end **********/


	
	#navr{
		margin: 10px 0px 0px 10px;
		display: flex;
		position: absolute;
		
	}
	
	#navr_ul{
		height: 20px;
		padding-left: 10px;
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
		font-size: 14px;
		font-weight: bold;
		padding: 0 38px 0px 0px;
	}
	
	
	
	/********** 상단 메뉴바 호버 처리 해야됌 *************/

	.dropDown{
		display: flex;
		flex-direction: column;
		display: none;
		background-color: pink;
	}
	

	
	.dropDown:hover{
		display: visible;
		background-color: pink;
	}
	
	.navr_ul > li:hover {
		border: 1px solid red;
		color: blue;
	}
	
	
	
	/********** left side end **********/
	

	

	/************modal**********************/
	
	.search_modal_container {
		position: absolute;
	}
	
	
	.popup {
	
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		whdth: 500px;
		heigth: 500px;
		z-index: 3;
	}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript"></script>

<script type="text/javascript">


	
	$(function (){
		$('#search_icon2').click(function(){
			//window.open('product/search.jsp', '_black', 'height="500"', 'true')
			$(location).attr('href', 'product/search.jsp')
		});
		
		
	});
	

	


</script>
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
			
				<div class="search-container">
					<a href="#" alt="Search image">
						<img id="search_icon2" alt="Search image" data-search_window="date/search_test.jsp" 
						src="images/icon-search-bold.svg" width="18px"><span class="seach_text">search</span>	
					</a>
					<a href="#pop1">	
						<img id="search_icon3" alt="Search image" data-search_window="date/search_test.jsp" 
						src="images/icon-search-bold.svg" width="18px">
					</a>
				</div>
				
			</li>
		</ul>
	</div> <!-- navr end -->
	
	<div class="popup" id="pop1"></div>
	

	
	<!--  <script src="script/modal.js"></script>-->

</body>
</html>	