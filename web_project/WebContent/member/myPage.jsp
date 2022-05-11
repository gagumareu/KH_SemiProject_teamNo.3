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
		
		header a{
			font-family: Arial;
		}
		
		header a:hover{
			font-family: Arial;
			color : white;
			text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
		}
		
		nav{
			float: left;
			margin: 10px;
		}
		
		section{
			margin: 75px 325px 25px 100px;
			padding: 0px 100px;
			font-size: 0.75em;
			font-family: 나눔고딕;
		}
		
		div{
			width: 100%;
			height: 250px;
		}
		
		div.left{
			width: 45%;
			float: left;
		}
		
		div.right{
			width: 55%;
			float: right;
		}
		
		span.left{
			width: 94%;
			float: left;
		}
		span.right{
			width: 6%;
			float: right;
			font-size: 1em;
		}
		span a:hover {
			color: black;
		}
		
		section a {
			font-size: 0.75em;
			color: gray;
		}
	</style>
</head>
<body>
	<header>
	<h1 style="font-size: 50px;"><a href="mainPage.jsp">A.P.C.</a> 
	마이페이지</h1>
	</header>

	<nav>
		<jsp:include page="../include/leftLayout.jsp" />
	</nav>

	<section>
		<span class="left">
			<h1 style="display:inline; font-size: 50px;">회원정보</h1>
		</span>
		<span class="right">
			<br> <br> <br>
			<a href="<%=request.getContextPath() %>/member_confirmPsw.do?mem_id=${mem.getMem_id() }">정보수정</a>
		</span>

		<hr width="100%">
		
		<div class="left">	
			<br>
			<c:set var="mem" value="${memDTO }" />
			<b>${mem.getMem_name() }</b> <br>
			${mem.getPhone().substring(0,3) }-${mem.getPhone().substring(3,7) }-${mem.getPhone().substring(7,11) } <br>
			${mem.getEmail() }
			<br><br>
		
			<b>배송지관리</b> <br>
			<a href="<%=request.getContextPath() %>/member_addrView.do?mem_id=${mem.getMem_id() }">전체관리</a>
			<br> <br>
		
			<b>비밀번호변경</b>	<br>
			<a href="<%=request.getContextPath() %>/member_updatePwd.do?mem_id=${mem.getMem_id() }">변경하기</a>
			<br> <br>
		</div>
		
		<div class="right">
			<br>
			<b>온라인상담</b> <br>
			<a href="<%=request.getContextPath() %>/member_contactView.do?mem_id=${mem.getMem_id() }">전체보기</a>	
			<br> <br> <br>
			
			<b>적립금: ${mem.getMem_mileage() }원</b> <br>
			<a href="mileageView.jsp">전체보기</a>
		</div>
		
		<h1 style="display:inline; font-size: 50px;">구매 내역</h1>
		<hr width="100%">
		
		<div class="left">
			<br>
			<b>구매 내역</b> <br>
			<a href="<%=request.getContextPath() %>/member_orderView.do?mem_id=${mem.getMem_id() }">전체보기</a>
		</div>
		
		<div class="right">
			<br>
			<b>취소/반품 신청</b> <br>
			<a href="<%=request.getContextPath() %>/member_orderCancelView.do?mem_id=${mem.getMem_id() }">조회하기</a>
		</div>
	</section>
</body>
</html>