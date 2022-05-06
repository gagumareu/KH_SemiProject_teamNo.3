<%@page import="com.apc.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

		MemberDTO dto =  (MemberDTO)request.getAttribute("memberInfo");

%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/member.js"></script>
<style type="text/css">

	.wrapper2 {
		width: 80%;
		border: 3px solid blue;
		display: grid;
		grid-template-columns: 70% 30%;
	}

</style>
</head>
<body>

	<h1>A.P.C 주문결제</h1>
	<c:set var="dto" value="${memberInfo }" />
	<c:set var="list" value="${cartInfo }" />
	
	<div class="wrapper">
	
	
	<div class="wrapper2">
	
	<div class="content">
	
	
	<form method="post" 
		action="<%=request.getContextPath() %>/order_ok.do?member_id=${dto.getMemid() }">
	
		<div class="memberInfo">
		<ul>
		<li>
		<h4>주문고객정보</h4>
		</li>
		
		<li>
		<label for="member_name" class="required">주문하시는 분<em>*</em></label>
		        <div class="input-box">
		        <input type="text" name="member_name" id="member_name" class="input_text"
		        	value="${dto.getMemname() }">
		        </div>
		</li>
		
		<li>
		<label for="member_email" class="required">이메일 주소<em>*</em></label>
		        <div class="input-box">
		        <input type="text" name="member_email" id="member_email" class="input_text"
		        	value="${dto.getEmail() }">
		        </div>
		</li>
		
		<li>
		<label for="member_phone" class="required">휴대폰 번호<em>*</em></label>
		    <div class="input-box">
		    <select name="phone1" class="phone1" >
			
			<c:if test="${dto.getPhone().substring(0, 3) == 010 }">
			<option value="010" selected>010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</c:if>
			
			<c:if test="${dto.getPhone().substring(0, 3) == 011 }">
			<option value="010">010</option>
			<option value="011" selected>011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</c:if>
			
			<c:if test="${dto.getPhone().substring(0, 3) == 016 }">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016" selected>016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</c:if>
			
			<c:if test="${dto.getPhone().substring(0, 3) == 017 }">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017" selected>017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</c:if>
			
			<c:if test="${dto.getPhone().substring(0, 3) == 018 }">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018" selected>018</option>
			<option value="019">019</option>
			</c:if>
			
			<c:if test="${dto.getPhone().substring(0, 3) == 019 }">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019" selected>019</option>
			</c:if>
			</select>
			-
			<input type="text" name="phone2" class="phone" maxlength="4"
				value="${dto.getPhone().substring(4, 8) }">
			-
			<input type="text" name="phone3" class="phone" maxlength="4"
				value="${dto.getPhone().substring(9, 13) }">
		    </div>
		</li>
		
		<li>
		
		<br>
		
		</li>
		<p>변경하시는 주문고객 정보는 이번 주문에만 적용됩니다. 회원정보에는 반영되지 않습니다.</p>
		</ul>	
		</div>
		
		<hr>
		
		<div class="order_info">
		<ul>
		<li>
			<h4>배송지 정보</h4>
		</li>
		
		<li>
		고객 정보와 동일 <input type="checkbox" id="same">
		</li>
			
		<li>
		<label for="order_name" class="required">받으시는 분<em>*</em></label>
		        <div class="input-box">
		        <input type="text" name="order_name" id="order_name" class="input_text">
		        </div>
		</li>
		
		<li>
		<label for="order_phone" class="required">휴대폰 번호<em>*</em></label>
		    <div class="input-box">
		    <select name="phone1" class="phone1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</select>
			-
			<input type="text" name="phone2" class="phone" maxlength="4">
			-
			<input type="text" name="phone3" class="phone" maxlength="4">
		    </div>
		</li>
		
		<li>
		<label for="order_addr" class="required">배송지 주소<em>*</em></label>
		        <div class="input-box">
		        <input type="text" name="order_addr" id="order_addr" class="input_text">
		        </div>
		</li>
		</ul>
		</div>
		
		<hr>
		
		<div class="pay_info">
		<ul>
		<li>
			<h4>결제수단 선택</h4>
		</li>
		
		<li>
			<input type="radio" name="payment" id="credit" value="1">계좌이제
			<input type="radio" name="payment" id="transfer" value="2">카드결제
		</li>
		
		<li>
		 	<h4>마일리지</h4>
		</li>
		
		<li>
			<input type="text" name="mileage_use" id="mileage_use" class="input_text"
				value="${dto.getMileage() }">
			<input type="checkbox" name="mileage_check">마일리지 사용
		</li>
		
		</ul>
		</div>
		
		<div>
		<br>
		<input type="submit" value="결제하기" class="pay_button">
		
		</div>
	</form>
	</div>
	
	<div class="sidebar">
	
	<table id="sideTable">
	<c:if test="${!empty list }">
		<c:forEach items="${list }" var="cart">
			<input type="hidden" name="cartno" value="${cart.getCart_no() }">
			<input type="hidden" name="pno_fk" value="${cart.getPno_fk() }">
	<tr>

		
		<td> ${cart.getCart_pname() } </td>
		<c:set var="price" value="${cart.getCart_price() }" />
		<c:set var="amount" value="${cart.getCart_pqty() }" />
		<td> <fmt:formatNumber value="${price * amount }" />원 </td>
	</tr>
	
	<tr>
		<td> ${cart.getCart_pcolor() } </td>
		<c:set var="mileage" value="${cart.getCart_mileage() }" />
		<td rowspan="3"> 마일리지 : <fmt:formatNumber value="${cart.getCart_mileage() }" />원 </td>
	</tr>
	
	<tr>
		<td> ${cart.getCart_psize() } </td>
	</tr>
	
	<tr>
		 <td> 수량 : ${cart.getCart_pqty() } </td>
	</tr>
	
		<c:set var="total" value="${total + (price * amount) }" />
		<c:set var="total_mileage" value="${total_mileage + mileage }" />
		
	</c:forEach>
	</c:if>
	</table>
	
	<hr>
	
	<table id="total_mileage">
	<tr>
		<th> 총 상품 마일리지 </th> <th> ${total_mileage } </th>
	</tr>
	</table>
	
	<hr>
	
	<table id="payInfo">
	<tr>
		<th>상품판매가</th> <th> ${total } </th>
	</tr>
	
	<tr>
		<c:set var="use_mileage" value="${dto.getMileage() }" />
		<td> 마일리지사용 </td> <td> ${dto.getMileage() }  </td>
	</tr>
	
	<tr>
		<c:if test="${!empty list }">
		<c:forEach items="${list }" var="cart">
		<c:set var="trans" value="${cart.getCart_trans() }" />
		<c:set var="total_trans" value="${total_trans + trans }" />
		</c:forEach>
		</c:if>
		<td> 배송비 </td>
		<td> ${total_trans } </td>
	</tr>
	</table>
	
	<hr>
	
	<table id="totalpay">
	<tr>
	<th> 총 결제금액 </th> <th> ${total + total_trans - use_mileage } </th>
	</tr>
	</table>
	
	</div>
	
		</div>
	</div>
</body>
</html>