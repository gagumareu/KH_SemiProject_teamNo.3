<%@page import="com.apc.model.CartDTO"%>
<%@page import="com.apc.model.CartDAO"%>
<%@page import="com.apc.model.CategoryDTO"%>
<%@page import="com.apc.model.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.apc.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	//PRODUCT페이지 상단 TITLE 3번째 카테고리 이름 뽑아내기 
	String code = request.getParameter("code");
	
	CategoryDAO dao = CategoryDAO.getInstance();
	CategoryDTO dto = dao.getCategoryCont(code);
	
	String first = (String)session.getAttribute("first");
	String second = (String)session.getAttribute("second");
	String third = null;//3번째 카테고리 이름 
	
	System.out.println(code);
	System.out.println("카테고리 이름"+dto.getCategory_name());
	System.out.println("first"+first);
	System.out.println("second:"+second);
	
	if(second == null){//second 카테고리이름이없으면, ex)WOMEN, MEN 
		if(first.equals("WOMEN")){
			third = dto.getCategory_name().substring(6);
		}else if(first.equals("MEN")){
			third = dto.getCategory_name().substring(4);
		}
	}else{//second 카테고리 이름이 있으면  ex) GOLF 

		if(second.equals("WOMEN")){
			third = dto.getCategory_name().substring(6);
		}else if(second.equals("MEN")){
			third = dto.getCategory_name().substring(4);
		}//ACC는 third 없음 바로 제품리스트 나옴
	}

	session = request.getSession();
	session.setAttribute("third", third);
	System.out.println("thrid:"+third);
	
	
		

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A.P.C. 아페쎄 코리아 공식 온라인 스토어  GOLF > 제품 목록</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_products.css">
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
<script type="text/javascript">



</script>
<style type="text/css">

	.category_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	.category_flex_wrapper {
		flex: 1;
	}
	
	.category_flex {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
	
	}
	
	#img_hover {
		display:none;
	}
	
	.page_title > ul {
		margin: 0;
	}
	
</style>
</head>
<body>
	<jsp:include page="/include/shop_top.jsp"/>
	<jsp:include page="/include/shop_top_right.jsp"/>
	
	<div class="category_wrapper" >
		
		<div class="page_title">
			<ul>
				<li class="page_title1">
					<a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a>
				</li>
				<c:if test="${first == 'WOMEN' }"> 
					<li class="page_title2">
						<a href="<%=request.getContextPath()%>/category.do?code=10000000">${first}</a>
					</li>
				</c:if>
				<c:if test="${first == 'MEN' }"> 
					<li class="page_title2">
						<a href="<%=request.getContextPath()%>/category.do?code=20000000">${first}</a>
					</li>
				</c:if>
				<c:if test="${first == 'GOLF' }"> 
					<li class="page_title2">
						<a href="<%=request.getContextPath()%>/category.do?code=30000000">${first}</a>
					</li>
						<c:if test="${second == 'ACC' }">
							<li class="page_title3">
								/ ${second} 
							</li>
						</c:if>
					<c:if test="${second != 'ACC' }">
						<li class="page_title3">
							/ <a href="<%=request.getContextPath()%>/2nd_category.do?code=${upperCode}">${second}</a>
						</li>
					</c:if>
				</c:if>
				<li class="page_title4">
					/ ${third }
				</li>
			</ul>
		</div><!-- class="page_title" -->
		
		
		<c:set var="list" value="${productList }"/>
		<c:if test="${empty list }">
			<h3>정보가 없습니다.</h3>
		</c:if>
		<c:if test="${!empty list }">
		<div class="category_flex_wrapper">
		
			<div class="category_flex">
		<%
		//DB에 저장된 이미지들을 JSP페이지에 보여주기 
		List<ProductDTO> list = (List<ProductDTO>)request.getAttribute("productList");
		
		
		StringTokenizer st = null;
		
		for(int i=0; i<list.size(); i++){
			 ProductDTO product = list.get(i);
			 
			 String fileName = product.getPimage();
			 
			 StringTokenizer token = new StringTokenizer(fileName,",");
			 String[] arrImg =  new String[token.countTokens()];
			 
			 for(int j=0; j<arrImg.length;j++){
				arrImg[j] = token.nextToken();
			 }
		
		%>	
			
			
				<div class="img_box">
					<a href="<%=request.getContextPath() %>/product_detail.do?num=<%=product.getPno() %>
									&color=<%=product.getPcolor()%>&size=<%=product.getPsize()%> ">
						<img class="img<%=product.getPno() %>" alt="arrImg[0]" src="<%=request.getContextPath() %>/upload/<%= arrImg[0] %> ">
						
						
					</a>						
				</div>	<!-- class="img_box" --> 					
						
		<%}%>
			</div><!-- class="category_flex" -->
			</div> <!-- class="category_flex_warpper" -->
		</c:if>
	
	</div>
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>