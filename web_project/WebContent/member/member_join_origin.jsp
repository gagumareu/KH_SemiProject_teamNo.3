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
<script type="text/javascript" src="js/member.js"></script>

<script type="text/javascript">
		$(function () {
			
			$("#userpwd2").keyup(function () {
				
				let pwd1 = $("#userpwd").val();
				let pwd2 = $("#userpwd2").val();
				
				if(pwd1 != pwd2) {
					let warningTxt =
					'<font color="red">비밀번호가 일치하지 않습니다.</font>';
					
					$("#pwdcheck").text('');   
					$("#pwdcheck").show();     
					$("#pwdcheck").append(warningTxt);
					return false;
				}else {
					
					$("#pwdcheck").text('');   
					return false;
					
				}
					
				
			});
			
		});
		
		
</script>
<style type="text/css">
	body {
		font-family: arial;
	}
	
	
	.content {
		width: 45%;
	}
	
	
	.field {
		display: flex;
		flex-direction: row;
		padding-top: 20px;
	}
	
	.text {
		width: 20%;
		padding-top: 5px;
	}
	
	.text1 {
		width: 20%;
	}
	
	.label {
		font-size: 9pt;
	}
	
	em {
		font-size: 8pt;
	}
	
	.checkbutton {
		padding-left: 20%;
	}
	
	.input {
		width: 80%;
	}
	
	.input1 {
		width: 68%;
	}
	
	.input_box {
		width: 100%;
		height: 30px;
		font-size: 10pt;
	}
	
	.select1 {
		width: 80px;
		height: 35px;
		text-align: center;
	}
	
	.select {
		width: 65px;
		height: 35px;
		text-align: center;
	}
	
	.phone {
	
		width: 65px;
		height: 30px;
		text-align: center;
	}
	
	.phone1 {
	
		width: 65px;
		height: 35px;
		text-align: center;
	}
	
	#idcheck_btn {
		width: 100%;
		height: 35px;
		margin-left: 10px;
		background-color: black;
		color: white;
		font-weight: bold;
	}
	
	ul li {
		list-style: none;
	}
	
	.description {
		font-size: 9pt;
	}
	
	.mail_button {
		margin-left: 20%;
	}
	
	.join_button {
		margin-left: 20%;
		width: 80%;
		height: 35px;
		font-weight: bold;
		background-color: black;
		color: white;
	}
	
	a {
		text-decoration: none;
		font-weight: bold;
		color: black;
		padding-left: 0;
		margin-left: 20%;
	}
	
	
	
</style>
</head>
<body>

	<h1>A.P.C MEMBER JOIN</h1>
	
	<div class="content">
	
	<form method="post" action="<%=request.getContextPath() %>/member_join_ok.do">
	<p class="instruction">회원 가입에 필요한 정보를 입력해 주세요</p>
	
	
	<ul class="form_list">
		<li class="field">
			<div class="text">
			<label for="username" class="label">이름</label>
			<em>*</em>
			</div>
			<div class="input">
			<input type="text" id="username" name="username" class="input_box" maxlength="10">
			</div>
		</li>	
		
		<li class="field">
			<div class="text">
			<label for="userId" class="label">아이디</label>
			<em>*</em>
			</div>
			<div class="input1">
			<input type="text" id="userId" name="userId" class="input_box" maxlength="15">
			</div>
			<div class="idcheck_btn">
			<input type="button" value="중복체크" id="idcheck_btn">
			</div>
			
		</li>	
			<div class="checkbutton">
			<span id="idcheck"></span>
			</div>
		
		<li class="field">
			<div class="text">
			<label for="userpwd" class="label">비밀번호</label>
			<em>*</em>
			</div>
			<div class="input">
			<input type="password" id="userpwd" name="userpwd" class="input_box" maxlength="15">
			</div>
		</li>	
		
		<li class="field">
			<div class="text">
			<label for="userpwd2" class="label">비밀번호확인</label>
			<em>*</em>
			</div>
			<div class="input">
			<input type="password" id="userpwd2" name="userpwd2" class="input_box" maxlength="15">
			</div>
		</li>
			
		<div class="checkbutton">
		<span id="pwdcheck"></span>
		</div>
		
		<li class="field">
			<div class="text">
			<label for="user_birth" class="label">생년월일</label>
			<em>*</em>
			</div>
			<div class="input">
			<select name="user_birth1" id="user_birth1" class="select1">
			<option value="2017">2017</option>
			<option value="2017">2016</option>
			<option value="2017">2015</option>
			<option value="2017">2014</option>
			<option value="2017">2013</option>
			<option value="2017">2012</option>
			<option value="2017">2011</option>
			<option value="2017">2010</option>
			<option value="2017">2009</option>
			<option value="2017">2008</option>
			<option value="2017">2007</option>
			<option value="2017">2006</option>
			<option value="2017">2005</option>
			<option value="2017">2004</option>
			<option value="2017">2003</option>
			<option value="2017">2002</option>
			<option value="2017">2001</option>
			<option value="2017">2000</option>
			<option value="2017">1999</option>
			<option value="2017">1998</option>
			<option value="2017">1997</option>
			<option value="2017">1996</option>
			<option value="2017">1995</option>
			<option value="2017">1994</option>
			<option value="2017">1993</option>
			<option value="2017">1992</option>
			<option value="2017">1991</option>
			<option value="2017">1990</option>
			<option value="2017">1989</option>
			<option value="2017">1988</option>
			<option value="2017">1987</option>
			<option value="2017">1986</option>
			<option value="2017">1985</option>
			<option value="2017">1984</option>
			<option value="2017">1983</option>
			<option value="2017">1982</option>
			<option value="2017">1981</option>
			<option value="2017">1980</option>
			<option value="2017">1979</option>
			<option value="2017">1978</option>
			<option value="2017">1977</option>
			<option value="2017">1976</option>
			<option value="2017">1975</option>
			<option value="2017">1974</option>
			<option value="2017">1973</option>
			<option value="2017">1972</option>
			<option value="2017">1971</option>
			<option value="2017">1970</option>
			</select>년
			
			<select name="user_birth2" id="user_birth2" class="select">
			<option value="01">01</option>
			<option value="02">02</option>
			<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			</select>월
			
			<select name="user_birth3" id="user_birth3" class="select">
			<option value="01">01</option>
			<option value="01">02</option>
			<option value="01">03</option>
			<option value="01">04</option>
			<option value="01">05</option>
			<option value="01">06</option>
			<option value="01">07</option>
			<option value="01">08</option>
			<option value="01">09</option>
			<option value="01">10</option>
			<option value="01">11</option>
			<option value="01">12</option>
			<option value="01">13</option>
			<option value="01">14</option>
			<option value="01">15</option>
			<option value="01">16</option>
			<option value="01">17</option>
			<option value="01">18</option>
			<option value="01">19</option>
			<option value="01">20</option>
			<option value="01">21</option>
			<option value="01">22</option>
			<option value="01">23</option>
			<option value="01">24</option>
			<option value="01">25</option>
			<option value="01">26</option>
			<option value="01">27</option>
			<option value="01">28</option>
			<option value="01">29</option>
			<option value="01">30</option>
			<option value="01">31</option>
			</select>일
			</div>
		</li>	
		
		<li class="field">
			<div class="text">
			<label for="user_email" class="label">이메일</label>
			<em>*</em>
			</div>
			<div class="input">
			<input type="text" id="user_email" name="user_email" class="input_box" maxlength="30">
			</div>
		</li>
		
		<li class="field">
			<div class="text">
			<label for="user_phone" class="label">휴대폰번호</label>
			<em>*</em>
			</div>
			<div class="input">
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
		
		<li class="field">
			<div class="text">
			<label for="user_addr" class="label">주소</label>
			<em>*</em>
			</div>
			<div class="input">
			<input type="text" id="user_addr" name="user_addr" class="input_box" maxlength="30">
			</div>
		</li>
		
		<br>
		<hr>
		<br>
		
		<li class="field">
		<div class="text1">
		<label class="label">
		마케팅정보<br>
		수신동의
		</label>
		</div>
		<div class="description">
		A.P.C몰에서 제공되는 서비스에 대한 수신동의 여부를 확인해주세요. 수신 미동의 시 이벤트 및 할인, 인기/신상품 등의 정보를 받아보실 수 없습니다.
		</div>
		</li>
		
		<br>
		
		<div class="mail_button">
		<input type="checkbox" name="email_yn" checked>메일수신
		<input type="checkbox" name=" phone_yn" checked>SMS수신
		</div>
		
		<br>
		
		<div>
		<br>
		<input type="submit" value="회원정보등록" class="join_button">
		
		<p class="back_link">
		<a href="<%=request.getContextPath()%>/loginMain.do">◀돌아가기</a>
		</p>
		</div>
	
	
	</ul>
	
	</form>
	</div>


</body>
</html>