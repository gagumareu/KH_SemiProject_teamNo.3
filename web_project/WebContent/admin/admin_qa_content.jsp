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
        <div class="page-header" align="center"><h2>고객 Q&A</h2></div>
        <br>
        
        	<c:set var="dto" value="${Cont }" />
        	
        	<c:if test="${dto.getQa_pno_fk() == 0 }">
				<div>
		
				</div>
			</c:if>		
		
			<c:if test="${dto.getQa_pno_fk() > 0 }">
			<div class="row">
			  <div align="center">
			    <div class="thumbnail">
			      <img width="200px" src="<%=request.getContextPath() %>/upload/${fileName}"> 

			      <div class="caption">
			        <h3>${pDto.getPname() }</h3>
			        <p>${pDto.getPrice() }</p>
			      </div>
			    </div>
			  </div>
			</div>
		</c:if>
		
        	<table class="table table-bordered table-hover">
        		<colgroup>
        			<col width="20%">
        			<col width="80%">
        		</colgroup>
	        	
        		<tr>
        			<th>제목</th>
        			<td>${dto.getQa_title() }</td>
        		</tr>
        		
        		<tr>
        			<th>작성자</th>
        			<td>
        				<c:if test="${dto.getQa_indent() == 0}">
        					<c:if test="${dto.getQa_memid().length() > 2 }">
        						${dto.getQa_memid().substring(0,2) }****
        					</c:if>
        				</c:if>
        				
        				<c:if test="${dto.getQa_indent() != 0}">
        					${dto.getQa_memid() }
        				</c:if>
        			</td>
        		</tr>
        		
        		<tr>
        			<th>
        				<c:if test="${dto.getQa_indent() == 0}">
        					문의내용
        				</c:if>
        			
        				<c:if test="${dto.getQa_indent() != 0}">
        					답변내용
        				</c:if>
        			</th>
        			<td>
        				<br>${dto.getQa_cont() }<br><br>
        			</td>
        		<tr>
        		
       		
        		<tr>
					<c:if test="${empty dto.getQa_update() }">
						<th>작성일자</th>
						<td>${dto.getQa_date().substring(0,10) }</td>
					</c:if>
					
					<c:if test="${!empty dto.getQa_update() }">
						<th>수정일자</th>
						<td>${dto.getQa_update().substring(0,10) }</td>
					</c:if>
				</tr>
			
				<tr>
					<td colspan="2" align="center">
						<c:if test="${dto.getQa_indent() != 0}">
							<input type="button" value="답변수정" class="btn btn-info"
								onclick="location.href='admin_qa_reply_update.do?no=${dto.getQa_no()}&page=${page}'">
							
							<input type="button" value="답변삭제" class="btn btn-danger"
								onclick="if(confirm('답변을 삭제하시겠습니까?')) {
										location.href='admin_qa_reply_delete.do?no=${dto.getQa_no()}&page=${page}&group=${dto.getQa_group() }'
									}else {	return; }">
						</c:if>
						
	        		    <input type="button" class="btn btn-primary"
	        		    	<c:if test="${dto.getQa_indent() != 0}"> value="추가 답변하기" </c:if>
	        		    	<c:if test="${dto.getQa_indent() == 0}"> value="답변하기" </c:if>
	        		    	onclick="location.href='admin_qa_reply.do?no=${dto.getQa_no()}&page=${page}'">
						
						<input type="button" value="전체목록" class="btn btn-default"
							onclick="location.href='admin_qa.do?page=${page}'">	    	
	        		</td>
	        	</tr>
        	</table>
        	
        </div>
       </div>        	
        	
</body>
</html>