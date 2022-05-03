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
	
	
	/********************************/
	
	
	.category_main_wrapper{
		display: flex;
		flex-direction: column;
		width: 100%;
		flex: 1;
	}
	
	
	.main_image{
		margin-bottom: 5px;
	}
		
	.main_image > img{
		width: 100%;
	}
	
	
	
	/****** category ***********/
	
	.cetegory_wrpper {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		margin-bottom: 10px;
		
	}
	
	
	.category_image > a > img{
		width: 99%;
		
	}
	
	.cImage_center{
	}
	

	
	
</style>

</head>
<body>

	<jsp:include page="/include/shop_top.jsp"/>
	<jsp:include page="/include/shop_top_right.jsp"/>

			
	<div class="category_main_wrapper" >
	
		<div class="apcTitle">
			<a href="<%=request.getContextPath() %>/index.jsp">A.P.C.</a>
		</div>
		
	
		<div class="main_image">
			<img class="main_image" src="images/golf_main.jpg">
		</div>
		
		<div class="cetegory_wrpper">	
			<c:set var="list" value="${List }"/>
				<c:if test="${!empty list }">
				
					<div class="category_image left">
						<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[0].getCategory_code() }">
							<img alt="" src="images/golf_left.jpg">
						</a>
					</div>
					
					<div class="category_image center">
						<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[1].getCategory_code() }">
							<img class="cImage_center" alt="" src="images/golf_center.jpg">
						</a>
					</div>
					
					<div class="category_image right">
						<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[2].getCategory_code() }">					
							<img class="cImage_right" alt="" src="images/golf_right.jpg">
						</a>
					</div>
					
				</c:if> 
			
				<c:if test="${empty list }">
					<h2>품목이 없습니다</h2>
				
				</c:if>
		</div> <!-- cetegory_wrpper end -->
			
			
			
			
		
		
	<jsp:include page="/include/shop_bottom.jsp"/> 
		
		
	</div> <!-- category_main_wrapper end -->
	
		
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	

</body>
</html>