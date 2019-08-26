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
	String sessionId = (String)session.getAttribute("sessionId");
	String id = request.getParameter("id");
	int first_stock=1;
	if(id == null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
%>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String productid=null;
	String name=null;
	String price=null;
	String stock=null;
	String check_productid="";
	int stock1 =1;
	int price1 =0;
	String sql="";
	String Driver = "com.mysql.cj.jdbc.Driver";
	String Url = "jdbc:mysql://localhost/springdb?serverTimezone=UTC";
	try {
		Class.forName(Driver);
		con = DriverManager.getConnection(Url, "root", "1234");
		sql = "select * from product where productId=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs= pstmt.executeQuery();
		while(rs.next())
		{
			productid=rs.getString("productId");
			name=rs.getString("name");
			price=rs.getString("unitprice");
		}
		rs.close();
		pstmt.close();
		con.close();
	} catch (Exception e) {
		System.out.println(sessionId);
		System.out.println(e);
	}
	System.out.println("1번 트라이문 종료");
	try{
		Class.forName(Driver);
		con = DriverManager.getConnection(Url, "root", "1234");
		sql="select * from cart where productId=? and userid1=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, sessionId);
		rs= pstmt.executeQuery();
		while(rs.next())
		{
			System.out.println("와일문 진입");
			check_productid=rs.getString("productId");
			price1 = Integer.parseInt(price);
			stock=rs.getString("stock");
		}
		rs.close();
		pstmt.close();
		con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	if(check_productid.equals(null)||check_productid.equals(""))
	{
		try{
			System.out.println("null 체크됨");
			Class.forName(Driver);
			con = DriverManager.getConnection(Url, "root", "1234");
			price1 = Integer.parseInt(price);
			sql="insert into cart(productId,name,price,stock,userid1) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, productid);
			pstmt.setString(2, name);
			pstmt.setInt(3, price1);
			pstmt.setInt(4, stock1);
			pstmt.setString(5, sessionId);
			pstmt.executeUpdate();
			rs.close();
			pstmt.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	else
	{
		try{
			System.out.println("null 체크 안됨");
			Class.forName(Driver);
			con = DriverManager.getConnection(Url, "root", "1234");
			stock1=Integer.parseInt(stock);
			stock1+=1;
			sql="update cart set stock=? where userid1=? and productId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, stock1);
			pstmt.setString(2, sessionId);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
			rs.close();
			pstmt.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
%>

<%
	response.sendRedirect("products.jsp");
%>
