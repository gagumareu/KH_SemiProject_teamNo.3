<%@page import="com.apc.model.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/qa.css">
<script type="text/javascript">


function qa_update_ok(){
	
	let no = document.getElementById("qa_no").value;
	let page = document.getElementById("page").value;
	
	document.frm.action = "<%=request.getContextPath()%>/qa_update_ok.do?num="+no+"&page="+page;
	document.frm.submit();
	
} 

</script>
<style type="text/css">
	body{
		font-family: "arial";
	}

	.table {
		width: 95%;
		
	}
	
	#qa_category{
		margin-left:30px;
	}

	html, body{
	
		margin: 0px;
		padding: 0px;
	}


	.apcTitle, .apcTitle_sub{
	margin-top: 50px;
	font-size: 58px;
	margin-left: 15px;
	font-weight: bold;
	width: 180px; /* 이슬 수정 */
	}
	
	.apcTitle > a{
	color: black;
	text-decoration: none;
	}
	
	.apcTitle > a:hover{
	color: white;
	text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
	}

	
	.col > a > img{
	width:100%;

	}
	
	.col{
	width: 800px;
	}
	
	.container{
	margin: 0px;
	width: 100%;
	}

	.row{
	}
	
	.container{
	}

	.class{
		
	}

	/* 이슬 추가  */
	.alltitle{
		display:flex;
	}
	
	.qa_body{
	
		
	}

</style>
</head>
<body>
	<jsp:include page="/include/shop_top.jsp" />
	<jsp:include page="/include/shop_top_right.jsp" />
	<div class="qa_container">
			<div class="alltitle">
		<div class="apcTitle">
			<a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a>
		</div>
		<div class="apcTitle_sub">
			/  Q&A
		</div>
		</div>
		
		<div class="qa_body" align="center">
		<form id="qa_form" method="post" name="frm" >
		<input type="hidden" id="qa_no" name="qa_no" value="${cont.getQa_no() }">
		<input type="hidden" id="page" name="page" value="${page }">
		<c:if test="${cont.getQa_pno_fk() == 0 }">
		<div >
		
		</div>
		</c:if>		
		
		<c:if test="${cont.getQa_pno_fk() > 0 }">
		<table class="qa_top_table" align="left" >
			<tr >
				<td rowspan="2" width="50%">
				<img src="<%=request.getContextPath() %>/upload/${img }" width="100%" height="100%">
				</td>
				<td><span>${product.getPname()}</span> <br>
					<span>SIZE: ${product.getPsize() }/ COLOR : ${product.getPcolor() }</span><br>
					<span class="qa_product_price"><fmt:formatNumber value="${product.getPrice() }" />원</span>
				</td>
			</tr>
			<tr>
				
				<td width="50%">
					<button type="button" class="btn btn-outline-dark" 
					onclick="location.href='product_detail.do?num=${product.getPno() }&color=${product.getPcolor() }&size=${product.getPsize() }'">
					제품 상세보기
					</button>
				</td>
			</tr>
		</table>
		

		</c:if>
		
	
			<table class="table">
			
				<tbody>
					<tr>
						<td class= "table-light"> 제목 </td>
						<td><input name="qa_title" value="${cont.getQa_title() }" style="border: none; background: transparent;" size="100"
							autofocus="autofocus"></td>
					</tr>
					<tr>
						<td class="table-light">작성자</td>
						<td><c:if test="${cont.getQa_memid().length() > 2 }">
						${cont.getQa_memid().substring(0,2) }****
					</c:if></td>
					</tr>
					<tr>
						<td class="table-light">작성일</td>
						<td>${cont.getQa_date().substring(0,10)}</td>
					</tr>
					<tr>
						<td class="table-light">조회수</td>
						<td>${cont.getQa_hit()}</td>
					</tr>
					<tr>
						<td colspan="2">
						<textarea rows="20" cols="200" name="qa_cont">${cont.getQa_cont() }</textarea> </td>
					</tr>
				</tbody>
			</table>
				<div id="btnGroup" align="right">
					<button type="button" class="btn btn-outline-dark" 
						onclick="location.href='<%=request.getContextPath() %>/qa_list.do'">
						목록
					</button> &nbsp;
					<button type="button" class="btn btn-outline-dark" onclick="qa_update_ok();">수정완료</button>
				</div>
		</form>
		</div> <!-- class="qa_body"  -->
	</div><!--class="qa_container"  -->
	<jsp:include page="/include/shop_bottom.jsp"/>
</body>
</html>