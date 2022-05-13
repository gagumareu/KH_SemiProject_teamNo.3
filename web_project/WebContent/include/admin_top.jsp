<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>
<meta charset="UTF-8">
<title>A.P.C ADMIN PAGE</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/admin_style.css" rel="stylesheet">
</head>
<body>

   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
      	<a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp"><span style="font-size:24px;">A.P.C</span></a>
      	<a class="navbar-brand" href="<%=request.getContextPath() %>/admin_main.do"><span style="font-size:24px;">/ADMIN PAGE</span></a>

		<ul class="nav navbar-nav navbar-right">
        	<li><a href="#">${adminName }님 환영합니다.</a></li>
            <li><a href="<%=request.getContextPath() %>/admin_logout.do">Logout</a></li>
        </ul>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-2 sidebar">
          <ul class="nav nav-sidebar">
          	<li align="center">
       			<img src="<%=request.getContextPath() %>/img/admin.png" width="80%">
          	</li>
            <li><a href="<%=request.getContextPath() %>/admin_notice.do">공지사항</a></li>
            <li><a href="<%=request.getContextPath() %>/admin_category_list.do">카테고리관리</a></li>
            <li><a href="<%=request.getContextPath() %>/admin_products_list.do">제품관리</a></li>
            <li><a href="#">재고관리</a></li>
            <li><a href="<%=request.getContextPath() %>/admin_sales_managment.do">매출관리</a></li>
            <li><a href="<%=request.getContextPath() %>/admin_qa.do">고객Q&A</a></li>
          </ul>
         </div>
