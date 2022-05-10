<%@page import="com.apc.model.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="com.apc.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
  	<%
  	CategoryDAO dao = CategoryDAO.getInstance();
  	
  	
  	
  	%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

	html, body{
		margin:0px;
		padding: 0px;
	}
	


	/* ****************공통으로 링크걸  css*******/

	.apcTitle{
		margin-top: 50px;
		font-size: 63px;
		margin-left: 15px;
		font-weight: bold;
		width: 100%;
	}
	
	.apcTitle > a{
		color: black;
		text-decoration: none;
	}
	
	.apcTitle > a:hover{
		color: white;
		text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
	}

	.col > a > img{
		width:100%;
	}

	/* ****************공통으로 링크걸  css*******/
	
	
	#category_wrapper {
		display: flex;
		flex-direction: column;
		min-heigth: 100vh;
	}
	
	.contents{
		flex: 1;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
	}
	
	.content {
		text-align: center;
	}
	
	.content a {
		text-decoration: none;
		line-style-type: none;
		color: black;
		
	}
	
	.category_name {
		font-size: 30px;
	}
</style>

	<link rel="stylesheet" href="../css/style.css">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">

</head>
<body>
	

	<div id="category_wrapper">
	
		<jsp:include page="/include/shop_top.jsp"/>
		<jsp:include page="/include/shop_top_right.jsp"/>
		
		<c:set var="list" value="${List }"/>
		<c:set var="ctitleCode" value="${ctitleCode }"/>
	
		<div class="apcTitle">
			<a href="<%=request.getContextPath() %>/index.jsp">A.P.C.</a> <span>${ctitleCode.getCategory_name() }</span>
		</div>
		
		<div class="contents">
				
			<c:if test="${!empty list }">
		
				<c:forEach items="${list }" var="dto">	
		   			<div class="content">
		    			<a href="<%=request.getContextPath() %>/product_list.do?code=${dto.getCategory_code() } ">

							<img class="content_image" alt="" src="image_category/${dto.getCategory_image() }" width="100%" >
						
							<div class="category_name">${dto.getCategory_name() }</div>
						</a>
		  	 		</div>
				</c:forEach>
		
			</c:if>		
					
			<c:if test="${empty list }">
				<h4>검색된 품목이 없습니다:(</h4>
			</c:if>
		
		</div> <!-- contents end -->
			
		
	<jsp:include page="/include/shop_bottom.jsp"/>
		
	</div> <!-- category_wrapper end -->
		
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>