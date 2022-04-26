<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


	<div id="mainPage_wrapper">
		
		<jsp:include page="include/shop_top.jsp"/>
				
		<div id="left_side">
					
			<div id="left_text">
			
				<div id="main_title">A.P.C.</div> 
				
				<div>
					<a class="womenList" href="<%=request.getContextPath() %>/apc_product_women_category.do?no=1">A.P.C. WOMEN</a>
				</div>
				
				<div>	
					<a class="menList" href="">A.P.C. MEN</a>	
				</div>
				
				<div>
					<a href="#">A.P.C. DENIM</a>
				</div>
				
				<div>
					<a href="#">A.P.C. GOLF</a>
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