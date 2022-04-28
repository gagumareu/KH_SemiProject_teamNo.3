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
		margin-top: 100px;
	}

</style>

</head>
<body>

	<jsp:include page="/include/shop_top.jsp"/>

		
	<div class="category_main_wrapper">
	
		<c:set var="list" value="${List }"/>
		<c:if test="${!empty list }">
			
			<div>
				<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[0].getCategory_code() }">
					GOLF/ WOMEN
				</a>
			</div>
			
			<div>
				<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[1].getCategory_code() }">
					GOLF/ MEN
				</a>
			</div>
			
			<div>
				<a href="<%=request.getContextPath() %>/2nd_category.do?code=${list[2].getCategory_code() }">
					GOLF/ GOLF
				</a>
			</div>
		
		
		</c:if> 
		
		<c:if test="${empty list }">
			<h2>품목이 없습니다</h2>
		
		</c:if>
		
		</div> <!-- category_main_wrapper end -->
	
	
	
	<jsp:include page="/include/shop_bottom.jsp"/>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	

</body>
</html>