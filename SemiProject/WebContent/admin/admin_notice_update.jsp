<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../include/admin_top.jsp" />
	
	<div class="col-sm-8 col-sm-offset-3">
		<br><br><br>
        <div class="page-header" align="center"><h2>공지사항</h2></div>
        
        <form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath() %>/admin_notice_update_ok.do">
			
        	<c:set var="dto" value="${noticeCont }" />
        	
        	<input type="hidden" name="n_no" value="${dto.getNotice_no() }">
        	<table class="table table-bordered table-hover">
        		<tr>
        			<th>제목</th>
        			<td><input name="n_title" value="${dto.getNotice_title() }"></td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td><input name="n_writer" value="${dto.getNotice_writer() }" readonly></td>
				</tr>
				<% pageContext.setAttribute("newLineChar", "<br>"); %>
				<tr>
					<th>글 내용</th>
					
					<td><textarea rows="7" cols="100" name="n_cont">${dto.getNotice_cont() }</textarea></td>
				</tr>
				
				<tr>
					<th>이미지 첨부파일</th>
					<td>
						<img src="<%=request.getContextPath() %>/upload/notice/${dto.getNotice_image() }">
						<input type="file" name="n_image_new">
						
						<input type="hidden" name="n_image_old"
								value="${dto.getNotice_image() }">
					</td>
				</tr>
				
				<tr>
					<th>비밀빈호</th>
					<td><input type="password" name="n_pwd"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="btn btn-primary" value="수정하기">
						<input type="reset" class="btn btn-default" value="다시작성">
					</td>
				</tr>
				
			</table>
		</form>
    </div>

	<footer class="container-fluid navbar-fixed-bottom col-sm-offset-2">
		<p>하단바 영역</p>
	</footer>
	
</body>
</html>