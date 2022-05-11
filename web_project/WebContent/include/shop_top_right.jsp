<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#right_menu{
	margin-top: 10px;
	width: 100px;
	position: absolute;
	right: 0px;
	top: 0px;
	
	}
	
	#right_menu>ul{
	display:flex;
	flex-direction:column;
	font-size: 12px;
	}
	
	
	#right_menu ul> li > a{
	text-decoration: none;
	color: black;
	}
	
	#right_menu >ul > li > a:hover{
	text-decoration: underline;
	}
	
	.hello:hover{
	text-decoration: underline;
	}
	
	/********** right side end **********/
	
	#mypage {
		display:none;
	}

</style>

<script type="text/javascript">

	$(function (){
		$('.cart').click(function(){
			window.open('<%=request.getContextPath()%>/product/cart.jsp', '_blank', 'width="200"');
		});
	});

	//20220511 이슬추가
	$(function(){
		
		let id = "<%=(String)session.getAttribute("member_id")%>";
		
		if(id != "null"){
			$("#login").hide();
			$("#mypage").show();
		}
		
	});
	
</script>
</head>
<body>


	<div id="right_menu">
		<ul>
			<li class="cart"><a href="<%=request.getContextPath()%>/#"><img src="images/icon-bag.svg" width="12px"> 장바구니</a></li>
			<li id="login"><a href="<%=request.getContextPath() %>/member/LoginMain.jsp">내계정/로그인</a></li>
			<li id="mypage"><a href="<%=request.getContextPath() %>/member/mypage.jsp">마이페이지</a></li>
			<li>&nbsp;</li>
			<li><a href="#">South Korea</a></li>
			<li><a href="#">뉴스레터</a></li>
			<li><a href="<%=request.getContextPath() %>/qa_list.do">고객센터</a></li>
			<li><a href="#">매장찾기</a></li>
			<li>&nbsp;</li>
			<li><a href="#">아이디룩몰</a></li>
		
		</ul>
	</div>	<!--  right_menu end  -->
	
	
	
	

</body>
</html>