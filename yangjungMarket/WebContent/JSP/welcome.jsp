<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.4.1.min.js"></script>
<script>
function clock() {
    var current = new Date();
    var hour = current.getHours();
    var time=0;
    var am_pm="AM";
    if(hour < 12){
    		time=hour;
    }
    else{
    	time=hour-12;
    	am_pm="PM";
    }
    divClock.innerText = "현재 접속시간 " + am_pm + " " + time +  "시" + current.getMinutes() + "분" + current.getSeconds() + "초";
    /* 새로고침 없이 시간을 실시간으로 표현하기 위해서 기본 내장 함수인 innerText함수를 사용해서 시간을 표현함 */
}
setInterval(clock, 500);/*내부적으로 새로 고침하는 시간 500 => 0.5초*/
</script>

<title>Insert title here</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%! String greeting ="웹 쇼핑몰에 오신 것을 환영합니다";
	String tagline = "Welcome to Web Market!";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3><%=tagline %></h3>
			
			<div id="divClock"></div></div>

	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>