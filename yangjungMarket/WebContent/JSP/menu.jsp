<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String)session.getAttribute("sessionId"); //���Ǿ��̵� �����ͼ� ������.
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
					<!-- c:url�� ����ּҸ� �����ּ�ó�� ��� �Ҽ��ְ� ���ִ� jstl ����
					���� ��� �α���â���� ��ǰ������ ���� ../JSP/products.jsp�� �Ǿ� ������
					welcome������ ./products.jsp�� �Ǵ°� ����ּ� 
					���� c:when ���� ���� ���̵� ������� ���̵� ǥ������ �ʰ� �ϰ� otherwise���� ���̵��� ǥ�����ְ� ��  
					if else �������� �����ϸ� �ǰ� when otherwise�� choose ���� �ȿ� �����ؾ���-->
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp" />">�α���</a></li> 
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/addMember.jsp" />">ȸ������</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%=sessionId%>��]</li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp" />">�α׾ƿ�</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/updateMember.jsp" />">ȸ�� ����</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/JSP/products.jsp" />">��ǰ ���</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/JSP/addProduct.jsp" />">��ǰ ���</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/JSP/editProduct.jsp?edit=update" />">��ǰ ����</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/JSP/editProduct.jsp?edit=delete" />">��ǰ ����</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/boardListAction.do?pageNum=1" />">�Խ���</a></li>

			</ul>
		</div>
	</div>
</nav>
</body>
</html>