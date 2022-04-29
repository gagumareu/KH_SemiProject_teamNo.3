<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="../css/style.css">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">


<style type="text/css">

	
	.category_main_wrapper{
	display: grid;
		grid: 1;
		
		width: 100%;
	}
	

	a{
	padding: 10px;
	}
	
	.golf_image_main{
	margin: 10px 0px;
	}
	
	.main_image {
		width: 100%;
	}
	
	
	.gofl_category a {
	width: 80%;
	}
	
	.golf_category_div {
	width: 100%;
	margin: 0px 3px;
	}
	
	
	
	.golf_category_div > a > img{
	width: 100%;
	}
	
	.gofl_category{
	width: 100%;
	height: 100px;
	display: flex;
	}
	
	.contents{
		width: 100%
	}
	
</style>

</head>
<body>

	<jsp:include page="/include/shop_top.jsp"/>
	<jsp:include page="/include/shop_top_right.jsp"/>

			
	<div class="category_main_wrapper" >
		
		
		<div class="golf_image_main">
			<img class="main_image" src="images/golf_main.jpg">
		</div>
	
		<div class="gofl_category">
		
			<c:set var="list" value="${List }"/>
				<c:if test="${!empty list }">
				
					<div class="golf_category_div left">
						<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[0].getCategory_code() }">
							<img alt="" src="images/golf_left.jpg">
						</a>
					</div>
					
					<div class="golf_category_div center">
						<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[1].getCategory_code() }">
							<img alt="" src="images/golf_center.jpg">
						</a>
					</div>
					
					<div class="golf_category_div right">
						<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[2].getCategory_code() }">					
							<img alt="" src="images/golf_right.jpg">
						</a>
					</div>
					
				</c:if> 
			
				<c:if test="${empty list }">
					<h2>품목이 없습니다</h2>
				
				</c:if>
			
			
			
			</div>  <!-- golf category end -->
			
		
		
	<!--<jsp:include page="/include/shop_bottom.jsp"/> -->
		
		
	</div> <!-- category_main_wrapper end -->
	
		
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	

</body>
</html>