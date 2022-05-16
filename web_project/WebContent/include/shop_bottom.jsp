<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">


	.footer{
		background-color: black;
		color: white;
		display:flex; 
		flex-direction: column;
		justify-content: space-between;
		clear: both;
		padding: 20px 0px 10px 17px;;
	}
	
	
	.foot_title{
		font-size: 58px;
		font-weight: bold;
		color: white;
		margin: 0px 0 80px 0;
		padding-top: 20px;
	}
	
	.sns{
		font-size: 23px;
		position: absolute;
		right: 20px;
		flex-wrap: wrap;
	
	}
	
	.addr{
		font-size: 13px;
		margin-bottom: 50px;
		display: flex;
		flex-wrap: wrap;
	
	}
	
	.policy{
		font-size: 13px;
		padding-bottom: 50px;
		display: flex;

	}
	
	.policy ul{
		display: flex;
		flex-direction: column;
		padding-right: 50px;
		list-style-type: none;		
		
	}
	
	.sns {
		padding-top: 20px;
		
	}
	
	.sns ul {
		display: flex;
		flex-direction: row;
		list-style-type: none;		
	}
	
	.sns i{
		font-size: 39px;
		padding-left: 20px;
		color: white;
	}
	
	.psersonlly {
		font-size: 13px;
		margin-right: 20px;
		display: flex;	
	
	}
	
	.psersonlly div {
		padding-left: 20px;
	}
	.newNpserson {
		font-size: 13px;
		padding-bottom: 50px;
		display: flex;
		flex-direction: row;
		justify-content: space-between;
	
	}
	
	.admin {
		color: white;
		font-size: 20px;
		margin-left: auto;
		margin-right: 18px;
	}
	
	.admin img{
		color: white;
		font-size: 30px;
	}
	
	
</style>

<!-- icon style links -->
<script src="https://kit.fontawesome.com/a705bacd4a.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	$(function(){
		$('.fa-solid').click(function(){
			window.open('admin/admin_Login.jsp');	
		});
	});
		
		
</script>


</head>
<body>
	
	<div class="footer">
		
		<div class="foot_title">
			A.P.C.
		</div>
		
		<div class="sns">
			<ul>
				<li>
					<a href="#">
						<i class="fa-brands fa-instagram-square"></i>
					</a>
				</li>
				<li>
					<a href="#">
						<i class="fa-brands fa-facebook"></i>
					</a>
				</li>
			</ul>
		</div>
	
		<div class="addr"> 
			
				<div>상호:(주)아이디룩</div>
				<div>대표 : 김재풍</div>
				<div>주소 : 서울 강남구 강남대로 580 8층</div>
				<div>물류센터 : 경기도 평택시 서탄면 서탄2로 97</div>
				<div>사업자등록번호 : 211-81-39521</div>
				<div>통신판매업신고번호 : 2009-서울강남-02143</div>
				<div>개인정보관리자 : 송하영</div>
				<div>전화번호 : 1833-2250</div>
				
		</div>
		
		<div class="policy">
			<ul>
				<li>About A.P.C.</li>
				<li>Site Map</li>
			</ul>
				
			<ul>
				<li>지불방법</li>
				<li>상품배송</li>
			</ul>
			
			<ul>
				<li>반품교환</li>
				<li>공지사항</li>
			</ul>
			
			<ul>
				<li>이용약관</li>
				<li>채무지급보증</li>
			</ul>
		</div>
		
		<div class="newNpserson">
		
			<div class="news">
				NEWSLETTER : A.P.C.의 새로운 컬렉션, 이벤트, 세일 소식을 받아볼 수 있습니다. 
			</div>
			
			<div class="psersonlly">
				<div>이용 안내</div>
				<div>개인정보처리방침</div>
			</div>
			
			
			
		</div> 
			<div class="admin">
				<i class="fa-solid fa-screwdriver-wrench"></i>
			</div>
		
		
		
		
	</div> <!-- footer end -->
	
</body>


</html>
	
	
	