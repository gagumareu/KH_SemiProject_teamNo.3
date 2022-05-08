<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="author" content="" />
<title>A.P.C ADMIN PAGE</title>
</head>
<body>

	
 	<jsp:include page="../include/admin_top.jsp" />
        
		<div class="col-sm-3 col-sm-offset-2">
			<div class="page-header">공지사항</div>
		</div>
	         
	    <div class="col-sm-3">
	    	<div class="page-header">카테고리 관리</div>
		</div>
	      
		<div class="col-sm-3">
			<div class="page-header">제품관리</div>
		</div>      
	</div>


	<div class="row">
		<div class="col-sm-3 col-sm-offset-2">
          <div class="page-header">제고관리</div>
        </div>
         
        <div class="col-sm-3">
          <div class="page-header">매출관리</div>
        </div>
      
        <div class="col-sm-3">
          <div class="page-header">고객Q&A</div>
        </div>      
      </div>
    </div>

	<footer class="container-fluid navbar-fixed-bottom col-sm-offset-2">
		<p>하단바 영역</p>
	</footer>

    
  </body>
</html>