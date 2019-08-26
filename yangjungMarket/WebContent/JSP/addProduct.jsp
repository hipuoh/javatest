<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.4.1.min.js"></script>
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="./processAddProduct.jsp" enctype="multipart/form-data" class="form-horizontal" method="post" >
			<div class="form-group row">
					<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" name="productId" class="form-contol">
				</div>
			</div>
			<div class="form-group row">
					<label class="col-sm-2">상품 이름</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-contol">
				</div>
			</div>
			<div class="form-group row">
					<label class="col-sm-2">가 격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-contol">
				</div>
			</div>
			<div class="form-group row">
					<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-3">
					<textarea name="description" cols="50" row="2" class="form-contolr"></textarea>
				</div>
			</div>
			<div class="form-group row">
					<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-contol">
				</div>
			</div>
			<div class="form-group row">
					<label class="col-sm-2">분 류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-contol">
				</div>
			</div>
			<div class="form-group row">
					<label class="col-sm-2">재고 수량</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-contol">
				</div>
			</div>
			<div class="form-group row">
					<label class="col-sm-2">상 태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"> 신규제품
					<input type="radio" name="condition" value="Old"> 중고제품
					<input type="radio" name="condition" value="Refurbished"> 재생제품
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-3">
					<input type="file" name="filename">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		</form>
	</div>
</body>
</html>