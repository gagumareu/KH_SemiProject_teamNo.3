<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
<<<<<<< HEAD
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin_login.css">
=======
<link rel="stylesheet" href="../css/admin_login.css">
>>>>>>> origin/junghwan


</head>
<body>

	<h1><span>A.P.C</span>
		<span>LOG IN</span>
	</h1>
	<br>
<<<<<<< HEAD
=======
	<br>
	<br>
>>>>>>> origin/junghwan
	
	<div align="center">
	<h3>관리자 로그인</h3>
	<hr width="280">
	<br>
	
	
<<<<<<< HEAD

	
	<form method="post" action="<%=request.getContextPath() %>/admin_login_ok.do">
	<table border="0" cellspacing="0" width="280" >		
=======
	

	
	<form method="post" action="<%=request.getContextPath() %>/admin_login_ok.do">
	<table border="0" cellspacing="0" width="287px" >		
>>>>>>> origin/junghwan
		<tr>
			<td class="id_pwd">관리자 아이디<em>*</em></td>
						
		</tr>
		
		<tr>
			<td>
				<input name="admin_id" class="text_id_pwd">
			</td>
		</tr>
		
		
		<tr>
<<<<<<< HEAD
			<td class="id_pwd">비밀번호<em>*</em></td>
=======
			<td type="password" class="id_pwd">비밀번호<em>*</em></td> <!--20220512이슬수정  -->
>>>>>>> origin/junghwan
			
		</tr>
		
		<tr>
			<td>
<<<<<<< HEAD
				<input type="password" name="admin_pwd" class="text_id_pwd">				
=======
				<input name="admin_pwd" class="text_id_pwd">				
>>>>>>> origin/junghwan
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
		
<%-- 		<tr>
			<td align="center">
				<a href = "<%=request.getContentType() %>/reserch_id.do">아이디 찾기</a>&nbsp;|&nbsp;
				<a href = "<%=request.getContentType() %>/reserch_pwd.do">비밀번호 찾기</a>&nbsp;|&nbsp;
				<a href = "<%=request.getContentType() %>/reserch_join.do">회원가입</a>
			</td>
		</tr> --%>
	</table>
		
	
	
	
	</form>
</div>

	

</body>
</html>