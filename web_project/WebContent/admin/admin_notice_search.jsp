<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:include page="../include/admin_top.jsp" />
		        
		<div class="col-sm-8 col-sm-offset-3">
		<br><br><br>
        <div class="page-header" align="center"><h2>공지사항</h2></div>
        
        <br>
        
			<table class="table table-bordered table-hover">
				<colgroup>
					<col width="10%">
					<col width="70%">
					<col width="20%">
				</colgroup>
				
				<tr style="background-color: #383636; color:white;">
					<th>NO</th>
					<th>제목</th>
					<th>작성일자</th>
				</tr>
				
				<c:set var="list" value="${search }" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.getNotice_no() }</td>
							<td>
								<a href="<%=request.getContextPath() %>/admin_notice_content.do?no=${dto.getNotice_no() }&page=${page}"> 
									${dto.getNotice_title() }
								</a>		
							</td>
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
			
			<nav align="center">
  			  <ul class="pagination">
	    		
				<c:if test="${page > block }">
					<li><a style="font-weight:bold;" href="admin_notice.do?page=1">
						《
					</a></li>
					<li><a style="font-weight:bold;" href="admin_notice.do?page=${startBlock - 1 }">
						〈
					</a></li>
				</c:if>
				
				<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
					
					<c:if test="${i == page }">
						<li class="active"><a href="admin_notice.do?page=${i }">${i }</a></li>
					</c:if>
					
					<c:if test="${i != page }">
						<li><a href="admin_notice.do?page=${i }">${i }</a></li>
					</c:if>
					
				</c:forEach>
				
				<c:if test="${endBlock < allPage }">
					<li><a style="font-weight:bold;" href="admin_notice.do?page=${endBlock + 1 }">
						〉
					</a></li>
					<li><a style="font-weight:bold;" href="admin_notice.do?page=${allPage }">
						》
					</a></li>
				</c:if>
			  </ul>
			</nav>
			
			<div align="center">
				<input type="button" value="전체목록" class="btn btn-default"
								onclick="location.href='admin_notice.do?page=1'">		
			</div>	
			
		</div>
	  </div>	
</body>
</html>