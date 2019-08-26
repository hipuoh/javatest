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
    divClock.innerText = "���� ���ӽð� " + am_pm + " " + time +  "��" + current.getMinutes() + "��" + current.getSeconds() + "��";
    /* ���ΰ�ħ ���� �ð��� �ǽð����� ǥ���ϱ� ���ؼ� �⺻ ���� �Լ��� innerText�Լ��� ����ؼ� �ð��� ǥ���� */
}
setInterval(clock, 500);/*���������� ���� ��ħ�ϴ� �ð� 500 => 0.5��*/
</script>

<title>Insert title here</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%! String greeting ="�� ���θ��� ���� ���� ȯ���մϴ�";
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