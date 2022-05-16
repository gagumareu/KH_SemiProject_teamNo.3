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
	html, body {
	
		margin: 0px;
	}
	.login_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		align-items: center;
		
	}
	
	
	/*
	.login_container {
		position: absolute;
		top: 35%;
		left: 43%;
		font-family: arial;
		width: 300px;
		
	
	}
	*/
	
	.login_container {
		width: 300px;
		padding-top: 200px;
		
	
	}
	
	.login_content {
		display: flex;
		line-height: 1.7em;
	}
	
	.login_title_tab {
		display: flex;
		flex-direction: row;
		justify-content: space-around;
		font-weight: bold;
		font-size: 14pt;
	}
	
	#tab01 {
		display: none;
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
	
	.input_text {
		width: 293px;
		height: 30px;
	}
	
	.required {
		font-size: 9pt;
		font-weight: bold;
	}
	
	.button {
		width: 100%;
		height: 36px;
		background-color: black;
		color: white;
		font-weight: bold;
	}
	
	.login_tab_bottom_line {
		width: 100%;
		height: 5px;
	}
	
	.login_link {
		display: flex;
		flex-direction: row;
		justify-content: space-around;
	}
	
	.login_link a {
		text-decoration: none;
		font-size: 10pt;
		color: black;
		font-weight: bold;
	
	}
	/*a {
		text-decoration: none;
		font-size: 10pt;
		color: black;
		font-weight: bold;
	}*/
	
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


	 <!-- member login form : Start -->
	 
	 <jsp:include page="../include/shop_top.jsp"/>
	 <jsp:include page="../include/shop_top_right.jsp"/>
	 	
	 	
	 <div class="login_wrapper">
	 	
	 	
	 	
	 	<div class="apcTitle">
			<a href="<%=request.getContextPath() %>/index.jsp">A.P.C.
			</a> LOG IN
		</div>
	 	
	 		<div class="login_container">
	 		
	 		 <div class="login_content">
	            <div id="tab00">
	            <form  method="post" id="login_Form" class="login_form"
	            		action="<%=request.getContextPath() %>/memberLogin.do">
	                <div class="content">
	                    <div class="login_title_tab">
	                        <div class="tab_title_selected" onclick="TabOpen('00')">회원로그인</div>
	                        <div class="tab_title" onclick="TabOpen('01')">비회원 주문확인</div>
	                    </div>
	                    <div class="login_tab_bottom_line"></div>
	
	             		<br>
	                    <ul class="form_list">
	                        <li>
	                            <label for="member_id" class="required">회원아이디<em>*</em></label>
	                            <div class="input_box">
	                                <input type="text" name="member_id" id="member_id" class="input_text"/>
	                            </div>
	                        </li>
	                        <li>
	                            <label for="member_pwd" class="required">비밀번호<em>*</em></label>
	                            <div class="input_box">
	                                <input type="password" name="member_pwd" id="member_pwd" class="input_text"/>
	                            </div>
	                        </li>	                            
	                    </ul>
	                </div>
	                    <br>
	                    <div class="login_button">
	                        <button type="submit" class="button" title="로그인"><span>로그인</span></button>
	                    </div>
	                    
	                    <br>
	                    <br>
	                    <div class="login_link">
	                    	<div>
							<a href="<%=request.getContextPath() %>/find.do">아이디/비밀번호 찾기</a>
							</div>
							<div>
							<a href="<%=request.getContextPath() %>/semiJoin.do">회원가입</a>
							</div>
						</div>
        				
	       			</form>
	            </div>
	            <!-- member login form : End -->
	            
	            <!-- order login form : Start -->
	            <div id="tab01" >
	            <form action="" method="post" name="order_form" id="order_form">
	                    <div class="content fieldset">
	                        <div class="login_title_tab">
	                            <div class="tab_title" onclick="TabOpen('00');">회원로그인</div>
	                            <div class="tab_title_selected" onclick="TabOpen('01');">비회원 주문확인</div>
	                        </div>
	                        <div class="login_tab_bottom_line"></div>
	
	                       	<br>
	                       
	                        <ul class="form_list">
	                            <li>
	                                <label for="CustomerName" class="required">주문하신 분<em>*</em></label>
	                                <div class="input_box">
	                                    <input type="text" name="orderName" id="orderName"  value="" class="input_text" />
	                                </div>
	                            </li>
	                            <li>
	                                <label for="ordernumber" class="required">주문번호<em>*</em></label>
	                                <div class="input_box">
	                                    <input type="text" name="orderNum" id="orderNum" class="input_text" />
	                                </div>
	                            </li>
	                        </ul>
	                    </div>
	                    <br>
	                    <div class="buttons-set">
	                        <button type="button" class="button" title="주문조회" onclick='lfn_order();'><span><span>주문조회</span></span></button>
	                    </div>
	                    <br>
	                    <br>
	                    <div class="buttons-set">
	                        <input type="button" class="button" value="회원가입">
	                    </div>
	            </form>
	            </div>
	            <!-- order login form : End -->
	            </div>
		     </div> <!-- login_container end -->      
		 
	</div> <!-- wrapper end -->
	
	<jsp:include page="../include/shop_bottom.jsp"/>
	
	
	
</body>
</html>