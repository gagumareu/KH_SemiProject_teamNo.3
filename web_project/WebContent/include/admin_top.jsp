<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>A.P.C ADMIN PAGE</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/admin_style.css" rel="stylesheet">


</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



<body>

   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
      	
      		<span class="glyphicon glyphicon-home"></span><span style="font-size:24px;">&nbsp;
      		<a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">A.P.C</a>
      		<a class="navbar-brand" href="<%=request.getContextPath() %>/admin_main.do">ADMIN PAGE </a></span>
     

		<ul class="nav navbar-nav navbar-right">
        	<li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;${adminName }님 환영합니다.</a></li>
            <li><a href="<%=request.getContextPath() %>/admin_logout.do">
            	<span class="glyphicon glyphicon-log-out"></span>&nbsp;Logout
            </a></li>
        </ul>
        
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-2 sidebar">
          <ul class="nav nav-sidebar" style="font-size:16px;">
          	<li align="center">
       			<img src="<%=request.getContextPath() %>/img/admin.png" width="80%">
          	</li>
            <li><a href="<%=request.getContextPath() %>/admin_notice.do" class="glyphicon glyphicon-bell">&nbsp;공지사항</a></li>
            <li><a href="<%=request.getContextPath() %>/admin_category_list.do" class="glyphicon glyphicon-list">&nbsp;카테고리관리</a></li>
            <li><a href="<%=request.getContextPath() %>/admin_products_list.do" class="glyphicon glyphicon-briefcase">&nbsp;제품관리</a></li>
            <li><a href="<%=request.getContextPath() %>/admin_sales_managment.do" class="glyphicon glyphicon-list-alt">&nbsp;매출관리</a></li>
            <li><a href="<%=request.getContextPath() %>/admin_qa.do" class="glyphicon glyphicon-phone-alt">&nbsp;고객Q&A</a></li>
          </ul>
         </div>