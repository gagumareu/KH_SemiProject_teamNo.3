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
		.contact_container {
			display: grid;
			grid-template-columns: 15% 85%;
			grid-template-rows: 40% 60%;
			margin-top: 40px;
		}
		
		.left_content {
			grid-column: 1;
		}
		
		.right_content {
			width: 70%;
			
		
		}
		.contact_wrapper {
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

	<div class="contact_wrapper">
	
		<div class="header_title_nav">
			<a class="home_link" style="font-family: Arial;" href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
			온라인상담
		</div>

	
	
		<div class="contact_container">
	

		<div class="left_content">
			<nav>
			<jsp:include page="../include/leftLayout.jsp" />
			</nav>
		</div>
	
	
		<div class="right_content">
			<div><b>온라인상담</b></div>
			<hr width="100%">
				<div align="center">
					<br>
					<b>기간조회 :</b>
					
					<!-- 이 부분 ajax를 좀더 공부하고 와서 완성할 것 -->
					
					<c:set var="date_3" value="${date_3 }" />
					<c:set var="date_now" value="${date_now }" />
					<c:set var="mem" value="${memDTO }" />
					<c:set var="qList" value="${qaList }"/>
					<c:set var="reList" value="${replyList }" />
					
					<input type="button" value="3개월" class="black" />
					<input type="button" value="6개월" class="white" />
					<input type="text" value=${date_3 } class="text" />
					~
					<input type="text" value=${date_now } class="text" />
					<input type="button" value="조회" class="black" />
					&nbsp; &nbsp;
					<input type="button" value="문의하기" class="white" 
						onclick="location.href='qa_write.do?id=${mem.getMem_id() }'"
						style="width: 75px;"/>
					<br> <br> <br>
					<hr>
					<c:forEach items="${qList }" var="qaDTO">
					<c:set var="a" value="0" />
					<br>
						<div class="left">
							<b>${qaDTO.getQa_title() }</b> <br>
							<span style="color: grey;">
								<c:if test="${qaDTO.getQa_update() == null }" > ${qaDTO.getQa_date() }</c:if>
								<c:if test="${qaDTO.getQa_update() != null }" > ${qaDTO.getQa_update() }</c:if>
							</span>
						</div>
						<div class="right">
							<span style="color:grey;">
								<c:forEach items="${reList }" var="reDTO">
									<c:if test="${reDTO.getQa_group() == qaDTO.getQa_group() }">
										답변완료
										<c:set var="a" value="1" />
									</c:if>
								</c:forEach>
							</span>
							<span style="color:red;">
								<c:if test="${a == 0}">
									답변대기
									<input type="button" value="x" class="button" 
											onclick="if(confirm('정말로 삭제하시겠습니까?')){
												location.href='member_deleteContact.do?no=${qaDTO.getQa_no() }&id=${mem.getMem_id() } '}
												else{ return; }" />
								</c:if>			
							</span>
						</div>
						<hr width="100%" color="white">
						<c:if test="${a == 1}">
							<div class="snow">
								<br>admin : <br><br>
								<c:forEach items="${reList }" var="reDTO">
									<c:if test="${reDTO.getQa_group() == qaDTO.getQa_group() }">
										${reDTO.getQa_cont() }<br>&nbsp;
									</c:if>
								</c:forEach>
							</div>
						</c:if>
						<br>
					</c:forEach>
					<br><br><br><br>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>