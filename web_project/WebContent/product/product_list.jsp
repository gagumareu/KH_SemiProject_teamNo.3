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
	
	/**************************/
	
	.product > a {
		text-decoration: none;
		color: black;
	}
	
	
	.description_text {
		text-align: center;
	}
	
	
	
	
	
</style>

	<link rel="stylesheet" href="../css/style.css">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
	crossorigin="anonymous">

</head>
<body>

	
	<c:set var="list" value="${productList }"/>
	<c:set var="ltitleCode" value="${ltitleCode }"/>
	<c:set var="ctitleCode" value="${ctitleCode }"/>
	<c:set var="fullCode" value="${fullCode }"/>
	<c:set var="code1" value="${code1 }"/>
	
	<div class="products_wrapper">
	
		<jsp:include page="/include/shop_top.jsp"/>
		<jsp:include page="/include/shop_top_right.jsp"/>
	
		<div class="apcTitle">
			<a href="<%=request.getContextPath() %>/index.jsp">A.P.C.</a> <a href="<%=request.getContextPath() %>/category.do?code=${ctitleCode.getCategory_code() }">${ctitleCode.getCategory_name() }</a> / <span>${ltitleCode.getCategory_name() }</span>
			
			<!--  
			<c:if test="${code1 != 3 } ">
				<a href="<%=request.getContextPath() %>/category.do?code=${ctitleCode.getCategory_code() }">${ctitleCode.getCategory_name() }</a> / <span>${ltitleCode.getCategory_name() }</span>
			</c:if>
			
			<c:if test="${code1 == 3 }">
				<a href="<%=request.getContextPath() %>/category.do?code=${ctitleCode.getCategory_code() }">${ctitleCode.getCategory_name() }</a> / <span>${ltitleCode.getCategory_name() }</span>
			</c:if>
			-->
			
		</div>
		
			<div class="Products_list">
			
					<c:if test="${!empty list }">
					
						<c:forEach items="${list }" var="dto">	
							<div class="product">
				    			<a href="<%=request.getContextPath() %>/product_content.do?no=${dto.getPno() }&name=${dto.getPname() }&code=${fullCode }">
									<img alt="" src="upload/${dto.getPimage() }" width="100%"> 
									<div class="description">
										<div class="description_text">${dto.getPname() }</div>
										<div class="description_text"><fmt:formatNumber value="${dto.getPrice() }"/>원</div>
									</div>
								</a>
							</div>
						</c:forEach>
						
					</c:if>
					
					<c:if test="${empty list }">
						<h4>검색된 품목이 없습니다:(</h4>
					</c:if>
			
			</div> <!-- Products_list end -->
			
		<jsp:include page="/include/shop_bottom.jsp"/>

	</div> <!-- products_wrapper end -->
	
	

	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>