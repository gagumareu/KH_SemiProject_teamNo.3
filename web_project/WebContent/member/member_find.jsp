<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
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
		heigth: 100%;
	}
	
	.find_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		align-items: center;
		
	}
	
	.find_container {
		
		flex: 1;
		
		
	}
	
	.find_from {
		/*position: absolute;
		top: 35%;
		left: 43%;*/
		font-family: arial;
		width: 300px;
		padding-top: 200px;
		
	}
	#tab01 {
		display: none;
	}
	
	.find_tab {
		display: flex;
		flex-direction: row;
		justify-content: space-around;
		font-weight: bold;
		font-size: 14pt;
	}
	
	ul li {
		list-style: none;
	}
	
	.form_list {
		width: 100%;
		padding-left: 0;
		display: flex;
		flex-direction: column;
	}
	
	.required {
		font-size: 9pt;
		font-weight: bold;
	}
	
	.input_text {
		width: 293px;
		height: 30px;
	}
	
	.phone1 {
		width: 60px;
		height: 35px;
		text-align: center;
	}
	
	.phone {
		width: 60px;
		height: 30px;
		text-align: center;
	}
	
	.button {
		width: 100%;
		height: 36px;
		background-color: black;
		color: white;
		font-weight: bold;
	}
	
	.button2 {
		width: 146px;
		height: 36px;
		background-color: white;
		border: 1px solid black;
		font-weight: bold;
	}
	
	.tab_title_selected {
		text-align: center;
		width: 50%;
		padding-bottom: 10px;
		border-bottom: 4px solid black;
		
	}
	
	.tab_title {
		text-align: center;
		width: 50%;
		padding-bottom: 10px;
		border-bottom: 2px solid black;
	}
	
	
	/************************************/	
	
	.apcTitle{
		margin-top: 50px;
		font-size: 63px;
		margin-left: 15px;
		font-weight: bold;
		width: 100%;
	}
	
	.apcTitle > a{
		color: black;
		text-decoration: none;
	}
	
	.apcTitle > a:hover{
		color: white;
		text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
	}
	.col > a > img{
		width:100%;
	}
	
	/**************************/	
	
	
	
</style>
</head>
<body>


	 <jsp:include page="../include/shop_top.jsp"/>
	 <jsp:include page="../include/shop_top_right.jsp"/>
	
	<div class="find_wrapper">
	
		<div class="apcTitle">
			<a href="<%=request.getContextPath() %>/index.jsp">A.P.C.
			</a> LOG IN
		</div>
	
	
		<div class="find_container">
		
			<div class="find_from">
				<div id="tab00">
					 <form  method="post" id="findId_form" class="find_form"
					            action="<%=request.getContextPath() %>/findId.do">
					 <div class="content">
					     <div class="find_tab">
					     <div class="tab_title_selected" onclick="TabOpen('00')">아이디 찾기</div>
					     <div class="tab_title" onclick="TabOpen('01')">비밀번호 찾기</div>
					     </div>
					     <br>
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
					 	<br>
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
					 <br>
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
					 <form  method="post" id="findpwd_form" class="find_form"
					            action="<%=request.getContextPath() %>/findPwd.do">
					 <div class="content">
					     <div class="find_tab">
					     <div class="tab_title" onclick="TabOpen('00')">아이디 찾기</div>
					     <div class="tab_title_selected" onclick="TabOpen('01')">비밀번호 찾기</div>
					     </div>
					     <br>  
					        
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
					 	<br>
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
					 <br>
					 <div class="find_button">
					 <input type="submit" value="비밀번호 찾기" class="button">
					 </div>
					 
					 <br>
					 <br>
					    
					 <div class="login_link">
						<input type="button" value="메인으로" class="button2"
							onclick="location.href='<%=request.getContextPath()%>/main.do'">
						<input type="button" value="로그인" class="button2"
							onclick="location.href='loginMain.do'">				
					 </div>
					 
					 </form>
				</div> <!-- tab01 -->
			
			
			
			 </div> <!-- find_from end -->
			 
			 
			 
		</div> <!-- find_container end -->
	
	
	

	
	</div> <!-- find_wrapper end -->
		 <jsp:include page="../include/shop_bottom.jsp"/>
	
	
	
</body>
</html>