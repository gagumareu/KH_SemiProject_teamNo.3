<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


	/*.include_wrapper{
	width:100%;
	top:0px;
	display: flex;
	}  */
	
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
		top: 0px;
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
	
	/** 상단 메뉴바 호버 처리 해야됌 */
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
	

	
	.title{
		position: absolute;
		left: 0px;
	
	}
	

	
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$(function(){
		$(".search_icon").on("click", function(){
			let date = $("");
			$().text(date);
			alert(date);
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
				<img class="search_icon" src="images/icon-search-bold.svg" width="18px"><span class="seach_text">search</span>
			</li>
		</ul>
	</div> <!-- navr end -->
	
	
	
	
	
	

</body>
</html>