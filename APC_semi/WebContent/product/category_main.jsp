<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A.P.C. 아페쎄 온라인 스토어 > GOLF</title>
<style type="text/css">

	body{
		font-family: "arial";
	}
	
	
	
	#golf_main_top ul{
	
		list-style: none;
		padding:0px;
	}
	
	.home {
		color:black;
		font-size: 60px;
		font-weight: bold;
		
	}
	.home a {
		text-decoration:none;
		color: black;
	}
	.home a:hover{
		color: white;
		text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
	}
	
	#golf_title{
		font-size:120px;
		font-weight: bold;
	}
	
	#golf_bottom{
		display:flex;
		
	}

	.golf_item{
		width:500px;
		height:500px;
		position: relative;
	}
	
	.golf_itme img{
		width:100%;
		height:100%;
	}
	
	
	
</style>
</head>
<body>
	<c:set var="list" value="${List }"/>
	<c:if test="${empty list }">
		<h3>해당정보가 없습니다.</h3>
		</c:if>
		
	<div id="golf_main" >
		<jsp:include page="../include/shop_top_left.jsp"/>
		<div id="golf_main_top">
		<ul>
		<li class="home">
		<a href="index.jsp">A.P.C.</a>
		</li>
		<li class="golf_title">
			GOLF
		</li>
		</ul> 
		</div> <!-- id="golf-top" end -->
		
	
		<div id="golf_middle">
			<img src="e_image/golf_main.jpg" width="100%" height="100%">
		</div><!-- id="golf_middle" -->
		
		
		
		<c:if test="${!empty list }">
		<div id="golf_bottom">
			<div class="golf_item">
				<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[0].getCategory_code()}">
					<img class="golf_sub" src="e_image/golf_sub1.jpg" alt="golf_women" >
					<div class="overlay">
						<p>GOLF/<br>WOMEN</p>
					</div>
				</a>
			</div>
			<div class="golf_item">
				<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[1].getCategory_code()}">
					<img class="golf_sub" src="e_image/golf_sub2.jpg" alt="golf_men" >
				</a>
			</div>
			<div class="golf_item">
				<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[2].getCategory_code()}">
					<img class="golf_sub" src="e_image/golf_sub3.jpg" alt="golf_acc" >
				</a>
			</div>
		</div>
	</c:if>
	</div>

</body>
</html>