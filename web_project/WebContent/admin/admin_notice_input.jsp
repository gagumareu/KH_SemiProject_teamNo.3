<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	th{background-color : #eee;}
</style>
<script type="text/javascript">

	$(function() {
		$('input[name=n_cont]').val().replace(/\r\n|\n/ , "<br>");	
	});
	 
</script>
</head>
<body>

	<jsp:include page="../include/admin_top.jsp" />
		        
		<div class="col-sm-8 col-sm-offset-3">
		<br><br><br>
        <div class="page-header" align="center"><h2>공지사항 등록</h2></div>
        <br>
        
        <form method="post" enctype="multipart/form-data"
	 		action="<%=request.getContextPath()%>/admin_notice_input_ok.do">
	 		
			<table class="table table-bordered table-hover">
				<tr>
					<th>공지사항 제목</th>
					<td><input name="n_title" class="form-control" style="width:50%;"> </td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input name="n_writer" value="${adminName }"
							class="form-control" style="width:150px;"> </td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="7" cols="100" name="n_cont" class="form-control"></textarea> </td>
				</tr>
				<tr>
					<th>이미지 첨부파일</th>
					<td><input type="file" name="n_file"> </td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="n_pwd" class="form-control" style="width:150px;"> </td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-primary" value="등록하기">
						<input type="reset" class="btn btn-default" value="다시작성">
					</td>
				</tr>
			</table>
			
		</form>	
		</div>
	 </div>				
        
        
</body>
</html>