<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		form {
			line-height: 175%;
			width: 300px;
			align: center;
			font-size: 11px;
			text-align: left;
		}
		
		input {
			width: 300px;
			height: 30px;
			font-size: 15px;
		}
		
		input.small{
			width: 75px;
			height: 30px;
			font-size: 15px;
			text-align: center;
			letter-spacing: 1.5px;
		}
		
		select {
			width: 75px;
			height: 35px;
			font-size: 15px;
		}
		
		h2 {
			align: center;
		}
		
		button {
			width: 100px;
			height: 40px;
			background-color: black;
			color: white;
		}
	</style>
</head>
<body>
	<div align="center">
		<h2>배송지 수정</h2>
		<hr width="30%" color="lightgray">
		<c:set var="mem" value="${memDTO }" />
		<form method="post" action="<%=request.getContextPath() %>/member_updateAddr_ok.do">
			<input type="hidden" name="mem_id" value="${mem.getMem_id() }">
			받으시는 분 <br>
			<input type="text" value="${mem.getMem_name() }" readonly />
			<br> 
			<br>
			휴대폰 번호 <br>
			<select name="first_phone">
				<option value="${mem.getPhone().substring(0,3) }" selected>${mem.getPhone().substring(0,3) }</option>
	        	<option value="010">010</option>		<!-- 국번 테이블이 있다면 중복을 막을 수 있어보입니다. 일단은 보류 했습니다... -->
	        	<option value="011">011</option>
	        	<option value="016">016</option>
	        	<option value="017">017</option>	      
	        	<option value="018">018</option>	      
	        	<option value="019">019</option>
	      	</select>
	      	-
			<input class="small" type="text" name="middle_phone" value="${mem.getPhone().substring(3,7) }" />
			-
			<input class="small" type="text" name="last_phone" value="${mem.getPhone().substring(7,11) }" />
			<br>
			<br>
			배송지주소 <br>			<!-- 이 부분 고민 해보기 -->
			<input type="text" name="first_addr" value="${mem.getAddr() }" />
			<span><br></span>
			<input type="text" name="last_addr" />
			<br>
			<br>
			<div align="center">
										<!-- 지금은 confirm으로 했지만 나중에 창 하나 만들어서 띄워야 한다. -->
			<button type="submit" onclick="if(confirm('입력하신 내용으로 배송지를 저장 하시겠습니까?')) {
											}else
											{ return; }">저장하기</button>
			</div>
		</form>
	</div>
</body>
</html>