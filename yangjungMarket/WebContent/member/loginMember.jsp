<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<meta charset="EUC-KR">
<script type="text/javascript">
	function checkForm() {
		if(!document.newMember.id.value){
			alert("아이디를 입력하세요");
			return false;
		}
		if(!document.newMember.password.value){
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(document.newMember.password.value != document.newMember.password_confirm.value){
			alert("비밀번호를 동일하게 입력하세요 ");
			return false;
		}
	}
</script>
<title>로그인창</title>
</head>
<body>
<jsp:include page="../JSP/menu.jsp"></jsp:include>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">로그인</h1>
	</div>
</div>
<div class="container" align="center">
	<div class="col-md-4 col-md-offset-4">
		<h3 class="form-signin-heading">Please sign in</h3>
		<%
			String error=request.getParameter("error");
			if(error != null)
			{
				out.println("<div class='alert alert-danger'>");
				out.println("아이디와 비밀번호를 확인해주세요");
				out.println("</div>");
			}
		%>
		<form class="form-signin" action="processLoginMember.jsp" method="post">
			<div class="form-group">
				<label for="inputUserName" class="sr-only">User Name</label>
				<input type="text" class="form-control" placeholder="ID" name="id" required autofocus>				
			</div>
			<div class="form-group">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" class="form-control" placeholder="Password" name="password" required>
			</div>
			<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
		</form>
	</div>
</div>
</body>
</html>