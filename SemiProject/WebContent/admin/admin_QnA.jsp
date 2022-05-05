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
        <div class="page-header" align="center"><h2>고객 Q&A</h2></div>
        <br>
        
        	<table class="table table-bordered table-hover">
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="50%">
					<col width="10%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				
				<tr>
					<th>NO</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				
				<c:set var="list" value="${qaList }" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.getQa_no() }</td>
							<td>${dto.getQa_category() }</td>
							<td>
								<a href="<%=request.getContextPath() %>/admin_Qa_content.do?no=${dto.getQa_no() }"> 
									${dto.getQa_title() }
								</a>		
							</td>
							<td>${dto.getQa_memid() }</td>
							<td>${dto.getQa_date().substring(0,10) }</td>
							<td>${dto.getQa_hit() }</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty list }">
					<tr>
						<td colspan="6" align="center">
							<h3>등록된 Q&A가 없습니다.</h3>
						</td>
					</tr>
				</c:if>
			</table>

        </div>
       </div>
       
       
</body>
</html>