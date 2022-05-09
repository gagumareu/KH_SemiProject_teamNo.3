<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>			<!-- id 부분 고쳐야 함. -->
	<h4><a href="<%=request.getContextPath() %>/member_myPage.do?mem_id=tlsruddus">마이페이지</a></h4>
	<h4><a href="<%=request.getContextPath() %>/member_confirmPsw.do?mem_id=tlsruddus">회원정보관리</a></h4>
	<h4><a href="<%=request.getContextPath() %>/member/pswUpdate.jsp">비밀번호관리</a></h4>
	<h4><a href="<%=request.getContextPath() %>/member/mileageView.jsp">적립금관리</a></h4>
	<h4><a href="<%=request.getContextPath() %>/member_orderView.do?mem_id=tlsruddus">구매내역</a></h4>
	<h4><a href="<%=request.getContextPath() %>/member_orderCancelView.do?mem_id=tlsruddus">취소/반품조회</a></h4>
	<h4><a href="<%=request.getContextPath() %>/member_addrView.do?mem_id=tlsruddus">배송지관리</a></h4>
	<h4><a href="<%=request.getContextPath() %>/member_contactView.do?mem_id=tlsruddus">온라인상담</a></h4>
	<h4><a href="<%=request.getContextPath() %>/member/logout.jsp">로그아웃</a></h4>
</body>
</html>