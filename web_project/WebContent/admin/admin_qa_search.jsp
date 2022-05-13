<%@page import="java.util.List"%>
<%@page import="com.apc.model.QaDTO"%>
<%@page import="com.apc.model.QaCategoryDTO"%>
<%@page import="com.apc.model.QaCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<QaDTO> qa = (List<QaDTO>)request.getAttribute("search");

	pageContext.setAttribute("List", qa);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<jsp:include page="../include/admin_top.jsp" />
		        
		<div class="col-sm-8 col-sm-offset-3">
		<br><br><br>
        <div class="page-header" align="center"><h2>고객 Q&A</h2></div>
        <br>
        
        	<table class="table table-bordered table-hover">
				<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="50%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				
				<tr style="background-color: #383636; color:white;">
					<th>NO</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				
				<c:set var="list" value="${search }" />
				<c:if test="${!empty list }">
				   <%
					 for(int i=0; i<qa.size(); i++){
					 	QaDTO dto = qa.get(i);
					%>
						<tr>
							<td><%=dto.getQa_no() %></td>
							<%
							 QaCategoryDAO qcDao = QaCategoryDAO.getInstance();
							 QaCategoryDTO qcDto = qcDao.getCategoryCont(dto.getQa_category());
							%>		
							<td><%=qcDto.getCategory_name() %></td>
							<td>
								<%-- 답변인 경우 --%>
								<c:if test="${dto.getQa_indent() != 0 }">
									<c:forEach begin="1" end="<%=dto.getQa_indent()%>">
										<img src="<%=request.getContextPath() %>/img/reply-all.png" width="20px">							
									</c:forEach>
								</c:if>
								<a href="<%=request.getContextPath() %>/admin_qa_content.do?no=<%=dto.getQa_no() %>&page=${page}"> 
									<%=dto.getQa_title() %>
								</a>		
							</td>
							<td><%=dto.getQa_memid() %></td>
							<td><%=dto.getQa_date().substring(0,10) %></td>
						</tr>
						
					<% } // for문 end %>
				</c:if>
				
				<c:if test="${empty list }">
					<tr>
						<td colspan="6" align="center">
							<h3>등록된 Q&A가 없습니다.</h3>
						</td>
					</tr>
				</c:if>
			</table>
			
			<nav align="center">
  			  <ul class="pagination">
	    		
				<c:if test="${page > block }">
					<li><a style="font-weight:bold;" href="admin_qa.do?page=1">
						《
					</a></li>
					<li><a style="font-weight:bold;" href="admin_qa.do?page=${startBlock - 1 }">
						〈
					</a></li>
				</c:if>
				
				<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
					
					<c:if test="${i == page }">
						<li class="active"><a href="admin_qa.do?page=${i }">${i }</a></li>
					</c:if>
					
					<c:if test="${i != page }">
						<li><a href="admin_qa.do?page=${i }">${i }</a></li>
					</c:if>
					
				</c:forEach>
				
				<c:if test="${endBlock < allPage }">
					<li><a style="font-weight:bold;" href="admin_qa.do?page=${endBlock + 1 }">
						〉
					</a></li>
					<li><a style="font-weight:bold;" href="admin_qa.do?page=${allPage }">
						》
					</a></li>
				</c:if>
			  </ul>
			</nav>
			
			<div align="center">
				<input type="button" value="전체목록" class="btn btn-default"
								onclick="location.href='admin_qa.do?page=1'">		
			</div>		
        </div>
       </div>
       
</body>
</html>