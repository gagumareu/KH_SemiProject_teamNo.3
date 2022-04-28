<%@page import="com.apc.model.CategoryDTO"%>
<%@page import="com.apc.model.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
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
	body{
	font-size: 58px;
	}
</style>

 <link rel="stylesheet" href="css/style.css">

 <link rel="stylesheet" href="css/main.css">
 
</head>
<body>

	<c:set var="list" value="${List }"></c:set>
	<div id="mainPage_wrapper">
		
		<jsp:include page="include/shop_top.jsp"/>
				
		<div id="left_side">
					
			<div id="left_text">
			
				<div id="main_title">A.P.C.</div> 
				
				<div>
					<a class="womenList" href="<%=request.getContextPath() %>/category.do?code=${list[0].getCategory_code() }">A.P.C. WOMEN</a>
				</div>
				
				<div>	
					<a class="menList" href="<%=request.getContextPath() %>/category.do?code=${list[1].getCategory_code() }">A.P.C. MEN</a>	
				</div>
				
				<div>
					<a href="#">A.P.C. DENIM</a>
				</div>
				
				<div>
					<a href="<%=request.getContextPath() %>/category.do?code=${list[2].getCategory_code() }">A.P.C. GOLF</a>
				</div>
				
				<div>
					<a href="#">A.P.C. SURPLUS</a>
				</div>
				
				<div>
					<a href="#">A.P.C. X JESSICA <br>OGDEN</a>
				</div>
			</div>
		</div>
		

		<div id="right_side">
		
			
		</div> <!-- right_side end -->
		
	
		
	</div> <!-- mainPage_wrapper end   --> 
	
	 <jsp:include page="include/shop_bottom.jsp"/>
	

</body>
</html>