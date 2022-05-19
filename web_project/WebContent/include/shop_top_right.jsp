<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <%
    
 // 쇼핑몰 우측 상단 장바구니 구현에 필요한 로직
 	CartDAO semiDao = CartDAO.getInstance();
 	HttpSession semiSession = request.getSession();
 	String id = (String)semiSession.getAttribute("member_id");
 	List<CartDTO> semeList = semiDao.getSemiCartList(id);
 	request.setAttribute("semiCartList", semeList);    
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
		z-index: 2;
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
	
	
	.semi_image > a > img {
		width: 100%;
		
	}
	
	
	
	.semiCart_container {
		display: flex;
		flex-direction: row;
		position: relative;
		
		
		border-bottom: 1px solid gray;
		text-align: cetner;
		font-size: 14px;
		height: 100px;
		
	}
	
	.semi_image {
		width: 100px;
		
	}
	
	
	.semi_name {
		font-size: 10px;

	}
	

	.semi_list {
		height: 80%;
		padding-top: 10px;
		padding-left: 10px;
		display: flex;
		flex-direction: column;
		width: 100%;
    	justify-content: space-between;
	}
	
	
	.semi_list > ul > li{
		width: 100%;
		list-style:none;
		display: table;
		
	}
	.semi_list > ul {
		
		dispaly: flex;
		flex-direction: row;
		justify-content: space-between;
		padding: 0;
		margin: 0;
	}
	
	
	.ulList {
		display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	}
	
	
	
	
	.sub_text {
		padding: 20px 0px 0px 0px;
		font-size: 0.9em;
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
		right: -640px;
		width: 620px;
		height: 100%;
		border-left: 1px solid black;
		z-index: 30;
		transition:.36s;
		background: white;
		display: flex;
		flex-direction: column;
		padding: 10px;
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
	

	.empty {
		text-align: center;
		padding-top: 200px;
	}
	.semiCart_wrapper {
		heigth: 500px;
		overflow:auto;	
		margin: 20px 15px;
		
	}
	
	.munubtn {
		cursor: pointer;
	}
	
	.topMenu_cart_btn:hover {
		text-decoration: underline;
		
	}
	
	.semiCart_name {
		font-weight: bold;
		
	}
	
	.SCQ {
		color: gray;
		font-size: 0.5em;
	}
	
	.pinfo {
		font-size: 0.8em;
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
	

	//20220516 semicart페이지에서 삭제하기 
	//문제: 개별 카트는 삭제가능하지만 총가격이 업데이트가안됨...
	function semicart_delete(num){
		
		$.ajax({
			url:"semiCart_delete.do",
			datatype:"jsp",
			data: {num:num},
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			success:function(data){
				console.log(data);
				let name = "semiCart_container"+data;
				$("."+name).remove();
				alert("삭제완료");
			},
			error:function(data){
				alert("통신오류");
			}
			
		});
		
	}
	
	
	
	$(document).ready(function() { /// Wait till page is loaded
		   $('.delete_btn').click(function(){
		      $('.semiCart_container').load('property-detailed.php .semiCart_container', function() {
		           /// can add another function here
		      });
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
				<label for="menuicon" class="munubtn topMenu_cart_btn"><img src="<%=request.getContextPath() %>/images/icon-bag.svg" width="12px"> 장바구니</label>
				
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
		<c:if test="${!empty list }">
		<div class="semiCart_wrapper">
		
		<c:forEach items="${list }" var="dto">
			<div class="semiCart_container">
			
				<div class="semi_image">
					<a href="<%=request.getContextPath() %>/product_detail.do?num=${dto.getPno_fk() }"><img alt="" src="<%=request.getContextPath()%>/upload/${dto.getCart_pimage() }"></a>
				</div>
			
				<div class="semi_list">
				
					<ul class="ulList">
						<li class="semiCart_name">
							${dto.getCart_pname() }
						</li>
						<li>
							&nbsp;
						</li>
						<li>
							&nbsp;
						</li>
						<li class="delete">
							<a class="delete_btn" onclick="if(confirm('해당 상품을 쇼핑백에서 삭제하시겠습니까?')){
											semicart_delete(${dto.getCart_no() });
										}
										else{ return; }" ><div class="delete_btn">X</div></a>
						</li>
					</ul>
					<ul class="ulList SCQ">
						<li>
							SIZE
						</li>
						<li>
							COLOR
						</li>
						<li>
							QTY
						</li>
						<li>
							&nbsp;
						</li>
						
					</ul>	
					
					<ul class="ulList pinfo">
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
						
		</div> <!-- semiCart_container -->
		</c:forEach>	
		
		
		</div> <!-- semiCart_wrapper -->
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
	
 	
	</div> <!-- semiCart_sidebar -->
	
	
	

</body>
</html>
			
				