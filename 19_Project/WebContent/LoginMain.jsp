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
		text-align: center;
		font-family: arial;
	}
	
	#tab01 {
		display: none;
	}
	

</style>
</head>
<body>

	<h1>A.P.C LOG IN</h1>

	 <!-- member login form : Start -->
		            <div id="tab00">
		            <form  method="post" id="login_Form" class="login_form"
		            		action="<%=request.getContextPath() %>/memberLogin.do">
		                    <div class="content">
		                        <div class="login_title_tab">
		                            <div class="tab_title_selected" onclick="TabOpen('00')">회원로그인</div>
		                            <div class="tab_title" onclick="TabOpen('01')">비회원 주문확인</div>
		                        </div>
		                        <div class="login-tab-bottom-line"></div>
		
		                 
		                        <ul class="form-list">
		                            <li>
		                                <label for="member_id" class="required"><em>*</em>회원아이디</label>
		                                <div class="input-box">
		                                    <input type="text" name="member_id" id="member_id" class="input_text"/>
		                                </div>
		                            </li>
		                            <li>
		                                <label for="member_pwd" class="required"><em>*</em>비밀번호</label>
		                                <div class="input-box">
		                                    <input type="password" name="member_pwd" id="member_pwd" class="input_text"/>
		                                </div>
		                            </li>	                            
		                        </ul>
		                    </div>
		                    <div class="login_button">
		                        <button type="submit" class="button" title="로그인"><span>로그인</span></button>
		                    </div>
		                    
		                    <br>
		                    <br>
		                    <div class="login_link">
								<a href="find.do">아이디/비밀번호 찾기</a>
								<a href="<%=request.getContextPath() %>/semiJoin.do">회원가입</a>
							</div>
         
		       			</form>
		            </div>
		            <!-- member login form : End -->
		            
		            <!-- order login form : Start -->
		            <div id="tab01">
		            <form action="" method="post" name="order_form" id="order_form">
		                    <div class="content fieldset">
		                        <div class="login-title-tab">
		                            <div class="tab_title" onclick="TabOpen('00');">회원로그인</div>
		                            <div class="tab_title_selected" onclick="TabOpen('01');">비회원 주문확인</div>
		                        </div>
		                        <div class="login-tab-bottom-line"></div>
		
		                        <p class="form-instructions"></p>
		                        <ul class="form-list">
		                            <li>
		                                <label for="CustomerName" class="required"><em>*</em>주문하신 분</label>
		                                <div class="input-box">
		                                    <input type="text" name="orderName" id="orderName"  value="" title="주문하신 분" />
		                                </div>
		                            </li>
		                            <li>
		                                <label for="ordernumber" class="required"><em>*</em>주문번호</label>
		                                <div class="input-box">
		                                    <input type="text" name="orderNum" id="orderNum" title="주문번호" />
		                                </div>
		                            </li>
		                        </ul>
		                    </div>
		                    <div class="buttons-set">
		                        <button type="button" class="button" title="주문조회" onclick='lfn_order();'><span><span>주문조회</span></span></button>
		                    </div>
		                    <br>
		                    <br>
		                    <div class="buttons-set">
		                        <a href="join.do" class="button" title="회원가입"><span><span>회원가입</span></span></a>
		                    </div>
		            </form>
		            </div>
		            <!-- order login form : End -->
		

</body>
</html>