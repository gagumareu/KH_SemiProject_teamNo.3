<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <%
    
    String member_id = (String)session.getAttribute("member_id");
    
    %>
    
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
	
	.right_menu_ul {
		padding: 0;
		list-style:none;
	}
	/********** right side end **********/
	
	#mypage {
		display:none;
	}
	

	/****************************************************/
	
	.semiCart_btn {
		font-weight: bold;
		padding: 20px 0px;
		text-align: center;
		
	}
	
	.semiCart_btn a {
		text-decoration: none;
	}
	.cart_btn {
		background-color: black;
		color: white;
		width: 100%;
		height: 40px;
		margin-bottom: 30px;
		cursor: pointer;
	}
	
	.cart_btn:hover {
		background-color: white;
		border: 1px solid black;
		color: black;
	
	}
	
	.cart_btn div {
		padding-top: 10px;
	}

	.close_btn {
		padding: 20xp 0px;
		cursor: pointer;
	
	}


	
	.semiCart_container {
		display: flex;
		flex-direction: column;
		height: 500px;
	}
	
	
	.semi_image > a > img {
		width: 100%;
		
	}
	
	
	
	.semiCart_container {
		display: grid;
		grid-template-columns: 15% 15% 70%; 
	
		border-bottom: 1px solid gray;
		text-align: cetner;
		font-size: 14px;
		height: 100px;
	}
	
	.semi_image {
		width: 70px;
		grid-column: 1;
		
	}
	.semi_image > a > img {
		width: 100%;
	}
	
	.semi_name {
		grid-column: 2;
		font-size: 10px;

	}
	
	.semi_Name_text {
		padding-top: 20px;
	
	}
	.semi_list {
		display: grid
		
	}
	
	.semi_price {
		grid-column: 4;
		padding-top: 35px;
	}
	
	.semi_list > ul > li{
		width: 100%;
		list-style:none;
		display: flex;
		flex-direction: row;
		
	}
	.semi_list > ul {
		display: flex;
		flex-direction: row;
	}
	
	.semiCart_price {
		grid-column: 3;
	}
	
	.ulList {
		display: flex;
		flex-direction: row;
		padding-top: 18px;
	}
	.sub_text {
		padding: 20px 0px 0px 0px;
		font-size: 0.8em;
		font-weight: 600;
	
		
	
	}
	
	.totalPrice {
		padding: 14px 0px 0px 0px;
		font-weight: bold;
		display: flex;
		justify-content: space-between;
	}
	
	#close_btn {
		margin-top: 20px;
		margin-right: 25px;
		display: flex;
		justify-content: end;
	}
	
	.delete {
		align-content: end;
		display: flex;
		justify-content: center;
	}
	
	.delete a {
		cursor: pointer;
		text-decoration: none;
	}
	
	/****************************************************/
	
	input[id="semiCart"] {
		/*display: none;*/
	}
	
	
	.semiCart_sidebar {
		position: fixed;
		top: 0;
		right: -500px;
		width: 500px;
		height: 100%;
		border-left: 1px solid black;
		z-index: 30;
		transition:.36s;
		background: white;
		display: flex;
		flex-direction: column;
	}
	
	
	
	.right_menu {
		position:relative;
	}
	
	input[id='menuicon']:checked ~ .semiCart_sidebar {
		right: 0;
	}
	
	
	#menuicon {
		display: none;
	}
	
	.empty_semiCart {
	}
	
	.empty {
		text-align: center;
	
	}
	.semiCart_wrapper {
		
		margin: 20px 15px;
		
	}
	
	.munubtn {
		cursor: pointer;
	}
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">



	//20220511 이슬추가
	$(function(){
		
		let id = "<%=(String)session.getAttribute("member_id")%>";
		
		if(id != "null"){
			$("#login").hide();
			$("#mypage").show();	
		}
		
	});
	
	$(function(){
		$('.continue_btn').click(function(){
			$(location).attr("href", "<%=request.getContextPath() %>/cart_main.do");
		});
			
	});
	


	
</script>
</head>
<body>

	<input type="checkbox" id="menuicon">
	
	<c:set var="list" value="${semiCartList }"/>
	
	<div id="right_menu">
		<ul class="right_menu_ul">
			<li class="cart">
				<label for="menuicon" class="munubtn close"><img src="images/icon-bag.svg" width="12px"> 장바구니</label>
				
			</li>
			<li id="login"><a href="<%=request.getContextPath() %>/member/LoginMain.jsp">내계정/로그인</a></li>
			<li id="mypage"><a href="<%=request.getContextPath() %>/member_myPage.do?id=<%=session.getAttribute("member_id")%>">마이페이지</a></li>
			<li>&nbsp;</li>
			<li><a href="#">South Korea</a></li>
			<li><a href="#">뉴스레터</a></li>
			<li><a href="<%=request.getContextPath() %>/qa_list.do">고객센터</a></li>
			<li><a href="#">매장찾기</a></li>
			<li>&nbsp;</li>
			<li><a href="#">아이디룩몰</a></li>
		
		</ul>
		
		
		
	</div>	<!--  right_menu end  -->
	
	
	
	
	
	
	<div class="semiCart_sidebar">
	
		<div id="close_btn"><label for="menuicon" class="munubtn close_btn" ><b>X Close</b></label></div>
		
		<div class="semiCart_wrapper">
		<c:if test="${!empty list }">
		<c:forEach items="${list }" var="dto">
		
			<div class="semiCart_container">
			
			<div class="semi_image">
			<a href="<%=request.getContextPath() %>/product_detail.do?num=${dto.getPno_fk() }"><img alt="" src="<%=request.getContextPath()%>/upload/${dto.getCart_pimage() }"></a>
			</div>
			
			<div class="semi_Name">	
				<div class="semi_Name_text">${dto.getCart_pname() }</div>
			</div>
			
			<div class="semi_list">
			
				<ul class="ulList">
					<li>
						SIZE
					</li>
					<li>
						COLOR
					</li>
					<li>
						QTY
					</li>
					<li class="delete">
						<a onclick="if(confirm('해당 상품을 쇼핑백에서 삭제하시겠습니까?')){
									location.href='<%=request.getContextPath() %>/semiCart_delete.do?num=${dto.getCart_no() }'}
									else{ return; }" ><div class="delete_btn">X</div></a>
						
					</li>
				</ul>	
				
				<ul class="ulList">
					<li class="semi_right_side">
						${dto.getCart_psize() }	
					</li>
					<li class="semi_right_side">
						${dto.getCart_pcolor() }
					</li>
					<li class="semi_right_side">
						${dto.getCart_pqty() }
					</li>
					<li class="semi_right_side">
						<fmt:formatNumber value="${dto.getCart_price()*dto.getCart_pqty() }" />원
					</li>				
				</ul>
			</div>	
			
			<div class="semi_price">
			
			</div>
					
					
					
		</div> <!-- semiCart_container -->
		</c:forEach>
			
		
		<div class="sub_text">
			A.P.C.KOREA 온라인 스토어는 무료배송 서비스를 제공합니다.(제주, 도서산간 지역도 무료)
		</div>
		
		<c:set var="total" value="0"/>
		<c:forEach items="${list }" var="sum">
		<c:set var="total" value="${total+sum.getCart_price()*sum.getCart_pqty() }"/>
		</c:forEach>
		
		<div class="totalPrice">
			<div>TOTAL PRICE</div> <div><fmt:formatNumber value="${total }"/>원</div>
		</div>
		
		<div class="semiCart_btn">
			<a href="<%=request.getContextPath()%>/cart_main.do"><div class="cart_btn"><div>장바구니</div></div></a>
			
			<div class="close_btn close_btn"><label for="menuicon" class="munubtn close_btn" >쇼핑계속</label></div>
		</div>

 	 </c:if>
	<c:if test="${empty list }">
		<div class="empty_semiCart">
		<p class="empty">장바구니가 비었습니다.</p>
		</div>
	</c:if>
 	</div>
	</div> <!-- semiCart_sidebar -->
	
	
	

</body>
</html>