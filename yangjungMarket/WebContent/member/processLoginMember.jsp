<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>
<sql:setDataSource
	url="jdbc:mysql://127.0.0.1:3306/springdb?serverTimezone=UTC"
	driver="com.mysql.cj.jdbc.Driver"
	user="root"
	password="1234"
	var="dataSource"></sql:setDataSource>
<sql:query dataSource="${dataSource }" var="resultSet">
	select * from member where id=? and password=?
	<sql:param value="<%=id %>"></sql:param>
	<sql:param value="<%=password %>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows }">
	<%
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="resultMember.jsp?msg=2"></c:redirect>
</c:forEach>
<c:redirect url="loginMember.jsp?error=1"></c:redirect>