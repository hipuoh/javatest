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
<%
	String encType="euc-kr";
	int maxSize= 5*1024*1024;
	String saveFolder="FileUpload/imgFiles";
	ServletContext context = getServletContext();
	String savePath=context.getRealPath(saveFolder);
	MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,encType,new DefaultFileRenamePolicy());
	String productId = multiRequest.getParameter("productId");
	String name = multiRequest.getParameter("name");
	String unitPrice = multiRequest.getParameter("unitPrice");
	String description = multiRequest.getParameter("description");
	String manufacturer = multiRequest.getParameter("manufacturer");
	String category = multiRequest.getParameter("category");
	String unitsInStock = multiRequest.getParameter("unitsInStock");
	String condition = multiRequest.getParameter("condition");
	String filename=multiRequest.getOriginalFileName("filename");
	try{
		encType="utf-8";
		MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,encType,new DefaultFileRenamePolicy());
		String originalFileName = multi.getOriginalFileName("filename");
		String fileName = multi.getFilesystemName("filename");
		File file1 = multi.getFile("filename");
		//String contents = multi.getParameter("");
	}
	catch(IOException e)
	{
		e.printStackTrace();
	}
	
	response.sendRedirect("products.jsp");
%>
<sql:setDataSource
	url="jdbc:mysql://127.0.0.1:3306/springdb?serverTimezone=UTC"
	driver="com.mysql.cj.jdbc.Driver"
	user="root"
	password="1234"
	var="dataSource"></sql:setDataSource>
<sql:update dataSource="${dataSource}" var="resultSet">
	INSERT INTO product VALUES (?,?,?,?,?,?,?,?,?)
	<sql:param value="<%=productId %>"></sql:param>
	<sql:param value="<%=name %>"></sql:param>
	<sql:param value="<%=unitPrice %>"></sql:param>
	<sql:param value="<%=description %>"></sql:param>
	<sql:param value="<%=category %>"></sql:param>
	<sql:param value="<%=manufacturer %>"></sql:param>
	<sql:param value="<%=unitsInStock %>"></sql:param>
	<sql:param value="<%=condition %>"></sql:param>
	<sql:param value="<%=filename %>"></sql:param>
</sql:update>