<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
<%@page import="com.apc.model.ProductDAO"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.apc.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	ProductDTO dto = (ProductDTO)request.getAttribute("cont");

	ProductDAO dao = ProductDAO.getInstance();
	String[] arrImg = dao.getPorudctImg(dto);
	
	pageContext.setAttribute("arrImg", arrImg);
	
	CartDAO semeDao = CartDAO.getInstance();
	HttpSession semiSession = request.getSession();
	String id = (String)semiSession.getAttribute("member_id");
	List<CartDTO> semeList =  semeDao.getSemiCartList(id);
	request.setAttribute("semiCartList", semeList);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" > -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_products.css">
<script type="text/javascript">


	function go_cart(){
		
		let pname = document.getElementById("p_name").value;
		let pcolor = document.getElementById("p_color").value;
		let psize = document.getElementById("p_size").value;
		
		
		//form(name=frm)의 action경로 지정
		document.frm.action = "<%=request.getContextPath()%>/go_cart.do?name="+pname+"&color="+pcolor+"&size="+psize ;
	
		//form(frm)에 submit 메서드 호출해 데이터 전달
		document.frm.submit();
		
	}
	
	function go_nonPay(){
		
		
		let pname = document.getElementById("p_name").value;
		let pcolor = document.getElementById("p_color").value;
		let psize = document.getElementById("p_size").value;
		
		
		//form(name=frm)의 action경로 지정
		document.frm.action = "<%=request.getContextPath()%>/go_pay.do?name="+pname+"&color="+pcolor+"&size="+psize ;
	
		//form(frm)에 submit 메서드 호출해 데이터 전달
		document.frm.submit();
		
	}
	



</script>





<script type="text/javascript">



$(function(){

	let id = "<%=(String)session.getAttribute("member_id")%>" ;
	
	console.log(typeof(id));
	
	if( id == "null" ){
	
	
		$(".payBtn").on("click", function(){/* 로그인이 안된 경우, 레이어팝업 뜸  */
			$(".pay_popup").show();
			$(".pay_dim").show();
		});

		$(".pay_popup .popup_close").on("click", function(){
		$(this).parent().hide();
		$(".pay_dim").hide();
		
		}); 
	
	
}else{
	
	/* 로그인 되어 있는 경우 결제창으로 넘어감 */
		
		$(".payBtn").on("click", function(){
			
			let pname = $("#p_name").val();
			let pcolor = $("#p_color").val();
			let psize = $("#p_size").val();
			
			
			$("#frm").attr("action", "<%=request.getContextPath()%>/go_pay.do?name="+pname+"&color="+pcolor+"&size="+psize);
			$("#frm").submit();
			
			
		});

	
	
}
});

</script> 





<style type="text/css">

	.review_top{
		width:90%;
		border-bottom:1px solid #c0c0c0;
	}
	.review_box{
		width:90%;	
		display:none;
		border-bottom: 1px solid #c0c0c0;
	}
	
	#load{
		display:none;
	}
	
	#payBtn_css {
		width: 100px;
		height: 33px;
		background-color: black;
		font-size: 14px;
		font-weight: bold;
		text-align: center;
		border: 1px solid black;
		color: white;
	}
	
	#cartBtn_css {
		width: 100px;
		height: 33px;
		background-color: white;
		font-size: 14px;
		font-weight: bold;
		text-align: center;
		border: 1px solid black;
		color: black;
	}
	
	.category_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		
	}
	
	.product_section {
		min-height: 100vh;
		margin-bottom: 200px;
	}
	.product_section_aside {
		height: 500px;
		position: sticky;
		top: 0px;
	}
	
	.review_table{
	
		width: 90%;
		
	}
	
	.review_table tr{
		height: 55px;
	}
	
	.review_table td{
		padding: 10px;
	}
	
</style>
</head>
<body>

	<jsp:include page="/include/shop_top.jsp"/>
	<jsp:include page="/include/shop_top_right.jsp"/>
	
	<div class="category_wrapper">
	
	<input type="hidden" id="loginId" value="<%=session.getAttribute("member_id") %>" >
	
		<div class="page_title">
			<ul>
				<li class="page_title1">
					<a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a>
				</li>
			<c:if test="${first == 'WOMEN' }"> 
				<li class="page_title2">
					<a href="<%=request.getContextPath()%>/category.do?code=10000000">${first}</a>
				</li>
			</c:if>
			<c:if test="${first == 'MEN' }"> 
				<li class="page_title2">
					<a href="<%=request.getContextPath()%>/category.do?code=20000000">${first}</a>
				</li>
			</c:if>
			<c:if test="${first == 'GOLF' }"> 
				<li class="page_title2">
					<a href="<%=request.getContextPath()%>/category.do?code=30000000">${first}</a>
				</li>
				<c:if test="${second == 'ACC' }">
					<li class="page_title3">
						/ ${second} 
					</li>
				</c:if>
				<c:if test="${second != 'ACC' }">
					<li class="page_title3">
						/ <a href="<%=request.getContextPath()%>/2nd_category.do?code=${upperCode}">${second}</a>
					</li>
				</c:if>
			</c:if>
				<li class="page_title4">
					/  <a href="<%=request.getContextPath()%>/product_list.do?code=${categoryCode}"> ${third }</a>
				</li>
			</ul>
		</div><!-- class="page_title" -->
		
		
		
		<c:set var="dto" value="${cont }"/>
		
		
		<div class="product_section">
		
			<div class="product_section_aside">
				<hr width="90%">
			<form id="frm" name="frm" method="post">
				<input type="hidden" id="p_name" value="${dto.getPname() }">
				<input type="hidden" id="p_color" value="${dto.getPcolor()}">
		
				<table class="product_content">
					<tr>
						<th colspan="2">
						<span id="product_name">${dto.getPname() }</span>
						</th>
					</tr>
					<tr>
						<td colspan="2">
						<span id="product_cont">${dto.getPcontents() }</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<span id="product_price"><fmt:formatNumber value="${dto.getPrice() }"/>원 </span></span>
						</td>
					</tr>
					<tr>
						<td >색상</td>
						<td><span id="product_color" >${dto.getPcolor() }</span></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<ul class="colors">
								<c:if test="${empty colors }">
								칼라정보 없음
								</c:if>
								<c:if test="${! empty colors }">
								<%
									String [] colors = (String[])request.getAttribute("colors");		
									
									int num =0; 
									
									for(int i =0; i<colors.length ; i++){
								%>		
									<li>
									<a href="<%=request.getContextPath()%>/product_check.do?name=${dto.getPname() }&color=<%=colors[i]%>">
									<span><img src="<%=request.getContextPath() %>/images/<%=colors[i] %>.jpg"> </span>
									</a>
									</li>
								<% 		
									}
									
								%>
									
									
								</c:if>
							</ul>
						</td>
					</tr>
					<tr>
						<td>사이즈</td>
						<td>
							<select id="p_size" name="p_size">
								<c:if test="${empty sizes }">
								<option value="">:::없음:::</option>
								</c:if>
								<c:if test="${!empty sizes }">
								<c:forEach items="${sizes }" var="s">
									<option value="${s }">${s }</option>							
								</c:forEach>
								</c:if>
							
							</select>
						</td>
					</tr>
					<tr>
						<td>수량</td>
						<td><input type="number" name="p_qty" value="1"  min="1" max="${dto.getPqty() }"></td>
					</tr>
					<tr>
						<td>적립금</td>
						<td>
						
						<span id="mileage"><fmt:formatNumber value="${dto.getMileage() }"/>원 </span></td>
					</tr>
					<tr>
						<td colspan="2" class="extrainfo">SIZE GUIDE  </td>
						
					</tr>
					<tr>
						<td colspan="2" class="extrainfo" valign="top">무이자 할부 안내</td>
					</tr>
				
					<tr>
						<td colspan="2">
						
						<!-- <a href="#1" class="payBtn">바로구매</a>
						<a href="#a" class="cartBtn">장바구니</a> -->
						
							<input type="button" class="payBtn"  id="payBtn_css"  value="바로구매" >
							<input type="button" class="cartBtn" id="cartBtn_css" value="장바구니" onclick="go_cart()"></button>
						
						<!-- <input id="go_pay_btn"class="btn btn-dark" type="button" value="바로구매" onclick="go_pay()"> &nbsp;
						<input id="go_cart_btn" class="btn btn-light" type="button" value="장바구니" onclick="go_cart()"> -->
						</td>
					</tr>
			</table>
		</form>
		</div><!-- class="product_detail_aside" -->
		
		
		
		
		
		
		<!-- **************레이어 팝업창*********************              -->
		<div class="pay_popup">
			회원으로 주문하시면 더 많은 혜택이 제공됩니다. <br>
			로그인하시겠습니까?<br>
			<br>
			<input type="button" class="nonmember_btn" value="비회원주문하기" 
				onclick="go_nonPay()">
			<input type="button" class="login_btn" value="로그인하기" 
				onclick="location.href='member/LoginMain.jsp?pname=${dto.getPname()}&color=${dto.getPcolor() }&size=${dto.getPsize() }'">
			
			<%-- <input id="go_pay_btn"class="btn btn-dark" type="button" value="비회원주문하기" onclick="nonmember_order()">
			<input id="go_cart_btn" class="btn btn-light" type="button" value="로그인하기" 
			onclick="location.href=<%=request.getContextPath()%>"> --%>
			<a href="#" class="popup_close">닫기</a>
		
		</div><!-- class="pay_popup" -->
		<div class="pay_dim">
			
		</div>
		<!-- **************레이어 팝업창*********************              -->
		
		
		
		
		<div class="product_section_main">
			<div class="detail_image">
				<c:forEach items="${arrImg }" var="img">
				<img src="<%=request.getContextPath() %>/upload/${img}" width="50%" height="65%">
				</c:forEach>
			</div>
			<hr width="90%" align="center">
			<div class="product_review">
				<div class="review_detail">
				<c:set var="rlist" value="${rList }"/>
				<c:set var="rSum" value="${rlist.size()}"/>
				
				<div class="review_top">
				<span>REVIEW <B>(${rSum })</B></span>
				</div>
				
				
				<div class="review_content">
				<c:forEach items="${rlist }" var="dto">
				<div class="review_box">
					<table class="review_table" >
						<tr>
							<td>
								<c:choose>
								<c:when test="${dto.getReview_rate() == 5 }">
							 <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							</c:when>
								<c:when test="${dto.getReview_rate() == 4 }">
							 <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							</c:when>
								<c:when test="${dto.getReview_rate() == 3 }">
							 <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							</c:when>
								<c:when test="${dto.getReview_rate() == 2 }">
							 <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							</c:when>
								<c:when test="${dto.getReview_rate() == 1 }">
							 <i class="fas fa-star" style="color:#fd4"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							  <i class="fas fa-star" style="color:#e2e2e2"></i>
							</c:when>
								</c:choose>
							</td>
							<td>
								
								<font style="color:gray;">SIZE: ${dto.getPsize() } / COLOR: ${dto.getPcolor() }</font>
							</td>
							<td>${dto.getReview_date().substring(0,10) }</td>
							<td rowspan="2">${dto.getMemid_fk() }님 리뷰</td>
						</tr>
						<tr>
							<td colspan="3">
							${dto.getReview_cont() }
							</td>
						</tr>
						</table>
				</div><!-- class="review_box  -->
				</c:forEach>
				<a href="#" id="load">더 보기</a>
				</div><!-- class="review_content" -->
				
				</div><!--class="review_detail"  -->
			</div><!--class="product_review"  -->
		</div><!-- class="product_section_main" -->
	</div><!-- class="product_section" -->
	
	
	
	
	</div> <!-- class="category_wrapper" end-->
	
	<jsp:include page="../include/shop_bottom.jsp"/>

<script type="text/javascript">

$(function(){
    $(".review_box").slice(0, 3).show(); // 처음 3개를 보여주기
    
    let review_count = $(".review_box").length;
    
    if(review_count>3) {//리뷰가 3개이상인경우
    	$("#load").show(); // 더보기 버튼 보이기 
    	
  	  $("#load").click(function(e){ // 더보기 버튼 눌렀을 경우
        e.preventDefault();
        $(".review_box:hidden").slice(0, 3).show(); // 다음 리뷰 3개 더 보이기 
        if($(".review_box:hidden").length == 0){ // 숨겨진 리뷰가 0이 되면 알림창 띄우기
            alert("더 이상 리뷰가 존재하지 않습니다.");
        	$("#load").hide();
    
        }
        });
    
    }
});

</script>	

	
	
</body>
</html>