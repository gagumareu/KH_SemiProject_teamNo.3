<%@page import="com.apc.model.CartDTO"%>
<%@page import="com.apc.model.CartDAO"%>
<%@page import="com.apc.model.QaCategoryDTO"%>
<%@page import="com.apc.model.QaCategoryDAO"%>
<%@page import="com.apc.model.ProductDTO"%>
<%@page import="com.apc.model.ProductDAO"%>
<%@page import="com.apc.model.QaDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.QaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<QaDTO> qa = (List<QaDTO>)request.getAttribute("List");
	
	pageContext.setAttribute("List", qa);
	
%>
<!-- 지금은 jsp에서 바로 리스트불러오고 qa_list.do가 jsp페이지이동만하고있음, 병합하면  qa_list.do를 액션으로 다시 잡아줘야함  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/qa.css">
<script type="text/javascript">

	//form을 submit버튼이아닌 javascript로 액션 처리 하는 방법 
	function qa_category(){
	
		let code = document.getElementById("code").value;
		
		//form(name=frm)의 action경로 지정
		document.frm.action = "<%=request.getContextPath()%>/qa_category.do?code="+code;
	
		//form(frm)에 submit 메서드 호출해 데이터 전달
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
	
	#list_table td{
	
		height: 80px;
	
	}
	
	.list_td{
		padding-top:30px;
	}	
	
	#qa_no {
		padding-top:30px;
		text-align: center;
	}
	
	#list_table a{
		/* display:inline-block;
		margin-top:10px; */
		text-decoration: none;
		color: black;
		
	}
	
	a{
		cursor: pointer;	
	}
	
</style>
</head>
<body>
		<jsp:include page="/include/shop_top.jsp"/>
		<jsp:include page="/include/shop_top_right.jsp"/>
		<div class="qa_container">
		
		<div class="alltitle">
		<div class="apcTitle">
			<a href="<%=request.getContextPath()%>/index.jsp">A.P.C.</a>
		</div>
		<div class="apcTitle_sub">
			/  Q&A
		</div>
		</div>
	
		<div class="qa_body">
			<form class="qa_category" name="frm" method="post">
				<select id="code" name="qa_class" onchange="qa_category()">
				
				<option value="all" selected>전체</option>
					<option value="cr">취소/환불</option>
					<option value="iq">상품문의</option>
					<option value="del">배송</option>
					<option value="sb">반품</option>
					<option value="etc">기타</option>
					
			</select>
			</form>
			<table id="list_table" class="table table-hover" align="center">
				<thead>
					<tr align="center">
						<th scope="col">번호</th>
						<th scope="col">상품정보</th>
						<th scope="col">카테고리</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="list" value="${List }"/>
					<c:if test="${empty list }">
					<tr>
						<th colspan="7"> 정보가 없습니다.</th>
					</tr>
					</c:if>
				<!--          qa테이블 정보가 있으면 아래 내용 나타내기              -->
					<c:if test="${!empty list }"> 
					
					<%
					for(int i=0; i<qa.size(); i++){
						
						QaDTO dto = qa.get(i);
					%>	
					<tr >
				<!--                    게시판 번호                                             -->
						<th id="qa_no" scope="row" width="5%" align="center"><%=dto.getQa_no() %></th>
							
				<!--                    상품정보                                              -->
					<%
						
						
						if(dto.getQa_pno_fk() == 0){
					%>
						<td> </td>									<!-- 상품정보 빈칸 -->
					<% 
						}else {
							ProductDAO pDao = ProductDAO.getInstance();
							ProductDTO pDto = pDao.getProductCont(dto.getQa_pno_fk());
							
							String arrImg[] = pDao.getPorudctImg(pDto);
							
							System.out.println("dto.getQa_pno_fk():"+dto.getQa_pno_fk());
							System.out.println("arrImg[0]:"+arrImg[0]);
							
							if(dto.getQa_indent() != 0 ){
					%>
								<td> </td> <!-- 답변글에는 이미지 안보임 -->
					<% 		}else{
					%>		
							<td class="list_td"  width="10%" align="center">
							<a href="<%=request.getContextPath() %>/product_detail.do?num=<%= pDto.getPno() %>">
							<img src="<%=request.getContextPath() %>/upload/<%=arrImg[0]%>" width="70%" height="100%">
							</a>					
							</td>
					<% 	}	
						}//else 
					%>		
					<!--                    카테고리                                               -->
						<%
							QaCategoryDAO qcDao = QaCategoryDAO.getInstance();
							QaCategoryDTO qcDto = qcDao.getCategoryCont(dto.getQa_category());
						%>		
						<td class="list_td" width="10%" align="center"><%=qcDto.getCategory_name() %></td>
						
					<!--                       제목                                               -->	
						<td class="list_td" width="40%">
						<%if(dto.getQa_indent() != 0 ){
							for(int k =1; k<= dto.getQa_indent(); k++){
						%>	
							└ 
						<% 	}//for문
						%>
						<!-- 답변 글일 경우, -->	
						<%-- <a class="reply_click<%=dto.getQa_no() %>" href="<%=request.getContextPath() %>/qa_content.do?num=<%=dto.getQa_no()%>&page=${page}">답글:<%=dto.getQa_title() %></a> --%>
						<a class="reply_click<%=dto.getQa_no() %>" >답글:<%=dto.getQa_title() %></a>
						
						<%
							QaDAO qdao = QaDAO.getInstance();
							QaDTO qdto = qdao.getQaContent(dto.getQa_group()); //답변글에 대한 원글 정보를 받아옴
							String writer= qdto.getQa_memid(); //원글 작성자 아이디 
						%>
						
						<script type="text/javascript">
						$(function(){
							$(".reply_click<%=dto.getQa_no()%>").click( function(){
								
								let page = "<%=request.getAttribute("page")%>";
								let loginId = "<%=(String)session.getAttribute("member_id")%>";
								let writer = "<%=writer%>";
								
								console.log(loginId);
								console.log(writer);
								
								if(loginId == writer){
								
									$(location).attr("href", "<%=request.getContextPath() %>/qa_content.do?num=<%=dto.getQa_no()%>&page="+page);
									return;
								
								}else{
									alert("게시물에 접근할 수 없습니다.");
									return;
								}
								
							});
							
							});
						
						
						</script>
						
						
						
						
						<% }else{%>
						<!-- 답변 글이 아닐 경우, -->

						<%-- <a class="board_click" href="<%=request.getContextPath() %>/qa_content.do?num=<%=dto.getQa_no()%>&page=${page}"><%=dto.getQa_title() %></a> --%>
						<a class="board_click<%=dto.getQa_no() %>" ><%=dto.getQa_title() %></a>
						
						<script type="text/javascript">
							$(function(){
							$(".board_click<%=dto.getQa_no()%>").click( function(){
								
								let page = "<%=request.getAttribute("page")%>";
								let loginId = "<%=(String)session.getAttribute("member_id")%>";
								let writer = "<%=dto.getQa_memid()%>";
								
								console.log(loginId);
								console.log(writer);
								
								if(loginId == writer){
								
									$(location).attr("href", "<%=request.getContextPath() %>/qa_content.do?num=<%=dto.getQa_no()%>&page="+page);
									return;
								
								}else{
									alert("게시물에 접근할 수 없습니다.");
									return;
								}
								
							});
							
							});
						
						</script>
						
						<% }%>
						
						</td>
					<!--                       작성자                                              -->		
						<td class="list_td" width="15%" align="center">
						<%if((dto.getQa_memid().equals("admin"))){//관리자라면
						%>		관리자
						<% }else{
							if(dto.getQa_memid().length() > 1){
						%>	
							<%=dto.getQa_memid().substring(0,2) %>****
						<% }
						}%>	
						</td>
					<!--                       작성일자                                              -->		
						<td class="list_td"  width="15%" align="center"><%=dto.getQa_date().substring(0, 10) %></td>
					<!--                       조회수                                             -->		
						<td class="list_td" width="5%" align="center"><%=dto.getQa_hit() %></td>
					</tr>
					<% }//for%>
					
			</c:if>
				</tbody>
			</table>
				<div class="qa_bottom_btn"align="right">
					<!-- 로그인 검사  -->
					<button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath()%>/qa_write.do'">
					글쓰기
					</button>			
				</div>
			</div><!-- class="qa_body" -->
			<br>
			
			<c:if test="${empty code }">
			<div class="qa_paging" align="center">
			<c:if test="${page > block }">
				<!-- 현재페이지가 block(3)보다 큰경우,  예를들어 현재페이지가 4일 경우  -->
				<a href="<%=request.getContextPath()%>/qa_list.do?page=1">
				<img src="images/btn_first.png" alt="btn_first">
				</a>
				<!-- 1페이지로 이동 (최초페이지로 이동)-->
				<a
					href="<%=request.getContextPath() %>/qa_list.do?page=${startBlock-1}">
					<img src="images/btn_prev.png" alt="btn_prev">
				</a>
				<!-- 3페이지로 이동(이전페이지로 이동)  -->
			</c:if>
			<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${i == page }">
					<!-- startBlock == page, 현재페이지라면 -->
					<b><a
						href="<%=request.getContextPath()%>/qa_list.do?page=${i}">[${i }]</a></b>
				</c:if>
				<c:if test="${i != page }">
					<!-- startBlock != page, 현재재페이지가 아니라면 -->
					<a href="<%=request.getContextPath()%>/qa_list.do?page=${i}">[${i }]</a>
				</c:if>
			</c:forEach>

			<c:if test="${endBlock < allPage }">
				<!-- endBlock이 전체페이지 수보다 작은경우, 예를 들어 endBlock이 6페이지인경우 -->
				<a href="qa_list.do?page=${endBlock + 1 }">
				<img src="images/btn_next.png" alt="btn_next">
				</a>
				<!-- 7페이지로 이동(다음 페이지로 이동) -->
				<a href="qa_list.do?page=${allPage }">
				<img src="images/btn_last.png"alt="btn_last">
				</a>
				<!-- 마지막페이지로 이동  -->
			</c:if>
		</div>
		</c:if>
		<br>
		<div class="qa_search" align="center">
			<form method="post" action="<%=request.getContextPath() %>/qa_search.do">
			<select name="search_field">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="title_content">제목+내용</option>
			</select>
			<input type="text" name="search_word">
			<input type="submit" value="검색">
			</form>
		</div>

		</div><!-- class="qna_container  -->
	<jsp:include page="/include/shop_bottom.jsp"/>
</body>
</html>