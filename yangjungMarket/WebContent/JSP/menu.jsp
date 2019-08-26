<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class ="navbar-brand" href="<c:url value="/JSP/welcome.jsp"/>">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp" />">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/addMember.jsp" />">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp" />">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/updateMember.jsp" />">회원 수정</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/JSP/products.jsp" />">상품 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/JSP/addProduct.jsp" />">상품 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/JSP/editProduct.jsp?edit=update" />">상품 수정</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/JSP/editProduct.jsp?edit=delete" />">상품 삭제</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/boardListAction.do?pageNum=1" />">게시판</a></li>

			</ul>
		</div>
	</div>
</nav>
</body>
</html>