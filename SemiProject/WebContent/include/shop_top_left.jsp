<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	
	#navr{
	margin: 10px 0px 0px 10px;
	width: 200%;
	display: flex;
	}
	
	#navr_ul{
	height: 20px;
	
	}
	
	
	#navr_ul {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	/*justify-content: space-evenly;*/
	padding-left: 0px;
	margin: 0px;
	
	
	}
	
	
	#navr_ul > li{
	font-size: 13px;
	font-weight: bold;
	padding: 0 38px 0px 0px;
	}
	
	
	span {
	opacity: 0;

	}
	
	span:hover{
	opacity: 1;
	
	}
	
	
	
	
</style>
</head>
<body>

	<div id="navr">
	
		<ul id="navr_ul">
			<li>Women</li>
			<li>Men</li>
			<li>Denim</li>
			<li>Golf</li>
			<li>Objects</li>
			<li>Surplus</li>
			<li>A.P.C.X Jessica Ogden</li>
			<li ><a id="search" href="#"><img src="../images/search.png" width="20px" ><span>search</span></a></li>
		</ul>
		
		
	
	</div>
	
	
	
	


</body>
</html>