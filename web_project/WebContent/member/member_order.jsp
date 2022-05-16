<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
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
<script type="text/javascript">
$(document).ready(function() {
	
	
	$("#mileage_use1").change(function() {
		
		if($("#mileage_use1").is(":checked")) {
			
			// 마일리지 사용 메서드
			$("#mileage_used").remove;
			$("#mileage_used").text($("#mileage_use").val() + "원");
			$("#mileage_used").show();
			
			$(".totalPay2").remove;
			$(".totalPay2").text($(".hidden_totalPay").val() - $("#mileage_use").val() + "원");
			$(".totalPay2").show();
			
			
			
		}else{
			$("#mileage_used").remove;
			$("#mileage_used").text(0 + "원");
			$("#mileage_used").show();
			
			$("#totalPay").remove;
			$("#totalPay").text($("#totalPay").val())
			$("#totalPay").show();
			
		}
		
	});
	
	// 마일리지 사용시 총결제 금액 변경 메서드
	
});
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<style type="text/css">



	.wrapper2 {
		position: absolute;
		top: 10%;
		left: 25%;
		width: 50%;
		display: grid;
		grid-template-columns: 70% 30%;
		font-family: arial;
		font-size: 9.5pt;
	}
	
	.sidebar {
		padding-left: 35px;
	}
	
	ul li {
		list-style: none;
		margin-top: 10px;
	}
	
	h4 {
		font-weight: bold;
	}
	
	.required {
		font-size: 9pt;
	}
	
	.input_text {
		width: 40%;
		height: 30px;
		margin-top: 5px;
		
	}
	
	.phone1 {
		width: 8%;
		height: 35px;
		text-align: center;
		margin-top: 5px;
	}
	
	.phone {
		width: 8%;
		height: 30px;
		text-align: center;
		margin-top: 5px;
	}
	
	.information {
		font-size: 9pt;
	}
	
	.input_text2 {
		width: 80%;
		height: 30px;
		margin-top: 5px;
	}
	
	.input_text3 {
		width: 10%;
		height: 30px;
	}
	#tr {
		width: 20%;
	}
	#tr1 {
		font-weight: bold;
		text-align: left;
		width: 40%;
	}
	
	#tr2 {
		font-weight: bold;
		text-align: right;
		width: 40%;
	}
	
	#tr3 {
		font-size: 8pt;
		text-align: right;
		font-weight: 100;
	}
	
	.td1 {
		font-size: 8pt;
		text-align: left;
	}
	
	.td2 {
		text-align: left;
		font-weight: bold;
		padding: 0;
		margin: 0;
	}
	.td3 {
		text-align: right;
	}
	
	.tr4 {
		width: 100%;
	}
	
	
	
	.pay_button {
		width: 100%;
		height: 30px;
		background-color: black;
		color: white;
		font-weight: bold;
		align-content: center;
	}
	
	hr {
		color: gray;
		background-color: gray;
		border-color: gary;
	}
	
	.hidden_totalPay {
		display: none;
	}
	h1 a{
		margin-left:10px;
		text-decoration: none;
		color:black;
	}
	
	.sidebar_menu {
		width: 100%;
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		padding: 0;
		margin: 0;
	}
	
	hr {
		margin-top: 20px;
	}
	
</style>
</head>
<body>


	<h1><a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a>/주문결제</h1>
	<c:set var="dto" value="${memberInfo }" />
	<c:set var="list" value="${cartInfo }" />
	
	<!-- 20220514이슬수정 : 회원가입이 되어있을경우, dto / 비회원일경우 nonId 값을 loginId에 넣기 -->
	<c:if test="${empty nonId }">
	<c:set var="loginId" value="${dto.getMem_id() }"/>
	</c:if>
	<c:if test="${!empty nonId }">
	<c:set var="loginId" value="${nonId }"/>
	</c:if>
	
	<div class="wrapper">
	<form method="post" 
		action="<%=request.getContextPath() %>/order_ok.do?member_id=${loginId }">
	
	<div class="wrapper2">
	
	<div class="content">
	
		<div class="memberInfo">
		<ul>
		<li>
		<h4>주문고객정보</h4>
		</li>
		
		<li>
		<label for="member_name" class="required">주문하시는 분<em>*</em></label>
		        <div class="input-box">
		        <input type="text" name="member_name" id="member_name" class="input_text"
		        	value="${dto.getMem_name() }">
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
			<c:if test="${empty dto.getPhone() }">
			<option value="010" selected>010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</c:if>
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
		<p class="information">변경하시는 주문고객 정보는 이번 주문에만 적용됩니다. <br>
		 회원정보에는 반영되지 않습니다.</p>
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
		    <select name="phone1" id="phone1" class="phone1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			</select>
			-
			<input type="text" name="phone2" id="phone2" class="phone" maxlength="4">
			-
			<input type="text" name="phone3" id="phone3" class="phone" maxlength="4">
		    </div>
		</li>
		
		<li>
		<label for="order_addr" class="required">배송지 주소<em>*</em></label>
		        <div class="input-box">
		        <input type="text" name="order_addr" id="order_addr" class="input_text2">
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
			<input type="text" name="mileage_use" id="mileage_use" class="input_text3"
				value="${dto.getMem_mileage() }">
			<input type="checkbox" id="mileage_use1" name="mileage_check">마일리지 사용
		</li>
		
		</ul>
		</div>
		
	</div>
	
	<div class="sidebar">
	
	
	
	<table id="sideTable">
	
	
	
	<h4>장바구니 결제내역</h4>
	<c:if test="${!empty list }">
		<c:forEach items="${list }" var="cart">
			<input type="hidden" name="cartno" value="${cart.getCart_no() }">
			<input type="hidden" name="pno_fk" value="${cart.getPno_fk() }">
			<input type="hidden" name="price" value="${cart.getCart_price() }">
			<input type="hidden" name="pqty" value="${cart.getCart_pqty() }">
			<input type="hidden" name="panme" value="${cart.getCart_pname() }">
			<input type="hidden" name="transcost" value="${cart.getCart_trans() }">
			<input type="hidden" name="pimage" value="${cart.getCart_pimage() }">
			<input type="hidden" name="mileage" value="${cart.getCart_mileage() }">
	
	<tr>
		<td	rowspan="5" align="center" id="tr">
			<img src="<%=request.getContextPath() %>/upload${cart.getCart_pimage() }" width="30" height="30">
		</td>
	</tr>

	<tr>
		<td id="tr1"> ${cart.getCart_pname() } </td>
		<c:set var="price"  value="${cart.getCart_price() }" />
		<c:set var="amount" value="${cart.getCart_pqty() }" />
		<td  id="tr2" > <fmt:formatNumber value="${price * amount }" />원 </td>
	</tr>
	
	<tr>
		<td class="td1"> ${cart.getCart_pcolor() } </td>
		<c:set var="mileage" value="${cart.getCart_mileage() }" />
		<td rowspan="3" id="tr3"> 마일리지 : <fmt:formatNumber value="${cart.getCart_mileage() }" />원 </td>
	</tr>
	
	<tr>
		<td class="td1"> ${cart.getCart_psize() } </td>
	</tr>
	
	<tr>
		 <td class="td1"> 수량 : ${cart.getCart_pqty() } </td>
	</tr>
	
		<c:set var="total" value="${total + (price * amount) }" />
		<c:set var="total_mileage" value="${total_mileage + mileage }" />
		
	</c:forEach>
	</c:if>
	</table>
	
	<hr>
	
	<div class="total_mileage">
	<ul class="sidebar_menu">
		<li class="sidbar_li"> <div class="td2"> 총 상품 마일리지 </div> </li>
		<li class="sidbar_li"> <div class="td3"> <fmt:formatNumber value="${total_mileage }" />원  </div> </li>
	</ul>
	</div>
	
	<hr>
	
	<div id="payInfo">
	<ul class="sidebar_menu">
		<li class="sidbar_li"> <div class="td2">상품판매가</div>
		<li class="sidbar_li"> <div class="td3"> <fmt:formatNumber value="${total }" /> 원 </div>
	</ul>
	
	<ul class="sidebar_menu">
		<c:set var="use_mileage" value="${dto.getMem_mileage() }" />
		<li class="sidbar_li"> <div class="td2"> <p> 마일리지사용 </p></div>  </li>
		<li class="sidbar_li"> <div class="td3"> <p id="mileage_used">0원</p> </div> </li>
	</ul>
	
	<ul class="sidebar_menu">
		<c:if test="${!empty list }">
		<c:forEach items="${list }" var="cart">
		</c:forEach>
		</c:if>
		<li class="sidbar_li"> <div class="td2"> 배송비 </div> </li>
		<li class="sidbar_li"> <div class="td3">
		<c:if test="${total < 1000000 }">
		3,000원
		<c:set var="total2" value="${total + 3000}" />
		<input type="text" value="${total2 }" class="hidden_totalPay">
		</c:if>
		<c:if test="${total >= 1000000 }">
		0원
		<c:set var="total2" value="${total }" />
		<input type="text" value="${total2 }" class="hidden_totalPay">
		</c:if>
		</div> </li>
	</ul>
	</div>
	
	<hr>
	
	<div id="totalpay">
	<ul class="sidebar_menu">
	<li> <div class="td2"> <p> 총 결제금액 </p> </div> </li>
	<c:if test="${total < 1000000 }">
	<li> <div class="td3">
		<p class="totalPay2">${total2 }원</p>
	</div> </li>
	</c:if>
	
	<c:if test="${total >= 1000000 }">
	<li> <div class="td3">
		<p class="totalPay2">${total2 }원</p>
	</div> </li>
	</c:if>
	</ul>
	</div>
	
	<hr>
	
	<div>
		<br>
		<input type="submit" value="결제하기" class="pay_button">
		
	</div>
	
	
	</div>
	
		</div>
		</form>
	</div>
</body>
</html>