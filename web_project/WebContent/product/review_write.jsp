<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> 부트스트랩 아이콘 cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<style type="text/css">

	.review_top {
		background-color: black;
		height:50px;
		color:white;
		opacity: 90%
	}
	
	.review_top span{
	}
	
	.review_product_info {
		margin-top: 10px;
		padding:5px;
	}
	
	.review_product_info td{
		line-height: 1.5;
	}
	
	
	.review_product_info img{
		margin-left:20px;
	}
	
	.sub_info{
		color:#808080;
		font-size:0.8em;
	}
	
	.review_area h4{
	
		margin-bottom:5px;
	}
	.review_uploadFile{
		margin-top:5px;
	}
	
	.review_bottom{
		margin-top:40px;
	}
	
	#submit_btn{
	
		width: 100px;
    	height: 30px;
  	  border-radius: 0px;
 	   background-color: black;
  	  color: white;
 	   font-size: 0.8em;
	}
	
	#cancel_btn{
	
		width: 100px;
    	height: 30px;
  	  border-radius: 0px;
 	   background-color: white;
  	  color: black;
 	   font-size: 0.8em;
	}
	/*     ****************  별점주기   ***************   */
	.star_container{
	
		background:#111;
		padding: 20px 30px;
		border:1px solid #444;
		
		display:flex;
		align-items: center;
		justify-content: center;
		flex-direction:column;
	}

	.star_container .star-widget input{
		display: none;
	
	}
	
	.star-widget label{
  	font-size: 40px;
 	 color: #444;
 	 padding: 10px;
 	 float: right;
 	 transition: all 0.2s ease;
	}
	input:not(:checked) ~ label:hover,
	input:not(:checked) ~ label:hover ~ label{
 		 color: #fd4;
	}
	
	input:checked ~ label{
	
		color:#fd4;
	}
	input#rate-5:checked ~ label{
	
		color:#fe7;
		text-shadow: :0 0 20px #952;
	}
	
	#rate-1:checked ~ div header:before{
  content: "I just hate it ";
}
#rate-2:checked ~ div header:before{
  content: "I don't like it ";
}
#rate-3:checked ~ div header:before{
  content: "It is awesome ";
}
#rate-4:checked ~ div header:before{
  content: "I just like it ";
}
#rate-5:checked ~ div header:before{
  content: "I just love it ";
}
	
	.rating_word header {
		width: 100%;
		font-size: 0.9em;
		color:#fe7;
		font-weight: 500;
		margin: 5px 0 20px 0;
		text-align:  center;
		transition: all 0.2s ease;
	}

</style>
</head>
<body>

	<!-- 로그인상태 리뷰쓰기이기때문에 로그인정보 필요 -->
	<div class="review_container">
		<div class="review_top" align="center">
			<h3>REVIEW</h3>
		</div>
		<c:if test="${empty cont }">
		내용없음
		</c:if>
		
		<form method="post" enctype = "multipart/form-data" id="frm"
			action="<%=request.getContextPath()%>/review_write_ok.do?no=${cont.getOrder_no()}&id=${cont.getOrder_id()}"> <!-- &id=로그인아이디 -->
		<input type="hidden" id="p_num" value="${cont.getPno_fk() }">
		<input type="hidden" name="order_num" value="${cont.getOrder_no() }">
		<c:if test="${!empty cont }">
		<div class="review_product_info">
			<table>
				<tr>
					<td width="30%"><img src="<%=request.getContextPath()%>/upload${cont.getPay_pimage()}" width="60%" height="60%"></td>
					<td width="70%">
					<span class="sub_info">A.P.C. KOREA</span><br>
					${cont.getPname() }<br>
					<span class="sub_info">칼라: ${product.getPcolor() } / 사이즈: ${product.getPsize() }</span>
					</td>
				</tr>
			</table>
			<hr width="98%" color="black" >
		</div><!-- class="review_product_info" -->
		</c:if>
		<div class="review_content">
			<div class="review_rating">
				<div class="star_container">
				<div class="star-widget">
					<input type="radio" name="rate" id="rate-5" value="5">
       			    <label for="rate-5" class="fas fa-star"></label>
        			<input type="radio" name="rate" id="rate-4" value="4">
        			<label for="rate-4" class="fas fa-star"></label>
       			    <input type="radio" name="rate" id="rate-3" value="3">
       			    <label for="rate-3" class="fas fa-star"></label>
        			<input type="radio" name="rate" id="rate-2" value="2">
      			    <label for="rate-2" class="fas fa-star"></label>
      			    <input type="radio" name="rate" id="rate-1" value="1">
        			<label for="rate-1" class="fas fa-star"></label>
					<div class="rating_word">
						<header></header>					
					</div>
				</div><!-- class="star_widget -->
				
				</div><!-- class="star_container -->
			</div><!-- class="class="review_rating" -->
		
			<div class="review_area">
				<h4>상세한 후기를 써주세요</h4>
				<textarea name="review_cont" rows="7" cols="60" style="resize:none;"></textarea>
			</div>
			<div class="review_uploadFile">	
				<input type="file" name="p_image"><br>
				
			</div>
		</div><!-- class="review_content" -->
		<div class="review_bottom" align="center"> 
			<!-- <button type="submit" id="submit_btn">리뷰 등록</button> -->
			<button type="button" id="submit_btn" onclick="review_submit()">리뷰 등록</button>
			<button type="button" id="cancel_btn" onclick="window.close()">취소하기</button>
		</div>
		
		</form>
	</div><!-- class="review_container" -->
<script type="text/javascript">

/* 별점 점수를 받기  */
/* $(document).ready(function(){
    $('input[type="radio"]').click(function(){
    	var rate = $(this).val();
        alert("Your result is "+rate);
        console.log(rate);
    });
});
 */

	  function review_submit(){
	 	let pnum = document.getElementById("p_num").value;
		let memid= "<%=(String)session.getAttribute("member_id")%>";
	 
		let f = document.forms.frm;
		
		window.opener.name = "review_paranet";
		
		f.target= "review_paranet";
		
		//form(name=frm)의 action경로 지정
		f.action = "<%=request.getContextPath()%>/review_write_ok.do?num="+pnum+"&id="+memid;
	
		//form(frm)에 submit 메서드 호출해 데이터 전달
		f.submit();
		
		self.close();
	 
	 
 }
	


</script>
</body>
</html>