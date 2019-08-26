<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:useBean id="productDAO" class="dto.ProductRepository" scope="session"></jsp:useBean>
<sql:setDataSource
	url="jdbc:mysql://127.0.0.1:3306/springdb?serverTimezone=UTC"
	driver="com.mysql.cj.jdbc.Driver"
	user="root"
	password="1234"
	var="dataSource"></sql:setDataSource>
	
<sql:query dataSource="${dataSource}" var="resultSet">
	select * from product 
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.4.1.min.js"></script>
<title>상품 목록</title>
</head>
<body>
<%
	String path ="C:/Users/yj-605-06/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/yangjungMarket/FileUpload/imgFiles";
%>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<c:forEach var="row" items="${resultSet.rows}">
			<div class="col-md-5">
				<img  src="../FileUpload/imgFiles/${row.filename}" width="200px" height="200px">
				<c:set var="productId" value='${row.productId }' />
				<h3><c:out value='${productId }' /></h3>
				<p><c:out value='${row.description}' />
				<p><c:out value='${row.unitPrice}' />원
				<p><a href="./product.jsp?id=${productId}"
				class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
			
		</div>
</c:forEach>	
	</div>
	<hr>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>