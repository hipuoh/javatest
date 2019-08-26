<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:useBean id="productDAO" class="dto.ProductRepository" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가 하시겠습니까?")){
			document.addForm.submit();
		}
		else{
			document.addForm.reset();
		}
		
		
	}
</script>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.4.1.min.js"></script>
<title>상품 상세 정보</title>
</head>
<%
		String id = request.getParameter("id");
%>

<sql:setDataSource
	url="jdbc:mysql://127.0.0.1:3306/springdb?serverTimezone=UTC"
	driver="com.mysql.cj.jdbc.Driver"
	user="root"
	password="1234"
	var="dataSource"></sql:setDataSource>
	
<sql:query dataSource="${dataSource}" var="resultSet">
	select * from product where productId=?
	<sql:param value="<%=id %>"></sql:param>
</sql:query>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="dispLay-3">상품 정보</h1>
		</div>
	</div>
	
	<div class ="container">
		<div class="row">
			<div class="col-md-6">
			<c:forEach var="row" items="${resultSet.rows}">
				<h3><c:out value='${row.name }' /></h3>
				<p><c:out value="${row.description }" />
				<p><b>상품코드 : </b><span class="badge badge-danger"><c:out value="${row.productId }" /></span></p>
				<p><b>제조사</b> : <c:out value="${row.manufacturer }" /></p>
				<p><b>분류</b> : <c:out value="${row.category }" /> </p>
				<p><b>재고 수</b> : <c:out value="${row.unitsInstock }" /> </p>
				<h4><c:out value="${row.unitprice }"/>원</h4>
				<form name="addForm" action="./addCart.jsp?id=<c:out value="${row.productId }" />" method="post">
				<p>
				<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a> 
				<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a> 
				<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
				</form>
				</p>
				
			</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>