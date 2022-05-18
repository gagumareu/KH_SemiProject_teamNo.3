<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
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
			width: 450px;
			align: center;
			font-size: 11px;
			text-align: left;
			font-family: 나눔고딕;
		}
		
		input {
			width: 100%;
			height: 30px;
			font-size: 15px;
			font-family: 나눔고딕;
		}
		
		input.small{
			width: 50%;
			height: 30px;
			font-size: 15px;
			text-align: center;
			letter-spacing: 1.5px;
			font-family: 나눔고딕;
		}
		
		select {
			width: 45%;
			height: 35px;
			font-size: 15px;
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
			width: 100%;
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
		
	</style>
</head>
<body>
	<div align="center">
		<h2>온라인상담 작성하기</h2>
		<hr width="30%" color="lightgray">
		<c:set var="mem" value="${memDTO }" />
		<c:set var="list" value="${qaList }" />
		<form method="post" action="<%=request.getContextPath() %>/member_writeContact_ok.do">
			<input type="hidden" name="mem_id" value="${mem.getMem_id() }">
			상담제목 <br>
			<input type="text" name="title" />
			<br> <br>
			문의유형선택 <br>
			<select name="qa_category">
				<c:forEach items="${list }" var="qalist">
					<option value="${qalist.getCategory_code() }">${qalist.getCategory_name() }</option>
				</c:forEach>
			</select>
	      	
			<br>
			<br>
			문의내용 <br>			
			<textarea rows="25" cols="40" name="content"
					placeholder="[주의]문의하시는 주문번호, 상품명을 표기해 주시면, 좀 더 빠른 안내가 가능합니다."></textarea>
			<span><br></span>
			
			<div align="center">
										
			<button type="submit"
					onclick="alert('문의 작성이 완료 되었습니다.')">작성하기</button>
			</div>
		</form>
	</div>
</body>
</html>