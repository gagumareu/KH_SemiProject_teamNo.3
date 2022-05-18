<%@page import="com.apc.model.CartDTO"%>
<%@page import="com.apc.model.CartDAO"%>
<%@page import="com.apc.model.CategoryDTO"%>
<%@page import="com.apc.model.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <%
  	CategoryDAO dao = CategoryDAO.getInstance();
  	
  	List<CategoryDTO> list = dao.getShopCategory();
  	
  	pageContext.setAttribute("List", list);
  	
  	
  	// 쇼핑몰 우측 상단 장바구니 구현에 필요한 로직
	CartDAO semiDao = CartDAO.getInstance();
  	HttpSession semiSession = request.getSession();
  	String id = (String)semiSession.getAttribute("member_id");
	List<CartDTO> semiList = semiDao.getSemiCartList(id);
  	request.setAttribute("semiCartList", semiList);

  	
  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	
	#left_text {
		font-size: 60px;
		font-weight: bold;
	}
	
	
	
</style>

 <link rel="stylesheet" href="css/style.css">

 <link rel="stylesheet" href="css/index.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script type="text/javascript">
 


	
	$(document).ready(function(){  
  		$(".wCategory").hover(function(){  
  			 $('.right_image-1').attr('src', 'images/women.jpg'); 
 
  		});  
  		$(".mCategory").hover(function(){  
 			 $('.right_image-1').attr('src', 'images/1mN4TpY4ng.jpg'); 

 		}); 
  		$(".dCategory").hover(function(){  
 			 $('.right_image-1').attr('src', 'images/denim.jpg'); 

 		});  
  		$(".sCategory").hover(function(){  
 			 $('.right_image-1').attr('src', 'images/SURPLUS.jpg'); 

 		}); 
  		
  		$(".jCategory").hover(function(){  
 			 $('.right_image-1').attr('src', 'images/X JESSICA OGDEN.jpg'); 

 		}); 
  		
  		$(".gCategory").hover(function(){  
 			 $('.right_image-1').attr('src', 'images/GOLF2.jpg'); 

 		}); 
	});  
 	
 	

 
 </script>
</head>
<body>

	<c:set var="list" value="${List }"/>
	
	<jsp:include page="include/shop_top.jsp"/>
	<jsp:include page="include/shop_top_right.jsp"/>
		
	<div id="mainPage_wrapper">
				
			<div id="left_side">
			
						
				<div id="left_text">
					
					
					
					<div id="main_title">
						A.P.C.
					</div> 
					
					<div>
						<a class="wCategory" href="<%=request.getContextPath() %>/category.do?code=${list[0].getCategory_code() }">A.P.C. WOMEN</a>
					</div>
					
					<div>	
						<a class="mCategory" href="<%=request.getContextPath() %>/category.do?code=${list[1].getCategory_code() }">A.P.C. MEN</a>	
					</div>
					
					<div>
						<a href="#" class="dCategory">A.P.C. DENIM</a>
					</div>
					
					<div>
						<a class="gCategory" href="<%=request.getContextPath() %>/category.do?code=${list[2].getCategory_code() }">A.P.C. GOLF</a>
					</div>
					
					<div>
						<a href="#" class="sCategory">A.P.C. SURPLUS</a>
					</div>
					
					<div>
						<a href="#" class="jCategory">A.P.C. X JESSICA <br>OGDEN</a>
					</div>
				</div>
			</div>

			<div id="right_side">
			
				<img class="right_image-1" alt="" src="images/1mN4TpY4ng.jpg">
				
				
			</div> <!-- right_side end -->
			
	

	
		
	</div> <!-- mainPage_wrapper end   --> 
	
	<jsp:include page="include/shop_bottom.jsp"/>
	
	
	

</body>
</html>