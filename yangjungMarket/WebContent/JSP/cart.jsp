<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dto.ProductRepository" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.File" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.4.1.min.js"></script>
<title>장바구니</title>
</head>
<body>
<%
	String sessionId = (String)session.getAttribute("sessionId");
//세션 아이디를 가져와서 해당 아이디의 장바구니 목록을 가져옴
%>
<sql:setDataSource
			url="jdbc:mysql://127.0.0.1:3306/springdb?serverTimezone=UTC"
			driver="com.mysql.cj.jdbc.Driver"
			user="root"
			password="1234"
			var="dataSource"></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="resultSet">
select * from cart where userid1=?
<sql:param value="<%=sessionId %>" />
<!-- 디비에 접속해서 유저명으로 검색해서 해당 유저의 정보만 표시할 수 있게 함 -->
</sql:query>
<jsp:include page="menu.jsp"></jsp:include>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">장바구니</h1>
	</div>
</div>
<div class="container">
	<div class="row">
		<table width="100%">
			<tr>
				<td align="left"><a href="./deleteCart.jsp?cartId=<%=sessionId %>" class="btn btn-danger">삭제하기</a></td>
				<td align="right"><a href="./shippingInfo.jsp?cartId=<%=sessionId %>" class="btn btn-success">주문하기</a></td>
			</tr>
		</table>
	</div>
	<div style="padding-top:50px">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<c:forEach var="row" items="${resultSet.rows }">
			<c:set var="total" value="${row.stock*row.price }" />
			<tr>
				<td><c:out value="${row.productId }" /> - <c:out value="${row.name }" /></td>
				<td><c:out value="${row.price }" /></td>
				<td><c:out value="${row.stock }" /></td>
				<td><c:out value="${total }" /></td>
				<td><a href="./removeCart.jsp?id=${row.userid1 }" class="badge badge-danger">삭제</a></td>
			</tr>
			<c:set var="sum" value="${sum+total }"/>
			</c:forEach>
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th>계산 :<c:out value="${sum }"/> </th>
				<th></th>
			</tr>
		</table>
		<a href="./products.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
	</div>
	<hr>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>