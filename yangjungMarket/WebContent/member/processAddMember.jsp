<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy");
	String month = request.getParameter("birthmm");
	String day = request.getParameter("birthdd");
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String birth = year + "/" + month + "/" + day;
	String mail = mail1 + "@" + mail2;
	
	Date currnetDateTime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currnetDateTime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currnetDateTime.getTime());
%>

<sql:setDataSource
	url="jdbc:mysql://127.0.0.1:3306/springdb?serverTimezone=UTC"
	driver="com.mysql.cj.jdbc.Driver"
	user="root"
	password="1234"
	var="dataSource"></sql:setDataSource>
<sql:update dataSource="${dataSource}" var="resultSet">
	INSERT INTO member VALUES (?,?,?,?,?,?,?,?,?)
	<sql:param value="<%=id %>"></sql:param>
	<sql:param value="<%=password %>"></sql:param>
	<sql:param value="<%=name %>"></sql:param>
	<sql:param value="<%=gender %>"></sql:param>
	<sql:param value="<%=birth %>"></sql:param>
	<sql:param value="<%=mail %>"></sql:param>
	<sql:param value="<%=phone %>"></sql:param>
	<sql:param value="<%=address %>"></sql:param>
	<sql:param value="<%=timestamp %>"></sql:param>
</sql:update>
<c:if test="${resultSet>=1 }">
	<c:redirect url="resultMember.jsp?msg=1"></c:redirect>
</c:if>