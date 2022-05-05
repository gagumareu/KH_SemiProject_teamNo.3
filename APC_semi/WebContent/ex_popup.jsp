<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	body{
		padding:40px;
	}
	
	.btn{
		display: block;
		width:200px;
		height:50px;
		text-decoration: none;
		text-align: center;
		
		line-height: 50px;
		color: white;
		background-color:#4ac4f3;
		border-radius: 50px;		
	}

	.popup{
	
		opacity:0;
	
	
		position:absolute;
		left:50%;
		top:50%;
		transform : translate(-50%, -50%);
	
		width:300px;
		height:15px;
		box-shadow: 0 0 10px rgb(0,0,0,0.5);
		background-color:#fff;
		
		text-align: right;
		
		border-radius: 5px;
		
		padding:200px;
		box-sizing: border-box;
		
		transition:all 0.5s;
		
		z-index: 5;
		
		
	}
	
	.popup a {
	
		color:gray;
		text-decoration: none;
	}
	
	.popup:target{
		opacity:1;
	}
 	.popup:target + .dim{
		opacity:1;
		z-index: 2;
	}
	
	.dim{
	position: absolute;
	z-index:-1;
	left: 0; 
	top:0;
	
	width:100%;
	height:100%;
	background: rgb(0,0,0,0.6);
	opacity:0;
	
	transition:all 0.5s;
	}
	
	
</style>

</head>
<body>
	<a href="#pop1" class="btn">팝업열기</a>
	
	<div class="popup" id="pop1">
		<a href="#">닫기</a>
	</div>
	<div class="dim">
	
	</div>
</body>
</html>