<%@page import="com.apc.model.ProductDAO"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.apc.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	ProductDTO dto = (ProductDTO)request.getAttribute("cont");

	ProductDAO dao = ProductDAO.getInstance();
	String[] arrImg = dao.getPorudctImg(dto);
	
	pageContext.setAttribute("arrImg", arrImg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_products.css?after">
<script type="text/javascript">


	function go_cart(){
		
		let pname = document.getElementById("p_name").value;
		let pcolor = document.getElementById("p_color").value;
		let psize = document.getElementById("p_size").value;
		
		
		//form(name=frm)의 action경로 지정
		document.frm.action = "<%=request.getContextPath()%>/go_cart.do?name="+pname+"&color="+pcolor+"&size="+psize ;
	
		//form(frm)에 submit 메서드 호출해 데이터 전달
		document.frm.submit();
		
	}
	
	function go_pay(){
		
		//비회원구매, 로그인하기 창...어떻게............?
		
		let pname = document.getElementById("p_name").value;
		let pcolor = document.getElementById("p_color").value;
		let psize = document.getElementById("p_size").value;
		
		
		//form(name=frm)의 action경로 지정
		document.frm.action = "<%=request.getContextPath()%>/go_pay.do?name="+pname+"&color="+pcolor+"&size="+psize ;
	
		//form(frm)에 submit 메서드 호출해 데이터 전달
		document.frm.submit();
		
	}


</script>
</head>
<body>

	<jsp:include page="/include/shop_top.jsp"/>
	<jsp:include page="/include/shop_top_right.jsp"/>
	
	<div class="category_wrapper">
	
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
			/  <a href="<%=request.getContextPath()%>/product_list.do?code=${categoryCode}"> ${third }</a>
		</li>
		</ul>
		</div><!-- class="page_title" -->
		
		<c:set var="dto" value="${cont }"/>
		<div class="product_section">
		<div class="product_section_aside">
			<hr width="90%">
		<form name="frm" method="post">
		<input type="hidden" id="p_name" value="${dto.getPname() }">
		<input type="hidden" id="p_color" value="${dto.getPcolor()}">
		
			<table class="product_content">
				<tr>
					<th colspan="2">
					<span id="product_name">${dto.getPname() }</span>
					</th>
				</tr>
				<tr>
					<td colspan="2">
					<span id="product_cont">${dto.getPcontents() }</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<span id="product_price"><fmt:formatNumber value="${dto.getPrice() }"/>원 </span></span>
					</td>
				</tr>
				<tr>
					<td >색상</td>
					<td><span id="product_color" >${dto.getPcolor() }</span></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<ul class="colors">
							<c:if test="${empty colors }">
							칼라정보 없음
							</c:if>
							<c:if test="${! empty colors }">
							<%
								String [] colors = (String[])request.getAttribute("colors");		
								
								int num =0; 
								
								for(int i =0; i<colors.length ; i++){
							%>		
								<li>
								<a href="<%=request.getContextPath()%>/product_check.do?name=${dto.getPname() }&color=<%=colors[i]%>">
								<span><img src="<%=request.getContextPath() %>/e_image/<%=colors[i] %>.jpg"> </span>
								</a>
								</li>
							<% 		
								}
								
							%>
								
								
							</c:if>
						</ul>
					</td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td>
						<select id="p_size" name="p_size">
							<c:if test="${empty sizes }">
							<option value="">:::없음:::</option>
							</c:if>
							<c:if test="${!empty sizes }">
							<c:forEach items="${sizes }" var="s">
								<option value="${s }">${s }</option>							
							</c:forEach>
							</c:if>
						
						</select>
					</td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="number" name="p_qty" value="1"  min="1" max="${dto.getPqty() }"></td>
				</tr>
				<tr>
					<td>적립금</td>
					<td>
					
					<span id="mileage"><fmt:formatNumber value="${dto.getMileage() }"/>원 </span></td>
				</tr>
				<tr>
					<td colspan="2" class="extrainfo">SIZE GUIDE  </td>
					
				</tr>
				<tr>
					<td colspan="2" class="extrainfo" valign="top">무이자 할부 안내</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td colspan="2">
					<input id="go_pay_btn"class="btn btn-dark" type="button" value="바로구매" onclick="go_pay()"> &nbsp;
					<input id="go_cart_btn" class="btn btn-light" type="button" value="장바구니" onclick="go_cart()">
					</td>
				</tr>
			</table>
		</form>
		</div><!-- class="product_detail_aside" -->
		<div class="product_section_main">
			<div class="detail_image">
				<c:forEach items="${arrImg }" var="img">
				<img src="<%=request.getContextPath() %>/upload/${img}" width="50%" height="65%">
				</c:forEach>
			</div>
			<hr width="90%" align="center">
			<div class="product_review">
				<div class="review_detail">
				<c:set var="rlist" value="${rList }"/>
				<c:set var="rSum" value="${rlist.size()}"/>
				
				<div class="review_top">
				<span>REVIEW <B>(${rSum })</B></span>
				</div>
		
				</div><!--class="review_detail"  -->
			</div><!--class="product_review"  -->
		</div><!-- class="product_section_main" -->
	</div><!-- class="product_section" -->
	
	
	
	
	</div> <!-- class="category_wrapper" end-->
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>