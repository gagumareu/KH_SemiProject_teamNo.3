<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>

<style type="text/css">

body {
  font-family:arial;
 
}

h1 span{
	font-size: 50px;
}

h3{
	padding-bottom: 0px;
	margin-bottom:0px;
}
.id_pwd {
	font-size: 5px;
	color: black;
	padding-top: 10px;
	padding-bottom: 3px;
}

.text_id_pwd {
	width: 280px;
	height: 29px;
	background-color: white;
	border-color: gray;
	border-width: 1px;
}

a {
	text-decoration: none;
	font-size: 7px;
	color: black;
	font-weight: bold;
	margin-top: 5px;
}

#cb1 {
	font-size: 5px;
}

hr {
height: 2px;
background-color: black;
	
}

tr td span{
	font-size: 5px;
	margin-top: 0;
	
}

#btn_login{
	width: 280px;
	height: 31px;
	margin-top: 10px;
	background-color: black;
	color: white;
	font-size: 7px;
	font-weight:bold;
	border-color: black;

}


</style>
</head>
<body>

	<h1><span>A.P.C</span>
		<span>LOG IN</span>
	</h1>
	
	<div align="center">
	<h3>관리자 로그인</h3>
	<hr width="280">
	<br>
	

	
	<form method="post" action="<%=request.getContextPath() %>/admin_login_ok.do">
	<table border="0" cellspacing="0" width="280" >		
		<tr>
			<td class="id_pwd">관리자 아이디<em>*</em></td>
						
		</tr>
		
		<tr>
			<td>
				<input name="admin_id" class="text_id_pwd">
			</td>
		</tr>
		
		
		<tr>
			<td class="id_pwd">비밀번호<em>*</em></td>
			
		</tr>
		
		<tr>
			<td>
				<input name="admin_pwd" class="text_id_pwd">				
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="checkbox" value="save_login" name="save_login" id="cb1">
				<span>아이디 저장</span>							
				
			</td>
				
		</tr>
		
		<tr>
			<td>
				<input type="submit" value="로그인" name="login_button" id="btn_login"> 
				
			</td>
		</tr>
		
		<tr>
			<td align="center">
				<a href = "<%=request.getContentType() %>/reserch_id.do">아이디 찾기</a>&nbsp;|&nbsp;
				<a href = "<%=request.getContentType() %>/reserch_pwd.do">비밀번호 찾기</a>&nbsp;|&nbsp;
				<a href = "<%=request.getContentType() %>/reserch_join.do">회원가입</a>
			</td>
		</tr>
	</table>
		
	
	
	
	</form>
</div>

	

</body>
</html>