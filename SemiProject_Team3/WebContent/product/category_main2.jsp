<%@page import="java.util.Set"%>
<%@page import="com.apc.model.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

	html, body{
	
		margin: 0px;
		padding: 0px;
	}


	.apcTitle{
	margin-top: 50px;
	font-size: 58px;
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
	
	.col{
	width: 800px;
	}
	
	.container{
	margin: 0px;
	width: 100%;
	}

	.row{
	}
	
	.container{
	}

	

</style>

	<link rel="stylesheet" href="../css/style.css">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">

</head>
<body>
	
	<jsp:include page="/include/shop_top.jsp"/>
	<jsp:include page="/include/shop_top_right.jsp"/>
	
	<c:set var="list" value="${List }"/>



	<div id="category_wrapper">
	
		<div class="apcTitle">
			<a href="<%=request.getContextPath() %>/index.jsp">A.P.C.</a>
		</div>
			<c:if test="${!empty list }">
				<div class="container">
					<div class="row row-cols-3">	
						<c:forEach items="${list }" var="dto">	
				   			<div class="col">
				    			<a href="<%=request.getContextPath() %>/product_list.do?code=${dto.getCategory_code() } ">
									<img alt="" src="upload/${dto.getCategory_image() }">
								</a>
									<br>
									${dto.getCategory_name() }
				  	 		 </div>
						</c:forEach>
					</div> <!-- row row-cols-3 end -->
				</div> <!-- container end -->
			</c:if>		
						
			<c:if test="${empty list }">
				<h4>검색된 품목이 없습니다:(</h4>
			</c:if>
		
		
	</div> <!-- category_wrapper end -->
		
	

	<jsp:include page="/include/shop_bottom.jsp"/>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>