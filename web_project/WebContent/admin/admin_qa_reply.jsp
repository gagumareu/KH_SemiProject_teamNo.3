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
        <div class="page-header" align="center"><h2>고객 문의사항 답변하기</h2></div>
        <br>
        
        <c:set var="dto" value="${reply }" />
          <form method="post"
			action = "<%=request.getContextPath() %>/admin_qa_reply_ok.do">
			
			<input type="hidden" name = "qa_no" value="${dto.getQa_no() }">
			<input type="hidden" name = "qa_category" value="${dto.getQa_category() }">
			<input type="hidden" name = "qa_pno_fk" value="${dto.getQa_pno_fk() }">
			<input type="hidden" name = "qa_group" value="${dto.getQa_group() }">
			<input type="hidden" name = "qa_step" value="${dto.getQa_step() }">
			<input type="hidden" name = "qa_indent" value="${dto.getQa_indent() }">
			<input type="hidden" name = "page" value="${page }">

        	<table class="table table-bordered table-hover">
        	<colgroup>
        		<col width="20%">
        		<col width="80%">
        	</colgroup>
        		
        		<tr>
        			<th>답변 제목</th>
        			<td><input class="form-control" style="width:50%;" name="reply_title"> </td>
        		</tr>
        		
        		<tr>
        			<th>답변 내용</th>
        			<td><textarea class="form-control" rows="7" cols="100" name="reply_content"></textarea></td>
        		</tr>
        		
        		<tr>
        			<td colspan="2" align="center">
        				<input type="submit" value="답변하기" class="btn btn-primary">&nbsp;&nbsp;&nbsp;
        				<input type="reset" value="다시작성" class="btn btn-default">
        			</td>
        		</tr>
        	</table>
          </form>
        	
        </div>
       </div>         	
</body>
</html>