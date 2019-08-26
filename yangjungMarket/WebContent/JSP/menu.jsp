<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String)session.getAttribute("sessionId"); //세션아이디를 가져와서 저장함.
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
					<!-- c:url는 상대주소를 절대주소처럼 사용 할수있게 해주는 jstl 문법
					예를 들어 로그인창에서 상품정보를 볼때 ../JSP/products.jsp가 되야 하지만
					welcome에서는 ./products.jsp가 되는게 상대주소 
					위의 c:when 에서 세션 아이디가 없을경우 아이디를 표시하지 않게 하고 otherwise에서 아이디값을 표현해주게 함  
					if else 구문으로 생각하면 되고 when otherwise는 choose 구문 안에 존재해야함-->
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