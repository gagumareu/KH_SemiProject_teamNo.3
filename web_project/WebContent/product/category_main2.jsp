<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A.P.C. 아페쎄 코리아 온라인 스토어</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_products.css">
<style type="text/css">

	html, body{
	
		margin: 0px;
		padding: 0px;
	}

	.category_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	
	.category_main2_grid {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		justify-items: center;
	
	}
	
	.category_flex_wrapper {
		width: 100%;
	
	}
	
	.flex_item {
		padding: 0px;
		margin: 0px;
	}
	
	.img_box > a > img {
		width: 100%;
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
	
	<div class="category_wrapper" >
	
	<c:set var="list" value="${List }"/>
	
		<div class="page_title">
			<ul>
				<li class="page_title1">
					<a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a>
				</li>
			<!--   second이 null (WOMEN, MEN일 경우)   -->
			<c:if test="${empty second }"> 
				<li class="page_title2">
					${first}
				</li>
			</c:if>
			 <!--   second이 null이 아니면 (GOLF일 경우)    -->
			<c:if test="${!empty second }">
				<li class="page_title2">
					<a href="<%=request.getContextPath()%>/category.do?code=30000000">${first}</a>
				</li>
				<li class="page_title3">
					/ ${second}
				</li>
			</c:if>
			</ul>
		</div><!-- class="page_title" -->

		
			<c:if test="${!empty list }">
			
			<div class="category_flex_wrapper">
			
						
					<section class="category_main2_grid">
							<c:forEach items="${list }" var="dto">	
				
							<div class="flex_item">
								<div class="img_box">
									<a href="<%=request.getContextPath() %>/product_list.do?code=${dto.getCategory_code() } ">
										<img alt="" src="image_category/${dto.getCategory_image() }">
										<div class="img_overlay">
											<c:if test="${dto.getCategory_name().substring(0,1) == 'W' }">
												<span> 
													${dto.getCategory_name().substring(0,6) }<br>
													${dto.getCategory_name().substring(6) }
												</span>
											</c:if>
										
											 <c:if test="${dto.getCategory_name().substring(0,1) == 'M'}">
												<span> 
													${dto.getCategory_name().substring(0,4) }<br>
													${dto.getCategory_name().substring(4) }
												</span>
											</c:if>
										</div>
									</a>						
								</div>	<!-- class="img_box" -->					
							</div><!-- class="flex_item" -->			
					
							</c:forEach>
					
					</section> <!-- category_main2_grid  -->
						
					

					
				</div> <!-- class="category_flex_warpper" -->
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