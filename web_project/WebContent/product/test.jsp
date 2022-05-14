<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">

	const toggleBtn = documnet.querySelector('#semiCartList');
	
	toggleBtn.addEventListener('click', () => {
		sidebar.classList.toggle('active');
	});

</script>
<style type="text/css">

	
	. {
		width:500px;
		height:100%;
		/*
		posision:fixed;
		*/
		top: 0;
		right: -500;
		z-index:30;
		transition:.35s;
		backgroud: black;
		border: 1px solid red;
	}
	
	input[id="menuicon"]{
		
	}
	
	
	.munubtn {
		display:block;
		width: 50px;
		height: 50px;
		position: absolute;
		top:50%;
		right:10px;
		transform: translateY(-50%);
		cursor: pointer;
	}
	.munubtn span {
		display: block;
		position: absolute;
		width: 80%;
		height: 5px;
		border-radius: 30px;
		background-color: #222;
		transition: all .35;
	}
	
	.munubtn span:nth-child(1) {
		top:20%;
		left:50%;
		transform: translateX(-50%);
	}
	.munubtn span:nth-child(2) {
		top:50%;
		left:50%;
		transform: translate(-50%, -50%);
	}
	.munubtn span:nth-child(3) {
		bottom:20%;
		left:50%;
		transform: translateX(-50%);
	}
	
	
	
	
	.container {
	
		width: 100%;
		position: relative;
		
	}
	
	.container .contents {
		width: 1200px;
		margin: 0 auto;
		min-height: 700px;
		border: 1px solide #eee;
		background: #f1f1f1;
		
	
	}
	
	.container .sidebar {
		position: fixed;
		top:0;
		right: -300px;
		width: 300px;
		height: 100%;
		background: #666;
		border: 1px solid #eee;
		z-index: 30;
		transition: .35s;
	}
	
	input[id='menuicon']:checked ~ .container .sidebar {
		right: 0;
	}
	
	header > div {
		position:relative;
	
	}
	
</style>


</head>
<body>
	
	<input type="checkbox" id="menuicon">
	
	<header>
		<div>
			<ul class="navi">
				<li class="logo"><a>상단로고영역</a></li>
				<li>메뉴01</li>
				<li>메뉴02</li>
				<li>메뉴03</li>
				<li>메누04</li>
			
			</ul>
			<label for="menuicon" class="munubtn">
				<span></span>
				<span></span>
				<span></span>
			
			</label>
		</div>
	</header>
	
	<div class="container">
	
		<div class="contents">
			<span class="area_desc">content영역</span>
		</div> 
		<div class="sidebar">
			<span class="area_desc">content영역</span>
		</div> 
		
	</div>

</body>
</html>