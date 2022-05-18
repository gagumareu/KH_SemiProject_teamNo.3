<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$(function() {
		
		$("#pwd_now").on("keyup", function(){
			
			if($.trim($("#pwd_now").val()) == $("#pwd").val()) {
				
				let OkTxt =
					'<font color="blue">비밀번호가 일치합니다.</font>';
				$("#pwd_now_check").text('');
				$("#pwd_now_check").show();
				$("#pwd_now_check").append(OkTxt);
				
			} else{
				
				let warningTxt =
					'<font color="red">비밀번호가 일치하지 않습니다.</font>';
				$("#pwd_now_check").text('');  
				$("#pwd_now_check").show();
				$("#pwd_now_check").append(warningTxt);
				$("#pwd_now_check").val('').focus();
				
			}
			
		});
		
		$("#pwd_new").on("keyup", function(){
			
			// 입력 길이 체크
			if($.trim($("#pwd_new").val()).length < 4) {
				
				let warningTxt =
					'<font color="red">비밀번호는 4자 이상이어야 합니다.</font>';
				$("#pwd_new_check").text('');  
				$("#pwd_new_check").show();    
				$("#pwd_new_check").append(warningTxt);
				$("#pwd_new_check").val('').focus();
				
			} else {
				
				let OkTxt =
					'<font color="blue">사용 가능한 비밀번호 입니다.</font>';
				$("#pwd_new_check").text('');
				$("#pwd_new_check").show();
				$("#pwd_new_check").append(OkTxt);

			}
			
		});
		
		$("#pwd_confirm").on("keyup", function(){
			
			// 입력 길이 체크
			if($.trim($("#pwd_confirm").val()) == $("#pwd_new").val()){
				
				let OkTxt =
					'<font color="blue">새 비밀번호와 일치합니다.</font>';
				$("#pwd_confirm_check").text('');
				$("#pwd_confirm_check").show();
				$("#pwd_confirm_check").append(OkTxt);
				
			} else {
				
				let warningTxt =
					'<font color="red">비밀번호가 일치하지 않습니다.</font>';
				$("#pwd_confirm_check").text('');  
				$("#pwd_confirm_check").show();
				$("#pwd_confirm_check").append(warningTxt);
				$("#pwd_confirm_check").val('').focus();

			}
			
		});
		
	});

</script>

	<style>
		
		a{
			text-decoration: none;
			color: black;
			font-family: 나눔고딕;
		}
		
		a.back:hover {
		cursor: pointer;
		}

		div{
			font-size: 12px;
			font-family: 나눔고딕;
		}
		
		
		div.left{
			width: 70%;
			float: left;
		}
		
		div.right{
			width: 30%;
			float: right;
			text-align: right;
			align: right;
		}
		
		input {
			width: 40%;
			height: 30px;
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
		.updatePwd_container {
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
		.updatePwd_wrapper {
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
		
		button {
			width: 130px;
			height: 40px;
			color: white;
			background-color: black;
		}
		
		button:hover {
			width: 130px;
			height: 40px;
			background-color: white;
			color: black;
		}
	</style>
</head>
<body>


    <jsp:include page="../include/shop_top.jsp"/>
	<jsp:include page="../include/shop_top_right.jsp"/>

	<div class="updatePwd_wrapper">
	
		<div class="header_title_nav">
			<a class="home_link" style="font-family: Arial;" href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a> 
			비밀번호관리
		</div>

	
	
		<div class="updatePwd_container">
	

			<div class="left_content">
				<nav>
				<jsp:include page="../include/leftLayout.jsp" />
				</nav>
			</div>
		
		
			<form class="right_content"  method="post" action="<%=request.getContextPath() %>/member_updatePwd_ok.do">
				<div><b>비밀번호변경</b></div>
				<hr width="100%">
				<div>
					<c:set var="mem" value="${memDTO }"/>
					<input type="hidden" name="id" id="id" value="${mem.getMem_id() }" >
					<input type="hidden" name="pwd" id="pwd" value="${mem.getMem_pwd() }" >
					<br>
					<span style="color: gray;">회원님의 개인정보 보호를 위해 비밀번호를 변경해 주십시오.</span>
					<br><br><br>
					<b>현재 비밀번호</b><br><br>
					<input type="password" name="pwd_now" id="pwd_now"/><br>
					 <span id="pwd_now_check"></span><br><br>
					<b>새 비밀번호</b><br><br>
					<input type="password" name="pwd_new" id="pwd_new"/><br>
					<span id="pwd_new_check"></span><br><br>
					<b>새 비밀번호 확인</b><br><br>
					<input type="password" name="pwd_confirm" id="pwd_confirm"/><br>
					<span id="pwd_confirm_check"></span><br><br>
					<hr>
				</div>
				
				<div class="left">
					<br>
					<a class="back" onclick="history.back()" style="font-size:12px">◀ 돌아가기</a>
				</div>
				<div class="right">
					<button><b>비밀번호 변경하기</b></button>
				</div>

			</form>
	
		</div>
	
	</div>
	
	<jsp:include page="../include/shop_bottom.jsp"/>
</body>
</html>