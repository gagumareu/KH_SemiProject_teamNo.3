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
			font-size: 13px;
			font-family: 나눔고딕;
		}
		
		div.left{
			width: 90%;
			float: left;
			font-size: 13px;
		}
		
		div.right{
			width: 10%;
			float: right;
			align: right;
		}
		
		section{
			margin: 75px 325px 25px 100px;
			padding: 0px 100px;
			font-size: 13px;
			font-family: 나눔고딕;
		}

		button {
			width: 60px;
			height: 40px;
			font-size: 13px;
			color: black;
			background-color: white;
		}
		
		button:hover {
			width: 60px;
			height: 40px;
			font-size: 13px;
			background-color: black;
			color: white;
		}
	</style>
</head>
<body>
	<header>
	<h1 style="font-size: 50px;"><a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
	배송지관리</h1>
	</header>

	<nav>
		<jsp:include page="../include/leftLayout.jsp" />
	</nav>

	<section>
	<b>배송지</b>
	<hr width="100%">
	<br> 
	
	<div class="left">
		<c:set var="mem" value="${memDTO }" />
		<br>
		<b>${mem.getMem_name() }</b>&nbsp;${mem.getAddr() } <br>
		${mem.getPhone().substring(0,3) }-${mem.getPhone().substring(3,7) }-${mem.getPhone().substring(7,11) }
	</div>
	
	<div class="right">
		<br>
		<table border="0" cellspacing="0">
			<tr align="right">
				<td>
					<button onclick="location.href='<%=request.getContextPath() %>/member_updateAddr.do?mem_id=${mem.getMem_id() }'" ><b>수정</b></button>
				</td>
			</tr>
		</table>
	</div>
	
	<br><br><br><br><br>
	<hr width="100%">
	<br>
	<a onclick="history.back()" style="font-size:12px">◀ 돌아가기</a>
	</section>
</body>
</html>