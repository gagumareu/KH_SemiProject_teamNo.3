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


	//form을 submit버튼이아닌 javascript로 액션 처리 하는 방법 
	function qa_del(){

	let no = document.getElementById("qa_no").value;
	let page = document.getElementById("page").value;
	let qa_pwd = document.getElementById("inputPassword6").value;
	let db_pwd = document.getElementById("db_pwd").value;
	
	console.log(qa_no);
	console.log(qa_pwd);
	console.log(db_pwd);
	
	if(db_pwd == qa_pwd){
		//form(name=frm)의 action경로 지정
		document.frm.action = "<%=request.getContextPath()%>/qa_delete.do?num="+no+"&page="+page;

		//form(frm)에 submit 메서드 호출해 데이터 전달
		document.frm.submit();
		
	}else{
		alert('비밀번호가 틀렸습니다.');
		return;
	}

	}
	
	function qa_update(){
		let no = document.getElementById("qa_no").value;
		let page = document.getElementById("page").value;
		let qa_pwd = document.getElementById("inputPassword6").value;
		let db_pwd = document.getElementById("db_pwd").value;
		
		if(db_pwd == qa_pwd){
		document.frm.action = "<%=request.getContextPath()%>/qa_update.do?num="+no+"&page="+page;
		
		document.frm.submit();
		}else{
			alert('비밀번호가 틀렸습니다.');
			return;
		}
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
		<input type="hidden" id="db_pwd" name="db_pwd" value="${cont.getQa_pwd() }">
		<input type="hidden" id="page" name="page" value="${page }">
		
		<c:if test="${cont.getQa_pno_fk() == 0 }">
		<div >
		
		</div>
		</c:if>		
		
		<c:if test="${cont.getQa_pno_fk() > 0 }">
		<table class="qa_top_table"  align="left">
			<tr >
				<td class="qa_product" rowspan="2" width="50%">
				<img src="<%=request.getContextPath() %>/upload/${fileName}" >
				</td>
				<td width="50%">
					<div>
					<span class="qa_product_name">${pDto.getPname() }</span> <br>
					<span class="qa_product_price"><fmt:formatNumber value="${pDto.getPrice() }" />원 </span>
					</div>
				</td>
			</tr>
			<tr>
				<td width="50%">
					<button type="button" class="btn btn-outline-dark" 
					onclick="location.href='<%=request.getContextPath()%>/product_detail.do?num=${pDto.getPno() }&color=${pDto.getPcolor() }&size=${pDto.getPsize() }'">
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
						<td>${cont.getQa_title() }</td>
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
					<tr height="150px">
						<td  colspan="2">
						<div class="qa_content">${cont.getQa_cont() }</div></td>
					</tr>
					<tr>
						<td class="table-light">비밀번호</td>
						<td><input name="qa_pwd" type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline" >
							<br><span id="passwordHelpInline" class="form-text"> 삭제 및 수정시 비밀번호를 입력하세요. </span>
						</td>
						</tr>
					
				</tbody>
			</table>
			<c:if test="${cont.getQa_indent() == 0}">
				<div class="qa_bottom_btn" id="btnGroup" align="right">
					<button type="button" class="btn btn-outline-dark" 
						onclick="location.href='<%=request.getContextPath() %>/qa_list.do'">
						목록
					</button> &nbsp;
					
					<button id="qa_delete" type="button" class="btn btn-outline-dark" 
						onclick="if(confirm('정말로 삭제하시겠습니까?')){
									qa_del();
							<%-- location.href='<%=request.getContextPath() %>/qa_delete.do?num=${cont.getQa_no() }'; --%>
						}else{
							return
						}">
					삭제
					</button> &nbsp;
					<button type="button" class="btn btn-outline-dark" onclick="qa_update();">수정</button> &nbsp;
				</div>
				</c:if>
					<c:if test="${cont.getQa_indent() != 0}">
				<div class="qa_bottom_btn" id="btnGroup" align="right">
					<button type="button" class="btn btn-outline-dark" 
						onclick="location.href='<%=request.getContextPath() %>/qa_list.do'">
						목록  
					</button> &nbsp;
				</div>
				</c:if>
		</form>
		</div>
	</div>
	<jsp:include page="/include/shop_bottom.jsp"/>

</body>
</html>