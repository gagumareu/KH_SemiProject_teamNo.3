<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	
	/**************************/
	
	
	.products_wrapper{
		display: flex;
		flex-direction: column;
		min-height: 100vh;	
	}
	
	.container{
		flex: 1;
		
	}
	
	.Products_list{
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr;
		align-itmes: center;
	}
	
	.product > a {
		text-decoration: none;
		color: black;
	}
	
	
	.description {
		display: none;
	}
	
	.product:hover {
		.description {
			display: block;
		}
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

	<c:set var="list" value="${productList }"/>
	
	<br>
	
	<div class="products_wrapper">
	
		<div class="apcTitle">
			<a href="<%=request.getContextPath() %>/index.jsp">A.P.C.</a> 
		</div>
		
			<div class="Products_list">
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="dto">	
							<div class="product">
				    			<a href="<%=request.getContextPath() %>/product_content.do?no=${dto.getPno() }&name=${dto.getPname() }">
									<img alt="" src="upload/${dto.getPimage() }" width="100%"> 
									<div class="description">${dto.getPname() }</div>
									<div class="description"><fmt:formatNumber value="${dto.getPrice() }"/>원</div>
								</a>
							</div>
						</c:forEach>
					</c:if>
					
					<c:if test="${empty list }">
						<h4>검색된 품목이 없습니다:(</h4>
					</c:if>
			
			</div> <!-- Products_list end -->

	</div> <!-- products_wrapper end -->
	
	
	
	
	
	
	<jsp:include page="/include/shop_bottom.jsp"/>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>