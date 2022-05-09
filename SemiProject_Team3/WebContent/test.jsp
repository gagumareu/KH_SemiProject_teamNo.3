<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		padding: 40px;
		background: #f5f7fb;
	}
	.btn{
		display: block; 
		width: 200px; 
		heigth: 50px; 
		text-decoration: none;
		background: #4ac4f3;
		text-align: center;
		line-height: 50px;
		color: #fff;
		border-radius: 50x;
		
		
	}

	.popup {
		position: absolute;
		left: 50%; 
		top: 50%;
		transform: translate(-50%, -50%);
		width: 500px;
		height: 500px;
		box-shadow: 0 0 10px rgba(0,0,0,0.5);
		border-radius:5px;
		text-align: right;
		box-sizing: border-box;
		background: #fff;
		
		opacity: 0;
		transition: all 0.5s;
		z-index: 5;
	}
	
	.popup a {
		text-decoration: none;
		color: gray;
		
	}
	
	.popup:target {
		opacity: 1;
	}
	
	.popup:target + .dim {
		opacity: 1;
		z-index: 2;
	}
	
	.dim {
		position: absolute;
		left: 0; 
		top: 0;
		width: 100%;
		height: 100%;
		background: rgba(0,0,0,0.6);
		opacity: 0;
		z-index: -1;   
		transition: all 0.5s;
		     
	}
	
	
</style>
</head>
<body>

	<a href="#pop1" class="btn">팝업열기</a>
	
	<div class="popup" id="pop1">
		<a href="#a" >닫기</a>
	</div>
	<div class="dim"></div>
	
	
</body>
</html>