<%@page import="com.apc.model.CartDTO"%>
<%@page import="com.apc.model.CartDAO"%>
<%@page import="com.apc.model.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.apc.model.QaDTO"%>
<%@page import="com.apc.model.QaCategoryDTO"%>
<%@page import="com.apc.model.QaCategoryDAO"%>
<%@page import="com.apc.model.ProductDTO"%>
<%@page import="com.apc.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<QaDTO> search = (List<QaDTO>)request.getAttribute("Search");

	pageContext.setAttribute("List", search);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A게시판> "${search_word }"검색결과</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/qa.css">
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
		
		<div class="qa_body">
			<form class="qa_category" name="frm" method="post">
				<select id="code" name="qa_class" onchange="qa_change()">
					<option value="all">전체</option>
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
					for(int i=0; i<search.size(); i++){
						
						QaDTO dto = search.get(i);
					%>	
					<tr >
				<!--                   게시글번호                                              -->
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
							
					%>		
							<td  class="list_td"  width="10%" align="center">
							<a href="<%=request.getContextPath() %>/product_detail.do?num=<%= pDto.getPno() %>">
							<img src="<%=request.getContextPath() %>/upload/<%=arrImg[0]%>" width="70%" height="100%">
							</a>					
							</td>
					<% 		
						}//else 
					%>		
					<!--                    카테고리                                               -->
						<%
							QaCategoryDAO qcDao = QaCategoryDAO.getInstance();
							QaCategoryDTO qcDto = qcDao.getCategoryCont(dto.getQa_category());
						%>		
						<td class="list_td"  width="10%" align="center"><%=qcDto.getCategory_name() %></td>
						
					<!--                       제목                                               -->	
						<td class="list_td"  width="40%">
						<a href="<%=request.getContextPath() %>/qa_content.do?num=<%=dto.getQa_no()%>&page=${page}"><%=dto.getQa_title() %></a>
						</td>
					<!--                       작성자                                              -->		
						<td class="list_td"  width="15%" align="center"><%=dto.getQa_memid() %></td>
					<!--                       작성일자                                              -->		
						<td class="list_td"  width="15%" align="center"><%=dto.getQa_date().substring(0, 10) %></td>
					<!--                       조회수                                             -->		
						<td class="list_td"  width="5%" align="center"><%=dto.getQa_hit() %></td>
					</tr>
					<% }//for%>
				
			</c:if>
				</tbody>
			</table>
				<div class="qa_bottom_btn"align="right">
					<button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath()%>/qa_list.do'">
					목록
					</button>			
				</div>
			</div><!--class="qa_body"  -->
			<br>
			
			<div class="qa_paging" align="center">
			<c:if test="${page > block }">
				<!-- 현재페이지가 block(3)보다 큰경우,  예를들어 현재페이지가 4일 경우  -->
				<a href="<%=request.getContextPath()%>/qa_search.do?page=1&search_field=${search_field}&search_word=${search_word}">
				<img src="images/btn_first.png" alt="btn_first">
				</a>
				<!-- 1페이지로 이동 (최초페이지로 이동)-->
				<a
					href="<%=request.getContextPath() %>/qa_search.do?page=${startBlock-1}&search_field=${search_field}&search_word=${search_word}">
					<img src="images/btn_prev.png" alt="btn_prev">
				</a>
				<!-- 3페이지로 이동(이전페이지로 이동)  -->
			</c:if>
			<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${i == page }">
					<!-- startBlock == page, 현재페이지라면 -->
					<b><a
						href="<%=request.getContextPath()%>/qa_search.do?page=${i}&search_field=${search_field}&search_word=${search_word}">[${i }]</a></b>
				</c:if>
				<c:if test="${i != page }">
					<!-- startBlock != page, 현재재페이지가 아니라면 -->
					<a href="<%=request.getContextPath()%>/qa_search.do?page=${i}&search_field=${search_field}&search_word=${search_word}">[${i }]</a>
				</c:if>
			</c:forEach>

			<c:if test="${endBlock < allPage }">
				<!-- endBlock이 전체페이지 수보다 작은경우, 예를 들어 endBlock이 6페이지인경우 -->
				<a href="<%=request.getContextPath()%>/qa_search.do?page=${endBlock + 1 }&search_field=${search_field}&search_word=${search_word}">
				<img src="images/btn_next.png" alt="btn_next">
				</a>
				<!-- 7페이지로 이동(다음 페이지로 이동) -->
				<a href="<%=request.getContextPath()%>/qa_search.do?page=${allPage }&search_field=${search_field}&search_word=${search_word}">
				<img src="images/btn_last.png"alt="btn_last">
				</a>
				<!-- 마지막페이지로 이동  -->
			</c:if>
		</div><!-- class="qa_paging -->
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
		</div><!--class="qa_search"  -->

		</div><!-- class="qna_container  -->
		<jsp:include page="/include/shop_bottom.jsp"/>
</body>
</html>