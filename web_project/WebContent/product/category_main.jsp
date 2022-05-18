<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>A.P.C. 아페쎄 코리아 온라인 스토어 </title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_products.css">

<style type="text/css">

	body{
		font-family: "arial";
	}
	
	#golf_main_container{
		margin-bottom: 30px;
		flex: 1;
	}
	
	.page_title {
		padding	:0px;
	}
	.page_title ul{
		display:block;
	}
	
	.page_title li{
		display:block;
		
	}

	.page_title1{
		color:black;
		font-size: 60px;
		font-weight: bold;
	}
	
	.page_title1 a{
		text-decoration:none;
		color: black;
	}
	
	.page_title1 a:hover{
		color: white;
		text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
	}
	
	.page_title2{
		color:black;
		font-size:110px;
		margin-top:-40px;
		margin-bottom:-30px;
		margin-left:-10px;
	}
	
	
	#golf_bottom{
		display:flex;
		justify-content: space-between;
		
	}
	.golf_item{
		width:33%;
		height:33%;
		margin-top:10px;
		margin-right:3px;
		position: relative;
		
	}
	
	.golf_itme img{
		width:100%;
		height:100%;
	}
	
	.img_overlay{
		position:absolute;
		top:30%;
		left:28%;
		width:100%;
		height:100%;
		
		font-family: "Arial Black";
		color:white;
		letter-spacing: 3px;	
	}
	.img_overlay > p {
		font-size:2.2em;
		
	}
	.golf_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	
	.golf_bottom {
		display: flex;
		flex-direction: row;
		justify-content: space-betwwen;
	}
	
	.golf_item {
		width: 100%;
		
	}
	
	
	.golf_sub {
		width: 150%;
	}
	
	.golf_item > a > img {
	
		width: 100%;
	}
	
	#golf_item_center {
		margin: 10px 10px 0px 10px;
	}
	
	
	
</style>
</head>
<body>

	<jsp:include page="/include/shop_top.jsp"/>
	<jsp:include page="/include/shop_top_right.jsp"/>
	
	<c:set var="list" value="${List }"/>
	<c:if test="${empty list }">
		<h3>해당정보가 없습니다.</h3>
	</c:if>
		
		
	<div class="golf_wrapper">
	
		<div id="golf_main_container" > <!-- GOFL에만 있는 페이지 -->
		
			<div class="page_title">
				<ul>
					<li class="page_title1">
						<a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a>
					</li>
					<li class="page_title2">
						${first}
					</li>
				</ul>
			</div><!-- class="page_title" -->
		
			
	<%-- 		<div class="page_title">
			<ul>
			<li class="page_title1">
			<a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a>
			</li>
			<li class="page_title2">
				${first}
			</li>
			</ul>
			</div><!-- class="page_title" --> --%>
			
		
			<div id="golf_middle">
				<img src="images/golf_main.jpg" width="100%" height="100%">
			</div><!-- id="golf_middle" -->
			
			
			 <c:if test="${!empty list }">
				<div id="golf_bottom">
					<div class="golf_item">	
							<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[0].getCategory_code()}">
								<img class="golf_sub" src="images/golf_sub1.jpg" alt="golf_women"  height="100%">
								<div class="img_overlay">
									<p>GOLF/<br>WOMEN</p>
								</div>
							</a>
					</div>
					
				<div class="golf_item" id="golf_item_center">
						<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[1].getCategory_code()}">
							<img class="golf_sub" src="images/golf_sub2.jpg" alt="golf_men" height="100%"> 
							<div class="img_overlay">
								<p>GOLF/<br>MEN</p>
							</div>
						</a>
				</div>
					
				<div class="golf_item">
						<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[2].getCategory_code()}">
							<img class="golf_sub" src="images/golf_sub3.jpg" alt="golf_acc" height="100%"> 
							<div class="img_overlay">
								<p>GOLF/<br>ACC</p>
							</div>
						</a>
				</div>
				</div> <!-- golf_bottom  -->
			</c:if>
		
		</div> <!-- id="golf_main_container" -->
		
	</div> <!-- golf_wrapper -->
	
	
	<jsp:include page="/include/shop_bottom.jsp"/>
		
		
		
</body>
</html>