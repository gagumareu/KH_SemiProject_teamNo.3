<%@page import="com.apc.model.CartDTO"%>
<%@page import="com.apc.model.CartDAO"%>
<%@page import="com.apc.model.ProductDAO"%>
<%@page import="com.apc.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 선택</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>

	#popup_container{
		
		width:100%;
		height:100%;
		padding:20px;
		text-align: center;
	}
	#top{
		margin-top:20px;
		margin-bottom:30px;	
		padding:10px;
		border: 5px solid gray;
	}
	
	.qa_paging a{
		text-decoration: none;
		color:black;
	}
	
	#popup_img{
		width:30%;
	}
	
	#popup_info div{
		margin-top:40px;
	}
	
	#popup_btn input{
		background-color:black;
		color:white;
		margin-top: 55px;
		font-size:0.9em;
	}
	
</style>
</head>
<body>

	<div id="popup_container" align="center">
		<div id="top">
			<form method="post" action="<%=request.getContextPath()%>/qa_product_search.do">
			<select name="search_field">
				<option value="pname">제품명</option>
				<option value="category">카테고리</option>
			</select>
			<input type="text" name="search_word">
			<button id="search_btn" type="submit" class="btn btn-outline-dark">
					검색
			</button>
			</form>
		</div>
		
		<div id="middle">
			<span> </span>
		</div>
		<div id="bottom">
			<table class="table table-hover ">
				<thead>
					<tr class="table-secondary">
						<th scope="col">상품이미지</th>
						<th scope="col">상품정보</th>
						<th scope="col">선택</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="search" value="${Search }"/>
				
					
					<c:if test="${!empty  search}">
					<%
						List<ProductDTO> list = (List<ProductDTO>)request.getAttribute("Search");
						ProductDAO pdao = ProductDAO.getInstance();
						for(int i=0; i<list.size(); i++){
							 ProductDTO product = list.get(i);
							 
							String[] img = pdao.getPorudctImg(product);	 
							
					%>
					<tr>
						<td id="popup_img">
						<img alt="arrImg[0]" src="<%=request.getContextPath() %>/upload/<%= img[0] %> " width="100%" height="100%">
						</td>
						<td id="popup_info">
							<div>
							<%=product.getPname() %><br>
							<span>SIZE: <%=product.getPsize() %>/COLOR: <%=product.getPcolor() %></span><br>
							<span><%=product.getPrice() %></span>
							</div>		
						</td>
							<td id="popup_btn"> 
							<input type="button" onclick="parentscall(<%=product.getPno() %>)" value="선택">
						</td>
					</tr>

						<script type="text/javascript">
	
							function parentscall(pno){
								
								window.opener.location.href="<%=request.getContextPath()%>/qa_write.do?num="+pno;
								self.close();

							}
						</script>

						<%	} %>
					</c:if>
				</tbody>
					
			</table>
			<c:if test="${empty search }">
					<script type="text/javascript">
						console.log("데이터없음");
					</script>
					</c:if>
		</div>
		
			<div class="qa_paging" align="center">
			<c:if test="${page > block }">
				<!-- 현재페이지가 block(3)보다 큰경우,  예를들어 현재페이지가 4일 경우  -->
				<a href="<%=request.getContextPath()%>/qa_product_search.do?page=1&search_field=${search_field}&search_word=${search_word}">
				<img src="images/btn_first.png" alt="btn_first">
				</a>
				<!-- 1페이지로 이동 (최초페이지로 이동)-->
				<a
					href="<%=request.getContextPath() %>/qa_product_search.do?page=${startBlock-1}&search_field=${search_field}&search_word=${search_word}">
					<img src="images/btn_prev.png" alt="btn_prev">
				</a>
				<!-- 3페이지로 이동(이전페이지로 이동)  -->
			</c:if>
			<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${i == page }">
					<!-- startBlock == page, 현재페이지라면 -->
					<b><a
						href="<%=request.getContextPath()%>/qa_product_search.do?page=${i}&search_field=${search_field}&search_word=${search_word}">[${i }]</a></b>
				</c:if>
				<c:if test="${i != page }">
					<!-- startBlock != page, 현재재페이지가 아니라면 -->
					<a href="<%=request.getContextPath()%>/qa_product_search.do?page=${i}&search_field=${search_field}&search_word=${search_word}">[${i }]</a>
				</c:if>
			</c:forEach>

			<c:if test="${endBlock < allPage }">
				<!-- endBlock이 전체페이지 수보다 작은경우, 예를 들어 endBlock이 6페이지인경우 -->
				<a href="qa_product_search.do?page=${endBlock + 1 }&search_field=${search_field}&search_word=${search_word}">
				<img src="images/btn_next.png" alt="btn_next">
				</a>
				<!-- 7페이지로 이동(다음 페이지로 이동) -->
				<a href="qa_product_search.do?page=${allPage }&search_field=${search_field}&search_word=${search_word}">
				<img src="images/btn_last.png"alt="btn_last">
				</a>
				<!-- 마지막페이지로 이동  -->
			</c:if>
		</div><!-- class="qa_paging -->
	</div><!-- class="popup_container" -->

	<script type="text/javascript">
	
		$(function(){
			
			$("#search_Btn").on("click", function(){
				$(".qa_paging").show();
			});
			
		});
	
	</script>
	

</body>
</html>