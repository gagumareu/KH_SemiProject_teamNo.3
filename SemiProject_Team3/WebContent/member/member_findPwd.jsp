<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="content" align="center">
	
	<fieldset class="fieldset">
		<legend>비밀번호 찾기</legend>
		${mem_Id }님의 비밀번호는 <span>${mem_Pwd.substring() } 
		
		</span> 입니다.
	</fieldset>
	
	<br>
	<br>
	
	<div class="login_link">
			<input type="button" value="로그인하기" class="button2"
				onclick="location.href='loginMain.do'">
			<input type="button" value="메인으로" class="button2"
				onclick="location.href='main.do'">				
	</div>
	
	</div>

</body>
</html>