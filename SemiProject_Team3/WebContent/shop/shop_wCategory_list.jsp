<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

	#w_category_wrapper{
	height:100%;
	display:flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: center;
	
	}
	
	
	.title{
	font-size: 58;
	}

	html, body {
	font-family: arial;
	font-size: 58px;
	height: 100vh;
	margin:0px;

	}
	
	.cList{
	width:27%;
	
	}
	
	.cList{
	
	}
	
	
	
	.cimaages > img{
	width:100%;
	text-decoration:none;;
	
	}
	

</style>


</head>
<body>
	
	<div class="">
	
		<div class="title"><a href="#">A.P.C.</a></div>
		
		<c:set var="list" value="${wCategory }"/>
		
		<div id="w_category_wrapper">
		
			
	
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">			
					<div class="cList">
						<a class="cimaages" href="<%=request.getContextPath() %>/productWList.do?code=${dto.getCategory_code() }">
							<img alt="" src="upload/${dto.getCategory_image() }">
							<span>WOMEN/</span> <br>
							<span>${dto.getCategory_name() }</span>
						</a>
					</div>
				</c:forEach>
			</c:if>
			
			
			
		</div>
		
	</div>

</body>
</html>