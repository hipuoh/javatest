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
	String sessionId = (String)session.getAttribute("sessionId"); //세션아이디 저장
	String id = request.getParameter("id"); //상품 id 저장
	//int first_stock=1; 
	if(id == null || id.trim().equals("")){ //상품id가 없는경우 상품정보화면으로 연결
		response.sendRedirect("products.jsp");
		return;
	}
%>
<%
	/*
	복잡한 DB연결의 경우 JSTL로 했을때 특정경우 데이터베이스에 연결이 되지 않는 현상이 발견되어서
	기본 자바를 이용한 DB연결을 사용함.
	*/
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//상품의 정보를 임시로 저장하여 데이터베이스에 저장하기위한 변수들
	String productid=null;
	String name=null;
	int price=0;
	int stock=1; //상품의 갯수를 초기값을 1개로 잡아두기 위해서 1로 선언 및 초기화
	String check_productid="";
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
			price=rs.getInt("unitprice");
		}
		//Product 테이블에  접근하여 상품 정보를 변수에 저장함
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
			check_productid=rs.getString("productId");
			stock=rs.getInt("stock");
		}
		rs.close();
		pstmt.close();
		con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	//그후 장바구니 테이블에 위에서 저장해둔 상품ID와 유저정보(세션아이디)를 사용하여 값을 가져옴
	if(check_productid.equals(null)||check_productid.equals("")) 
		//프로덕트 아이디가 없다는것은 해당 유저의 장바구니목록에 장바구니에 담으려는 상품이 없다는 뜻이므로 처음 장바구니에 저장된다는 말
		//따라서 insert구문을 사용하여 데이터베이스 테이블에 저장함 
		//아닐경우는 이미 저장한 상품이라는 말이므로, 갯수만 증가 스켜주면됨
	{
		try{
			//System.out.println("null 체크됨");
			Class.forName(Driver);
			con = DriverManager.getConnection(Url, "root", "1234");
			sql="insert into cart(productId,name,price,stock,userid1) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, productid);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setInt(4, stock);
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
			//이미 장바구니에 담은 상품의 경우 update문으로 상품의 갯수만 가져와서 +1 해준뒤 업데이트해줌
			Class.forName(Driver);
			con = DriverManager.getConnection(Url, "root", "1234");
			stock+=1;
			sql="update cart set stock=? where userid1=? and productId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, stock);
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
