<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">


	/* 폰트 적용해야 됌 */
	.left_bar > a {
		
		font-size: 15px;
		display: flex;
		flex-direction: column;
		font-weight: 900;
		line-height: 2.3;
		font-family: Noto Sans KR;
	}

</style>
<link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Noto+Sans+KR:wght@500&family=Source+Code+Pro&family=Titillium+Web:ital,wght@0,400;1,300&family=Ubuntu&display=swap" rel="stylesheet">

</head>
<body>			<!-- id 부분 고쳐야 함. -->

	<div class="left_bar">
		<a href="<%=request.getContextPath() %>/member_myPage.do?id=<%=session.getAttribute("member_id")%>">마이페이지</a>
		<a>회원정보관리</a>
		<a href="<%=request.getContextPath() %>/member_updatePwd.do?id=<%=session.getAttribute("member_id")%>">비밀번호관리</a>
		<a>적립금관리</a>
		<a href="<%=request.getContextPath() %>/member_orderView.do?id=<%=session.getAttribute("member_id")%>">구매내역</a>
		<a href="<%=request.getContextPath() %>/member_orderCancelView.do?id=<%=session.getAttribute("member_id")%>">취소/반품조회</a>
		<a href="<%=request.getContextPath() %>/member_addrView.do?id=<%=session.getAttribute("member_id")%>">배송지관리</a>
		<a href="<%=request.getContextPath() %>/member_contactView.do?id=<%=session.getAttribute("member_id")%>">온라인상담</a>
		<a href="<%=request.getContextPath() %>/memberLogout.do">로그아웃</a>
	</div>
</body>
</html>