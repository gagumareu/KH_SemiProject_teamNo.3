<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

	function TabOpen(number) {
    document.getElementById('tab00').style.display='none';
    document.getElementById('tab01').style.display='none';


    document.getElementById('tab' + number).style.display='block';
	}

</script>
<style type="text/css">

	body {
		font-family: arial;
	}

	#tab01 {
		display: none;
	}

</style>
</head>
<body>

	<h1>A.P.C LOG IN</h1>
	
	<div id="tab00">
		 <form  method="post" id="findId_form" class="findId_form"
		            action="<%=request.getContextPath() %>/findId.do">
		 <div class="content">
		     <div class="find_tab">
		     <div class="tab_title_selected" onclick="TabOpen('00')">아이디 찾기</div>
		     <div class="tab_title" onclick="TabOpen('01')">비밀번호 찾기</div>
		     </div>
		        
		 <ul class="form_list">
		 	<li>
		 		<label for="memberName" class="required">
		 		이름
		 		<em>*</em>
		 		</label>
		 		<div class="input_box">
		 		<input type="text" name="memberName" id="memberName" class="input_text" 
		 				maxlength="20">
		 		</div>
		 	</li>
		 	
		 	<li>
		 		<label for="memberPhone" class="required">
		 		휴대폰번호
		 		<em>*</em>
		 		</label>
		 		<div class="input_box">
		 		<select name="phone1" class="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
				</select>
				-
				<input type="text" name="phone2" class="phone" maxlength="4">
				-
				<input type="text" name="phone3" class="phone" maxlength="4">
		 		</div>
		 	</li>
		 </ul>       
		 </div>
		 
		 <div class="find_button">
		 <input type="submit" value="아이디 찾기" class="button">
		 </div>
		    
		 <br>
		 <br>
		 
		 <div class="login_link">
			<input type="button" value="로그인" class="button2"
				onclick="location.href='loginMain.do'">
			<input type="button" value="회원가입" class="button2"
				onclick="location='member/member_join.jsp'">				
		 </div>
		 </form>
		 
		 
	</div>
	
	
	<div id="tab01">
		 <form  method="post" id="findpwd_form" class="findpwd_form"
		            action="<%=request.getContextPath() %>/findPwd.do">
		 <div class="content">
		     <div class="find_tab">
		     <div class="tab_title" onclick="TabOpen('00')">아이디 찾기</div>
		     <div class="tab_title_selected" onclick="TabOpen('01')">비밀번호 찾기</div>
		     </div>
		        
		        
		 <ul class="form_list">
		 	<li>
		 		<label for="memberId" class="required">
		 		회원아이디
		 		<em>*</em>
		 		</label>
		 		<div class="input_box">
		 		<input type="text" name="memberId" id="memberId" class="input_text" 
		 				maxlength="20">
		 		</div>
		 	</li>
		 	
		 	<li>
		 		<label for="member_email" class="required">
		 		이메일주소
		 		<em>*</em>
		 		</label>
		 		<div class="input_box">
		 		<input type="text" name="member_email" id="member_email" class="input_text" 
		 				maxlength="30">
		 		</div>
		 	</li>
		</ul>   
		 </div>
		 
		 <div class="find_button">
		 <input type="submit" value="비밀번호 찾기" class="button">
		 </div>
		 
		 <br>
		 <br>
		    
		 <div class="login_link">
			<input type="button" value="메인으로" class="button2"
				onclick="location.href='main.do'">
			<input type="button" value="로그인" class="button2"
				onclick="location.href='loginMain.do'">				
		 </div>
		 
		 </form>
		 
		 
	</div>

</body>
</html>