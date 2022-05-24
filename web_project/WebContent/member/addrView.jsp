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
		
		a.back:hover {
		cursor: pointer;
		}

		section{
			
			font-size: 13px;
			font-family: 나눔고딕;
		}
		
		div{
			font-size: 12px;
			font-family: 나눔고딕;
		}
		
		input.black {
			font-size : 12px;
			width: 50px; 
			height: 35px; 
			text-align: center; 
			color: white;
			background-color: black;
			font-weight: bold;
			font-family: 나눔고딕;
		}
		
		input.white {
			font-size : 12px;
			width: 50px; 
			height: 35px; 
			text-align: center; 
			color: black;
			background-color: white;
			font-weight: bold;
			font-family: 나눔고딕;
		}
		
		input.text{
			letter-spacing: 1.5px;
			font-size: 15px;
			width: 150px; 
			height: 30px; 
			text-align: center; 
			background-color: white;
		}
		
		div.left{
			width: 90%;
			float: left;
			text-align: left;
			font-size: 13px;
			font-family: 나눔고딕;
		}
		
		div.right{
			width: 10%;
			float: right;
			align: right;
			font-family: 나눔고딕;
		}
		
		div.snow{
			background-color:snow;
			text-align:left;
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
		.addrView_container {
			display: grid;
			grid-template-columns: 15% 85%;
			grid-template-rows: 40% 60%;
			margin-top: 40px;
		}
		
		.left_content {
			grid-column: 1;
		}
		
		.right_content {
			width: 50%;
			
		
		}
		
		.addrView_wrapper {
			display: flex;
			flex-direction: column;
			min-height: 100%;
			margin-left: 15px;
		}
		
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
		
		}
		
		input.button {
			background-color:white;
		}
	</style>
</head>
<body>


    <jsp:include page="../include/shop_top.jsp"/>
	<jsp:include page="../include/shop_top_right.jsp"/>

	<div class="addrView_wrapper">
	
		<div class="header_title_nav">
			<a class="home_link" style="font-family: Arial;" href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
			배송지관리
		</div>

	
	
		<div class="addrView_container">
	

		<div class="left_content">
			<nav>
			<jsp:include page="../include/leftLayout.jsp" />
			</nav>
		</div>
	
	
		<div class="right_content">
			<div><b>배송지</b></div>
			<hr width="100%">
				<div>
					<div class="left">
						<c:set var="mem" value="${memDTO }" />
						<br>
						<b>${mem.getMem_name() }</b>&nbsp;${mem.getAddr() } <br>
						${mem.getPhone() }
					</div>
					<div class="right">
						<br>
						<table border="0" cellspacing="0">
							<tr align="right">
								<td>
									<input type="button" class="white" value="수정"
									onclick="location.href='<%=request.getContextPath() %>/member_updateAddr.do?id=${mem.getMem_id() }';"  />	
								</td>
							</tr>
						</table>
					</div>
					<br><br><br><br><br>	
				</div>
			<hr width="100%">
			<br>
			<a class="back" onclick="history.back()" style="font-size:12px">◀ 돌아가기</a>
			</div>
		</div>
	</div>
	
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>