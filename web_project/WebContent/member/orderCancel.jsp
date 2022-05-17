<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		a{
			text-decoration: none;
			color: black;
			font-family: 나눔고딕;
		}
		
		form {
			line-height: 175%;
			font-size: 11px;
			text-align: left;
			font-family: 나눔고딕;
		}
		
		div.left{
			width: 20%;
			float: left;
		}
		
		div.right{
			width: 80%;
			float: right;
		}
		
		select {
			width: 20%;
			height: 35px;
			font-family: 나눔고딕;
		}
		
		h2 {
			align: center;
			font-family: 나눔고딕;
		}
		
		button {
			width: 100px;
			height: 40px;
			background-color: black;
			font-weight: bold;
			color: white;
			font-family: 나눔고딕;
		}
		button:hover {
			width: 100px;
			height: 40px;
			background-color: white;
			font-weight: bold;
			color:black;
			font-family: 나눔고딕;
		}
		
		textarea {
			width: 50%;
			height: 150px;
			font-size: 12px;
			font-family: 나눔고딕;
		}
		::-webkit-scrollbar {
			width: 10px;
		}
		::-webkit-scrollbar-thumb {
			background-color: black;
		}
		::-webkit-scrollbar-track {
			background-color: lightgray;
		}
		
		.home_link:hover{
			font-family: Arial;
			color : white;
			text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
		}
		
		.header_title_nav {
			font-family: Arial;
			font-weight: bold;
			font-size: 60px;
			padding-top: 60px;
		}
		
		.orderCancel_container {
			display: grid;
			grid-template-columns: 15% 85%;
			grid-template-rows: 40% 60%;
			margin-top: 40px;
		}
		
		.orderCancel_wrapper {
			display: flex;
			flex-direction: column;
			min-height: 100%;
			margin-left: 15px;
		}
		
		.left_content {
			grid-column: 1;
		}
		
		.right_content {
			width: 70%;
		}
		
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
		
		}
		
		div.right2{
			width: 30%;
			float: right;
			text-align: right;
			align: right;
		}
		
	</style>
</head>
<body>
	<jsp:include page="../include/shop_top.jsp"/>
	<jsp:include page="../include/shop_top_right.jsp"/>
	
	<div class="orderCancel_wrapper">
	
		<div class="header_title_nav">
			<a class="home_link" style="font-family: Arial;" href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
			배송지관리
		</div>

	
	
		<div class="orderCancel_container">
	

			<div class="left_content">
				<nav>
				<jsp:include page="../include/leftLayout.jsp" />
				</nav>
			</div>
		
		
			<div class="right_content">
			
				<div>
					<h2>주문취소/반품신청</h2>
					<hr width="100%">
					<c:set var="payDTO" value="${paymentDTO }" />
					<c:set var="pDTO" value="${productDTO }" />
					
					<form method="post" enctype="multipart/form-data" 
						action="<%=request.getContextPath() %>/member_orderCancel_ok.do">
						<input type="hidden" name="mem_id" value="${payDTO.getOrder_id() }">
						<input type="hidden" name="order_no" value="${payDTO.getOrder_no() }">
						<input type="hidden" name="pno" value="${payDTO.getPno_fk() }">
						<input type="hidden" name="pname" value="${pDTO.getPname() }">
						<input type="hidden" name="pcolor" value="${pDTO.getPcolor() }">
						<input type="hidden" name="psize" value="${pDTO.getPsize() }">
						<input type="hidden" name="pqty" value="${payDTO.getPqty() }">
						<b>취소/반품 하시는 제품</b><br><br>
						
						<div class="left">
							<a><img src="<%=request.getContextPath() %>/upload/${payDTO.getPay_pimage() }"
								    width="100" height="100"></a>
						</div>
						
						<div class="right">
							<b>제품명: ${pDTO.getPname() }</b><br>
							색상: ${pDTO.getPcolor() }<br>
							사이즈: ${pDTO.getPsize() }<br>
							수량: ${payDTO.getPqty() }매<br>
						</div>
						
						<hr width="100%" color="white">
						<br>
						취소/반품 사유<br>
						
						<select name="category">
							<option value="제품 손상">제품 손상</option>
							<option value="배송 지연">배송 지연</option>
							<option value="사이즈">사이즈</option>
							<option value="제품 오배송">제품 오배송</option>
							<option value="기타">기타</option>
						</select>
						
						<br><br>
				       	이미지 업로드<br>
				        <input type="file" name="image">
				        <br><br>
						상세내용 <br>			
						<textarea rows="25" cols="40" name="content"
								placeholder="취소/반품 신청하시는 제품의 사진을 함께 올려주시면, 좀 더 빠르게 가능합니다."></textarea>
						<span><br><br><br></span>
				
						<hr>
						<div class="left">
							<br>
							<a class="back" onclick="history.back()" style="font-size:12px">◀ 돌아가기</a>
						</div>
						<div class="right2">
							<button type="submit"
								onclick="alert('취소/반품신청이 완료 되었습니다.')">작성하기</button>
						</div>
						<br><br><br><br><br><br><br><br>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>