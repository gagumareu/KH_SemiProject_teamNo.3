<%@page import="com.apc.model.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    	CategoryDAO dao = CategoryDAO.getInstance();
    	List<CategoryDTO> list = dao.getShopCategory();
    	pageContext.setAttribute("List", list);
    	
    	
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


	
	.seach_text{
		display: none;
	
	}
	
	li {
		list-style-type: none;
	}

	/********** include end **********/


	
	#navr{
		margin: 10px 0px 0px 10px;
		/*display: flex;*/
		position: absolute;
		z-index: 99;
		
	}
	
	#navr_ul{
		height: 20px;
		padding-left: 10px;
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
		list-style-type: none;
		
	}
	
	
	
	/********** 상단 메뉴바 호버 처리 해야됌 *************/

	

	.container1 {
		position: absolute;
		display: flex;
		flex-direction: row;
		line-height: 1.7;
		display: none;
		padding: 20px 30px 30px 20px;
		background: #efdcd5;
		
	}
	.categoryName1:hover ~ .container1 {
		display: flex;
	}
	
	.categoryName1:hover {
		background: #efdcd5;
	}
	
	.container1:hover {
		display: flex;
		
	}
	.container1:hover .categoryName1 {
		background: #efdcd5;
	}
	
	
	
	
	.container2 {
		position: absolute;
		display: flex;
		flex-direction: row;
		line-height: 1.7;
		display: none;
		padding: 20px 30px 30px 20px;
		background: #a1887f;
		
	}
	.categoryName2:hover ~ .container2 {
		display: flex;
	}
	
	.categoryName2:hover {
		background: #a1887f;
	}
	
	.container2:hover {
		display: flex;
		
	}
	.container2:hover .categoryName2 {
		background: #a1887f;
	}
	
	
	
	
	
	
	.container3 {
		position: absolute;
		display: flex;
		flex-direction: row;
		line-height: 1.7;
		display: none;
		padding: 20px 30px 30px 20px;
		background: #607d8b;
		
	}
	.categoryName3:hover ~ .container3 {
		display: flex;
	}
	
	.categoryName3:hover {
		background: #607d8b;
	}
	
	.container3:hover {
		display: flex;
		
	}
	.container3:hover .categoryName3 {
		background: #607d8b;
	}
	
	
	
	.container4 {
		position: absolute;
		display: flex;
		flex-direction: row;
		line-height: 1.7;
		display: none;
		padding: 20px 30px 30px 20px;
		background: #ffe0b2;
		
	}
	.categoryName4:hover ~ .container4 {
		display: flex;
	}
	
	.categoryName4:hover {
		background: #ffe0b2;
	}
	
	.container4:hover {
		display: flex;
		
	}
	.container4:hover .categoryName4 {
		background: #ffe0b2;
	}
	
	
	
	
	.container5 {
		position: absolute;
		display: flex;
		flex-direction: row;
		line-height: 1.7;
		display: none;
		padding: 20px 30px 30px 20px;
		background: #bdbdbd;
		
	}
	.categoryName5:hover ~ .container5 {
		display: flex;
	}
	
	.categoryName5:hover {
		background: #bdbdbd;
	}
	
	.container5:hover {
		display: flex;
		
	}
	.container5:hover .categoryName5 {
		background: #bdbdbd;
	}
	
	
	
	.container6 {
		position: absolute;
		display: flex;
		flex-direction: row;
		line-height: 1.7;
		display: none;
		padding: 20px 30px 30px 20px;
		background: #9e9e9e;
		
	}
	.categoryName6:hover ~ .container6 {
		display: flex;
	}
	
	.categoryName6:hover {
		background: #9e9e9e;
	}
	
	.container6:hover {
		display: flex;
		
	}
	.container6:hover .categoryName6 {
		background: #9e9e9e;
	}
	
	
	
	
	
	/********** left side end **********/
	
	a {
		text-decoration: none;
		color: black;
	}
	

	
	
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">


	
	$(function (){
		$('#search_icon2').click(function(){
			$(location).attr('href', '<%=request.getContextPath() %>/product/product_search.jsp');
		});
	});
	
	


</script>
</head>
<body>
	
	<c:set var="topList" value="${List }"/>
	
	<div id="navr">
		<ul id="navr_ul">
			<li class="li_wrap">
				<a href="<%=request.getContextPath() %>/category.do?code=${topList[0].getCategory_code() }" class="categoryName1"><span>Women</span></a>
				<div class="container1">
					<div class="dropDown">
						<ul>
							<li><a href="#"><span>New Arrivals</span></a></li>
							<li><a href="#"><span>Permanent</span></a></li>
							<li><a href="#"><span>Dresses</span></a></li>
							<li><a >Outerwear</a></li>
							<li><a>Jackets</a></li>
							<li><a>Jeans</a></li>
							<li><a>Pants</a></li>
							<li><a>Skirts, Shors</a></li>
							<li><a>T-Shirts, Tops</a></li>
							<li><a>Blouses, Shirts</a></li>
							<li><a>Knitwear</a></li>
							<li><a>Sweatshirts</a></li>
						</ul>
					</div>
					<div class="dropDown">
						<ul>
							<li>Jessica Ogden</li>
							<li>A.P.C. Sneakers</li>
							<li>Denim</li>
							<li>&nbsp;</li>
							<li></li>
							<li>Lookbook</li>
						</ul>
					</div>
				</div>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/category.do?code=${topList[1].getCategory_code() }" class="categoryName2"><span>Men</span></a>
				<div class="container2">
					<div class="dropDown">
						<ul>
							<li><a href="#"><span>New Arrivals</span></a></li>
							<li><a href="#"><span>Coats, Parkas</span></a></li>
							<li><a href="#"><span>Jackets</span></a></li>
							<li><a >Trousers, Jeans</a></li>
							<li><a>Shirts</a></li>
							<li><a>Knitwear</a></li>
							<li><a>Cardigans</a></li>
							<li><a>T-Shirts, Pullovers</a></li>
							<li><a>Bags</a></li>
							<li><a>Shoes</a></li>
							<li><a>Leather Goods</a></li>
							<li><a>Jewelry</a></li>
							<li><a>Small Accessories</a></li>
						</ul>
					</div>
					<div class="dropDown">
						<ul>
							<li>Jessica Ogden</li>
							<li>A.P.C. Sneakers</li>
							<li>Denim</li>
							<li>&nbsp;</li>
							<li></li>
							<li>Lookbook</li>
						</ul>
					</div>
					
				</div>
			</li>
			<li>
				<a href="#" class="categoryName3"><span>Denim</span></a>
				<div class="container3">
					<ul>
						<li><a href="#"><span>Men</span></a></li>
						<li><a href="#"><span>Women</span></a></li>
					</ul>
				</div>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/category.do?code=${topList[2].getCategory_code() }" class="categoryName4"><span>Golf</span></a>
					<div class="container4">
						<ul>
							<li><a href="#"><span>Men</span></a></li>
							<li><a href="#"><span>Women</span></a></li>
							<li><a href="#"><span>Ac</span></a></li>
						</ul>
					</div>
			</li>
			<li>
				<a href="#" class="categoryName5"><span>Objects</span></a>
					<div class="container5">
						<ul>
							<li><a href="#"><span>Quilts</span></a></li>
						</ul>
					</div>
			</li>
			<li>
				<a href="#" class="categoryName6"><span>Surplus</span></a>
				<div class="container6">
					<ul>
						<li><a href="#"><span>Women</span></a></li>
						<li><a href="#"><span>Men</span></a></li>
					</ul>
				</div>
			</li>
			<li>
				<a href="#" class="categoryName6"><span>A.P.C.X Jessica Ogden</span></a>
				<div class="container6">
					<ul>
						<li><a href="#"><span>Women</span></a></li>
						<li><a href="#"><span>Men</span></a></li>
					</ul>
				</div>
			</li>
			<li>
			
				<div class="search-container">
					<a href="#" alt="Search image">
					
						<img id="search_icon2" alt="Search image" 
						src="<%=request.getContextPath() %>/images/icon-search-bold.svg" width="18px">
						
						<span class="seach_text">search</span>	
					</a>
					
				</div>
				
			</li>
		</ul>
	</div> <!-- navr end -->
	
	

	
	<!--  <script src="script/modal.js"></script>-->

</body>
</html>	