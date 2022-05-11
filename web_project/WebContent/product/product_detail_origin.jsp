<%@page import="com.apc.model.ProductDAO"%>
<%@page import="com.apc.model.ProductDTO"%>
<%@page import="com.apc.model.ProductsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_products.css">


<style type="text/css">


	html, body{
		margin:0px;
		padding: 0px;
	}
	
	
 	
	/************************************/	
	
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
	
	.detail_wrapper{
	 	display: flex;
		flex-direction: column;
		min-heigth: 100vh;
 		
	}
	
	
	.product_contents{
		
		display: grid;
	 	grid-template-columns: 200px 80%;		
	 	
		

	}
		
	/*************************************/	
	
	.product_left_detail {
		grid-column: 1;
		width: 200px;
		font-size: 0.8em;
		line-height: 1.8;
		margin-top: 40px;
		margin-left: 20px;
		height: 450px;
		position: sticky;
		top: 0;
	}
	
	.product_images {
		width: 46%;
		grid-column: 2;
		place-self: center;
	}
	

	
	.product_images img {
		width: 100%;
		
	}
	
	.btn {
		display: flex;
		flex-direction: row;
	}
	
	.btn a {
		text-decoration: none;
		
	}
	
	.buy_btn {
		width: 100px;
		height: 30px;
		background-color: black;
		color: white;
		font-size: 14px;
		font-weight: bold;
		text-align: center;
		border: 1px solid black;
		justify-items:center;
		
	}
	
	.cart_btn {
		width: 100px;
		height: 30px;
		font-size: 14px;
		font-weight: bold;
		text-align: center;
		border: 1px solid black;
		color: black;
	}
	
	#cart_btn_test1 {
		width: 100px;
		height: 33px;
		background-color: black;
		font-size: 14px;
		font-weight: bold;
		text-align: center;
		border: 1px solid black;
		color: white;
	}
	
	#cart_btn_test2 {
		width: 100px;
		height: 33px;
		background-color: white;
		font-size: 14px;
		font-weight: bold;
		text-align: center;
		border: 1px solid black;
		color: black;
	}
	
	
	.review_box{
		display:none;
	}
	
	#load{
		display:none;
	}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>

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

function go_nonPay(){
	
	
	let pname = document.getElementById("p_name").value;
	let pcolor = document.getElementById("p_color").value;
	let psize = document.getElementById("p_size").value;
	
	
	//form(name=frm)의 action경로 지정
	document.frm.action = "<%=request.getContextPath()%>/go_nonPay.do?name="+pname+"&color="+pcolor+"&size="+psize ;

	//form(frm)에 submit 메서드 호출해 데이터 전달
	document.frm.submit();
	
}



//******************************************************************



$(function(){

	let id = "<%=(String)session.getAttribute("member_id")%>" ;
	
	console.log(typeof(id));
	
	if( id == "null" ){
	
	
		$(".payBtn").on("click", function(){/* 로그인이 안된 경우, 레이어팝업 뜸  */
			$(".pay_popup").show();
			$(".pay_dim").show();
		});

		$(".pay_popup .popup_close").on("click", function(){
		$(this).parent().hide();
		$(".pay_dim").hide();
		
		}); 
	
	
}else{
	
	/* 로그인 되어 있는 경우 결제창으로 넘어감 */
		
		$(".payBtn").on("click", function(){
			
			let pname = $("#p_name").val();
			let pcolor = $("#p_color").val();
			let psize = $("#p_size").val();
			
			
			$("#frm").attr("action", "<%=request.getContextPath()%>/go_pay.do?name="+pname+"&color="+pcolor+"&size="+psize);
			$("#frm").submit();
			
			
		});

	
	
}
});





	
</script>
</head>
<body>

	
	<c:set var="dto" value="${Detail }"/>
	<c:set var="clist" value="${clist }"/>
	<c:set var="slist" value="${slist }"/>
	<c:set var="ctitleCode" value="${ctitleCode }"/>
	<c:set var="ltitleCode" value="${ltitleCode }"/>
	<c:set var="fullCode" value="${fullCode }"/>
	
	<div class="detail_wrapper">

		<jsp:include page="../include/shop_top.jsp"/>
		<jsp:include page="../include/shop_top_right.jsp"/>
		
		<div class="apcTitle">
			<a href="<%=request.getContextPath() %>/index.jsp">A.P.C.
			</a>
			<a href="<%=request.getContextPath() %>/category.do?code=${ctitleCode.getCategory_code() }">
			${ctitleCode.getCategory_name() }
			</a>/<a href="<%=request.getContextPath() %>/product_list.do?code=${fullCode }">
			${ltitleCode.getCategory_name() }
			</a> 
		</div>
		
		<div class="product_contents">	
			
			<div class="product_left_detail">
				
				<form method="post"  action="">
			
					<input type="hidden" name="no" value="${dto.getPno() }">
					<input type="hidden" name="mileage" value="${dto.getMileage() }">
					<input type="hidden" name="color" value="${dto.getPcolor() }">
					<input type="hidden" name="price" value="${dto.getPrice() }">
					<input type="hidden" name="name" value="${dto.getPname() }">
					<input type="hidden" name="image" value="${dto.getPimage() }">
					
					<hr>
					<div>
						<strong>${dto.getPname() }</strong>
					</div>
					<br>
					
					<div>
						${dto.getPcontents() }
					</div>
					<br>
					
					<div>
						<fmt:formatNumber value="${dto.getPrice() }"/>원
					</div>
					
					<div>
						색상 ${dto.getPcolor() }
					</div>
					<div>		
						<c:if test="${!empty clist }" >
						<c:forEach items="${clist }" var="list">
							<a href="<%=request.getContextPath() %>/product_color_choose.do?cColor=${list.getPcolor() }&cName=${dto.getPname() }&code=${fullCode }">${list.getPcolor() }</a>
						
						</c:forEach>
						</c:if>
						
						<c:if test="${empty clist }">
								검색된 데이터가 없어요 :(
						</c:if>
						
					</div>
					
					<div>
						사이즈	
							<c:if test="${!empty slist }" >
							
							<select name="size">
								<c:forEach items="${slist }" var="sizeList">
									<option value="${sizeList.getPsize() }">
									
										<c:if test="${sizeList.getPqty() == 0 }">
											${sizeList.getPsize() } (SOLD OUT)
										</c:if>
										
										<c:if test="${sizeList.getPqty() != 0 }">
											${sizeList.getPsize() }
										</c:if>
										
									</option>
								</c:forEach>
							</select>
							
							</c:if>
							
							<c:if test="${empty slist }">
								검색된 데이터가 없어요 :(
							</c:if>
					</div>
					
					<div>
						 수량
						 <select name="qty">
						 	<c:forEach begin="1" end="10" var="count">
						 		<option value="${count }">
						 			${count }
						 		</option>
						 	</c:forEach>	
						 </select>
					</div>
					
					<div>
						적립금<fmt:formatNumber value="${dto.getMileage() }" />원 
					</div>
					
					<div>
						<a>SIZE GUIDE</a>
					</div>
					<div>
						<a>무이자할부 안내</a>
					</div>
					
					
					<div class="btn">
						<input type="button" value="바로구매" class="payBtn" id="cart_btn_test1">
						<input type="button" value="장바구니" class="cartBtn" id="cart_btn_test2" onclick="go_cart()">
					</div>
					 
			</form>
			
			
		
			
			</div><!-- product_left_detail end -->
				
			
			
			
			<div class="product_images">
			
					<img alt="" src="<%=request.getContextPath() %>/image_products/${dto.getPimage() }">
					
			</div><!-- product_images end -->
			
			
			
			
			
		<!-- **************레이어 팝업창*********************              -->
		<div class="pay_popup">
			회원으로 주문하시면 더 많은 혜택이 제공됩니다. <br>
			로그인하시겠습니까?<br>
			<br>
			<input type="button" class="nonmember_btn" value="비회원주문하기" 
				onclick="go_nonPay()">
			<input type="button" class="login_btn" value="로그인하기" 
				onclick="location.href='LoginMain.jsp?pname=${dto.getPname()}&color=${dto.getPcolor() }&size=${dto.getPsize() }'">
			
			<%-- <input id="go_pay_btn"class="btn btn-dark" type="button" value="비회원주문하기" onclick="nonmember_order()">
			<input id="go_cart_btn" class="btn btn-light" type="button" value="로그인하기" 
			onclick="location.href=<%=request.getContextPath()%>"> --%>
			<a href="#" class="popup_close">닫기</a>
		
		</div><!-- class="pay_popup" -->
		<div class="pay_dim">
			
		</div>
		<!-- **************레이어 팝업창*********************              -->
		
		
		<div class="product_review">
				<div class="review_detail">
				<c:set var="rlist" value="${rList }"/>
				<c:set var="rSum" value="${rlist.size()}"/>
				
				<div class="review_top">
				<span>REVIEW <B>(${rSum })</B></span>
				</div>
				
				
				<div class="review_content">
				<c:forEach items="${rlist }" var="dto">
				<div class="review_box1">
					<div class="review_title">
					<span class="star_rate">
						<c:choose>
							<c:when test="${dto.getReview_rate() == 5 }">
							 <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							</c:when>
							<c:when test="${dto.getReview_rate() == 4 }">
							 <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							</c:when>
							<c:when test="${dto.getReview_rate() == 3 }">
							 <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							</c:when>
							<c:when test="${dto.getReview_rate() == 2 }">
							 <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							</c:when>
							<c:when test="${dto.getReview_rate() == 1 }">
							 <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							</c:when>
							
						</c:choose>
					</span>
						<span class="review_product">
							SIZE: ${dto.getPsize() } / COLOR: ${dto.getPcolor() }
						</span>
						<span>
							${dto.getReview_date().substring(0,10) }
						</span>
					</div><!-- class="review_title" -->
					<div class="review_content">
						${dto.getReview_cont() }
					</div>
				</div>			
				<div class="review_box2">
					<span class="review_id" >${dto.getMemid_fk() }</span><br>
				</div><!-- class="Review_box2  -->			
				</c:forEach>
				</div><!-- class="review_content" -->
				
				</div><!--class="review_detail"  -->
			</div><!--class="product_review"  -->
		
		
		
		
		
		
		
		
		
		
		
	
		</div> <!-- product_contents end -->
	
	
	
	
	
		
	<jsp:include page="../include/shop_bottom.jsp"/>
	
	</div> <!-- detail_wrapper END -->
	
	
	
	
	
</body>
</html>