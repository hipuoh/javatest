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
	String saveFolder="FileUpload/imgFiles"; //이미지 파일을 저장할 경로 WebContent아래 파일을 생성해주어야 함
	ServletContext context = getServletContext(); //이미지 경로를 프로그램이 알게끔 변환시켜주는거라 생각하면 됨
	String savePath=context.getRealPath(saveFolder); //위에서 사용한 ServletContext로 저장경로를 만들어줌
	MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,encType,new DefaultFileRenamePolicy());
	//이미지를 저장할때 form에서 enctype으로 인코딩을 변환시켜 주었기 때문에 request.getParameter로는 null값 밖에 못 받아오기때문에 해당 형식인 MultipartRequest로 받아오기 위해서 생성해줌
	String productId = multiRequest.getParameter("productId");
	String name = multiRequest.getParameter("name");
	String unitPrice = multiRequest.getParameter("unitPrice");
	String description = multiRequest.getParameter("description");
	String manufacturer = multiRequest.getParameter("manufacturer");
	String category = multiRequest.getParameter("category");
	String unitsInStock = multiRequest.getParameter("unitsInStock");
	String condition = multiRequest.getParameter("condition");
	//파일의 경로는 getParameter 해주게 될경우 읽어오지 못하기 때문에 getOriginalFileName을 써서 파일의 이름을 가져옴
	String filename=multiRequest.getOriginalFileName("filename");
	try{
		//파일을 저장하기위해 try catch문을 사용하여 파일 저장을 하기위한 작업 수행 이부분은 외워야 할듯
		encType="utf-8";
		MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,encType,new DefaultFileRenamePolicy());
		String originalFileName = multi.getOriginalFileName("filename");
		String fileName = multi.getFilesystemName("filename");
		File file1 = multi.getFile("filename");
	}
	catch(IOException e)
	{
		e.printStackTrace();
	}
	
	response.sendRedirect("products.jsp");
%>
<!-- 위에서 받아온 데이터를 기반으로 데이터베이스에 insert 구문을 보냄 -->
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
