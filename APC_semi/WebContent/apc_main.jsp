<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#body{
		height:800px;
		border : 1px solid black;
	}
</style>
</head>
<body>

	<jsp:include page="include/main_top.jsp" />
	<div id="body">
	
	메인내용
	
	</div>
	
	<jsp:include page="include/main_bottom.jsp" />

</body>
</html>