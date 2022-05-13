<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	th{background-color : #eee;}
</style>
<meta charset="UTF-8">
</head>
<body>

	<jsp:include page="../include/admin_top.jsp" />
		        
		<div class="col-sm-8 col-sm-offset-3">
		<br><br><br>
        <div class="page-header" align="center"><h2>공지사항</h2></div>
        
        	<c:set var="dto" value="${noticeCont }" />
        	<table class="table table-bordered table-hover">
	        	<colgroup>
	        		<col width="20%">
	        		<col width="80%">
	        	</colgroup>
        		<tr>
        			<th>제목</th>
        			<td>${dto.getNotice_title() } </td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td>${dto.getNotice_writer() } </td>
				</tr>
				
				<tr>
					<th>글 내용</th>
					<td>
						${dto.getNotice_cont() }
						<c:if test="${!empty dto.getNotice_image() }">
							<br>
							<img src="<%=request.getContextPath() %>/upload/notice/${dto.getNotice_image() }">
						</c:if>
					</td>
				</tr>
				
					
				<tr>
				<c:if test="${empty dto.getNotice_update() }">
					<th>작성일자</th>
					<td>${dto.getNotice_date() }</td>
				</c:if>
				
				<c:if test="${!empty dto.getNotice_update() }">
					<th>수정일자</th>
					<td>${dto.getNotice_update() }</td>
				</c:if>
			</tr>

			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>검색된 게시물이 없습니다....</h3>
					</td>
				</tr>	
			</c:if>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="글수정" class="btn btn-primary"
						onclick="location.href='admin_notice_update.do?no=${dto.getNotice_no() }&page=${page}'">
					
					<input type="button" value="글삭제" class="btn btn-danger"
						onclick="if(confirm('공지사항을 삭제하시겠습니까?')) {
									location.href='admin_notice_delete.do?no=${dto.getNotice_no() }&page=${page}'
								} else {return; }">
								
					<input type="button" value="전체목록" class="btn btn-default"
						onclick="location.href='admin_notice.do?page=${page}'">
						
				</td>
			</tr>
				
		</table>        			
        </div>
        
	 </div>

	
</body>
</html>