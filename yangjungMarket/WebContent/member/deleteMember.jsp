<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
<sql:setDataSource
	url="jdbc:mysql://127.0.0.1:3306/springdb?serverTimezone=UTC"
	driver="com.mysql.cj.jdbc.Driver"
	user="root"
	password="1234"
	var="dataSource" />
<sql:update dataSource="${dataSource }" var="resultSet">
	Delete from member where id= ?
	<sql:param value="<%=sessionId %>" />
</sql:update>
<c:if test="${resultSet>=1 }">
	<c:import var="url" url="./logoutMember.jsp" />
	<c:redirect url="./resultMember.jsp"></c:redirect>
</c:if>