<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A.P.C. 장바구니</title>

   <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
a {
	text-decoration: none;
	color: black;
}

a.delete:hover {
	cursor: pointer;
}

section {
	font-size: 0.75em;
	font-family: 나눔고딕;
}

form {
	border-left: thin solid lightgray;
	width: 30%;
	padding: 0 0 0 2%;
	float: right;
}

div.left {
	width: 65%;
	padding: 0 2% 0 0;
	float: left;
}

div.left2 {
	width: 20%;
	padding: 0 2% 0 0;
	float: left;
}

div.left3 {
	width: 25%;
	float: left;
	color: gray;
}

div.center {
	width: 60%;
	float: left;
}

div.right {
	width: 30%;
	float: right;
	text-align: right;
}

div.right2 {
	width: 15%;
	float: right;
	text-align: right;
}

button.black {
	background-color: black;
	color: white;
	width: 100%;
	height: 40px;
}

button.white {
	border: 0;
	font-size: 15px;
	background-color: white;
}

input.check {
	position: relative;
	top: 5px;
	width: 17px;
	height: 17px;
}

input.image {
	position: relative;
	top: -85px;
	width: 17px;
	height: 17px;
}

select {
	width: 75px;
	border: 0;
}


	.home_link:hover {
		font-family: Arial;
		color: white;
		text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px
			0 #000;
	}
	
	.header_title_nav {
		font-family: Arial;
		font-weight: bold;
		font-size: 60px;
		padding-top: 60px;
	}
	
	.left_content {
		grid-column: 1;
	}
	
	.right_content {
		width: 80%;
	}
	
	.cartMain_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100%;
		margin-left: 15px;
	}
	
	.container {
		display: grid;
		grid-template-columns: 15% 85%;
		grid-template-rows: 40% 60%;
		margin-top: 40px;
	}
	
	html, body {
		margin: 0;
		padding: 0;
		height: 100%;
	}
	
	.numBox{
	
		border: none;
    	width: 30px;
	}
	
</style>


</head>
<body>
	<jsp:include page="../include/shop_top.jsp" />
	<jsp:include page="../include/shop_top_right.jsp" />

	<div class="cartMain_wrapper">

		<div class="header_title_nav">
			<a class="home_link" style="font-family: Arial;"
				href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 장바구니
		</div>

		<section class="container">

			<div class="left_content"></div>

			<c:set var="cList" value="${cartList }" />
			<div class="right_content">
				<div class="left">
					<b>전체상품</b>
					<hr color="lightgray">
					<br>
					<br>
					<c:forEach items="${cList }" var="cDTO">
						<input type="hidden" name="id" value="${cDTO.getCart_memid() }" />
						<input class="cno" type="hidden" name="cno" value="${cDTO.getCart_no() }" />
						<div class="left2">
							<a
								href="<%=request.getContextPath() %>/product_detail.do?num=${cDTO.getPno_fk() }">
								<img
								src="<%=request.getContextPath() %>/upload/${cDTO.getCart_pimage() }"
								width="100" height="100">
							</a>
						</div>

						<!-- ajax가 필요해 보인다. ajax로 jsp 페이지 안에서 dao 메서드를 연산이 가능한가를 알아봐야한다. -->
						<div class="center">
							<a
								href="<%=request.getContextPath() %>/product_detail.do?num=${cDTO.getPno_fk() }">
								<b>${cDTO.getCart_pname() }</b>
							</a><br>
							<br>
							<br>
							<div class="left3">
								SIZE<br>
								<br> <a
									href="<%=request.getContextPath() %>/cart_update.do?num=${cDTO.getCart_no() }">
									<b>${cDTO.getCart_psize() }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼</b>
								</a>
							</div>
							<div class="left3">
								COLOR<br>
								<br> <a
									href="<%=request.getContextPath() %>/cart_update.do?num=${cDTO.getCart_no() }">
									<b>${cDTO.getCart_pcolor() }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▼</b>
								</a>
							</div>
							<div class="left3">
								QTY<br>
								<br> 
								<span class="cart_minus" style="font-size: 13px"> -</span>
								&nbsp;&nbsp;&nbsp;
								<%-- <span style="font-size: 13px;"><b>${cDTO.getCart_pqty() }</b></span> --%>
								<span style="font-size: 13px;"> <input type="number" class="numBox" name="cart_qty" min="1"  value="${cDTO.getCart_pqty() }" readonly disabled/></span>
								
								&nbsp;&nbsp;&nbsp;
								<!-- 비즈니스 로직 처리 삭제 >>> 자바스크립트 및 ajax로 수량변경 구현 -->
								 <%-- <a class="cart_plus" style="font-size: 13px"
									href="<%=request.getContextPath() %>/cart_qtyUp.do?num=${cDTO.getCart_no() }">+</a> --%>
								 <span class="cart_plus" style="font-size: 13px" >+</span> 
							</div>
						</div>

						<div class="right2">
							<a class="delete"
								onclick="if(confirm('해당 상품을 쇼핑백에서 삭제하시겠습니까?')){
									location.href='<%=request.getContextPath() %>/cart_delete.do?num=${cDTO.getCart_no() }'}
									else{ return; }">
								X</a><br>
							<br> 적립금
							<span class="totalMileage">
							<fmt:formatNumber
								value="${cDTO.getCart_mileage() * cDTO.getCart_pqty() }" /></span>
							원<br>
							<input class="perMileage" type="hidden" value="${cDTO.getCart_mileage() }">
							<br> <b><span class="cart_totalPrice"><fmt:formatNumber
									value="${cDTO.getCart_price() * cDTO.getCart_pqty() }" /></span>원</b>
							<input class="perPrice" type="hidden" value="${cDTO.getCart_price() }">
						</div>
						<br>
						<br>
						<hr width="100%" color="white">
						<br>
						<br>
					</c:forEach>
				</div>
				
				
						<script type="text/javascript">
						
						function payTotal(){
							 let total = 0;
							 let mileage = 0;
							 
							    for(let j=0;j<$(".numBox").length;j++){
							    	
							        total += $(".cart_totalPrice").eq(j).val();
							        mileage += parseInt($(".cart_totalMileage").eq(j).val());
							        
							        console.log("total:"+total);
							        console.log("total:"+mileage);
							        
							    }
							    
							    $(".priceSum").text(total.toString()
							    .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));

							    $(".mileageSum").text(total.toString()
									    .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
							   
							
						}
						
						

						for(let i =0; i<$(".numBox").length; i++){
													
								$(".cart_plus").eq(i).click(function(){
								let totalPrice = $(".cart_totalPrice").eq(i);
								let totalMileage = $(".totalMileage").eq(i);						
								let productPrice = $(".perPrice").eq(i).val();
								let productMileage = $(".perMileage").eq(i).val(); 
														
								let num = $(".numBox").eq(i).val();
								let plusNum = Number(num)+1;
														
								console.log(i+"번째 num:"+num);
								console.log(i+"번째 plusNum:"+plusNum);
								let cnoeq = $(".cno").eq(i).val();
														
								$.ajax({
															
								type:"post",
								url:"cart_up.do",
								datatype : "text",
								data : {cno : cnoeq},
								success: function(data){
																
								if(data < 1){
																	
									alert("재고가 부족합니다.");	
									$(".numBox").eq(i).val(num);
																	 
								}else{
									 $(".numBox").eq(i).val(plusNum);
								}
																
								} ,
								error:function(data){
										alert("통신오류");
									}
															
								});
													
														
							totalPrice.eq(i).text((parseInt(plusNum)*parseInt(productPrice)).toString()
									  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
														
							totalMileage.eq(i).text((parseInt(plusNum)*parseInt(productMileage)).toString()
										 .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
							
							payTotal();
														
							});
													
													
							$(".cart_minus").eq(i).click(function(){
														
									 let totalPrice = $(".cart_totalPrice").eq(i);
									let totalMileage = $(".totalMileage").eq(i);
									let productPrice = $(".perPrice").eq(i).val();
									let productMileage = $(".perMileage").eq(i).val(); 
														
									let num = $(".numBox").eq(i).val();
									let minusNum = Number(num)-1;
														
									console.log(i+"번째 num:"+num);
									console.log(i+"번째 plusNum:"+minusNum);
									console.log(i+"번째 plusNum:"+$(".cno").eq(i).val());
									let cnoeq = $(".cno").eq(i).val();
														
									if(parseInt(minusNum) < 1 ){
										alert('최소 주문수량은 1개입니다.');
										$(".numBox").eq(i).val(num);
															
									}else{
										$(".numBox").eq(i).val(minusNum);
															
									$.ajax({
																
										type:"post",
										url:"cart_down.do",
										datatype : "text",
										data : {cno : cnoeq},
										success: function(data){
										if(data>0){
												console.log("ok");
										}else{
												console.log("sql 오류발생");
										}
																	
										} ,
										error:function(data){
													alert("통신오류");
										}
																
									});
															
									totalPrice.eq(i).text((parseInt(minusNum)*parseInt(productPrice)).toString()
											 .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
															
									totalMileage.eq(i).text((parseInt(minusNum)*parseInt(productMileage)).toString()
											.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
															
									}
									
									payTotal();				
								});
													
													
						}
						
						</script>
				
				<form method="post" action="<%=request.getContextPath()%>/go_pay_fromcart.do">
					<b>장바구니 결제금액</b>
					<c:set var="pSum" value="${price_sum }" />
					<c:set var="mSum" value="${mileage_sum }" />
					<c:set var="tCost" value="${tCost }" />
					<hr>
					<br>
					<br>

					<div class="left">
						<b>판매가</b><br>
						<br> 적립금<br>
						<br> 배송비<br>
						<br>
					</div>

					<div class="right">
						<span class="priceSum"><b><fmt:formatNumber value="${pSum }" />원</b><br></span>
						<br>
						<span class="mileageSum"><fmt:formatNumber value="${mSum }" /></span>
						원<br>
						<br>
						<fmt:formatNumber value="${tCost }" />
						원<br>
						<br>
					</div>

					<hr color="lightgray" width="100%">
					<br>
					<br>

					<div class="left">
						<b>구매예상금액</b>
					</div>

					<div class="right">
						<b><fmt:formatNumber value="${pSum + tCost}" />원</b>
					</div>
					<br>
					<br>
					<br>
					<br>
					<button type="submit" class="black">
						<b>구매하기</b>
					</button>
				</form>
			</div>
		</section>
	</div>
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>