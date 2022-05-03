<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	body {
		font-family: arial;
	}

</style>
</head>
<body>

	<div class="content" align="center">
	
	<fieldset class="fieldset">
		<legend>아이디 찾기</legend>
		회원님의 아이디는 <span>${memId }</span> 입니다.
	</fieldset>
	
	<br>
	<br>
	
	<div class="login_link">
			<input type="button" value="로그인하기" class="button2"
				onclick="location.href='loginMain.do'">
			<input type="button" value="비밀번호 찾기" class="button2"
				onclick="location.href='find.do'">				
	</div>

	</div>
	
	

</body>
</html>