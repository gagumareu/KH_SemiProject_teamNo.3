<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
        <div align="right">
        	<button type="button" class="btn btn-primary"
        		onclick="location.href='<%=request.getContextPath() %>/admin_notice_input.do'">공지사항 등록</button>
        </div>
        <br>
        
			<table class="table table-bordered table-hover">
				<colgroup>
					<col width="10%">
					<col width="60%">
					<col width="10%">
					<col width="20%">
				</colgroup>
				
				<tr style="background-color: #383636; color:white;">
					<th>NO</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일자</th>
				</tr>
				
				<c:set var="list" value="${noticeList }" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.getNotice_no() }</td>
							<td>
								<a href="<%=request.getContextPath() %>/admin_notice_content.do?no=${dto.getNotice_no() }"> 
									${dto.getNotice_title() }
								</a>		
							</td>
							<td>${dto.getNotice_hit() }</td>
							<td>${dto.getNotice_date().substring(0,10) }</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty list }">
					<tr>
						<td colspan="5" align="center">
							<h3>등록된 공지사항이 없습니다.</h3>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	 </div>

	<footer class="container-fluid navbar-fixed-bottom col-sm-offset-2">
		<p>하단바 영역</p>
	</footer>
	
	
</body>
</html>