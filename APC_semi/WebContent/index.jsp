<%@page import="com.apc.model.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	CategoryDAO dao = CategoryDAO.getInstance();
	
	List<CategoryDTO> list = dao.getCategory();
	
	pageContext.setAttribute("List", list);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	html, body {
	font-family: arial;
	font-size: 58px;
	height: 100vh;
	margin:0px;
	
	
	}
	
	#wrapper{
	height: 100%;
	display: grid;
	grid-template-columns: 50% 50%;
	
	}
	
	#right_side{
	width: 100%;
	background-image: url('images/1.jpg');
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
	
	
	#main_text a {
	text-decoration: none;
	color: black;
	font-weight:bold;
	}
	
	li {
	list-style-type: none;
	}
	
	#main_text a:hover{
	color: white;
	text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
	
	}

	#main{
	color: black;
	font-weight:bold;
	}
	
	
	
</style>
</head>
<body>


	<div id="wrapper">
		
		<div id="left_side">
			<jsp:include page="include/shop_top_left.jsp"/>
			
			<c:set var="list" value="${List }" />
			<c:if test="${empty list }">
			<h3>정보가 없습니다.</h3>
			</c:if> 
			
			<c:if test="${!empty list }"> 
			<div id="main_text">
				<div id="main">
					A.P.C
				</div>
				
				<div>
					<a class="womenImage" href="<%=request.getContextPath() %>/category.do?code=${list[0].getCategory_code()}">A.P.C WOMEN</a>
				</div>
				
				<div>	
					<a class="manImage" href="<%=request.getContextPath() %>/category.do?code=${list[1].getCategory_code()}">A.P.C MEN</a>	
				</div>
				
				<div>
					<a href="#">A.P.C DENIM</a>
				</div>
				
				<div>
					<a href="<%=request.getContextPath()%>/category.do?code=${list[2].getCategory_code()}">A.P.C GOLF</a>
				</div>
				
				<div>
					<a href="#">A.P.C SURPLUS</a>
				</div>
				
				<div>
					<a href="#">A.P.C X JESSICA <br>OGDEN</a>
				</div>
				
				
				
				
			</div>
		</c:if> 

		</div>
		

		<div id="right_side">
		
			<jsp:include page="include/shop_top_right.jsp"/>
			
		
			<!-- <img class="right" alt="" src="images/man1.jpg" width="100%">  -->
		</div>
		
	
		
	</div> <!-- wrapter end   --> 
	
		<jsp:include page="include/shop_bottom.jsp"/>
	

</body>
</html>