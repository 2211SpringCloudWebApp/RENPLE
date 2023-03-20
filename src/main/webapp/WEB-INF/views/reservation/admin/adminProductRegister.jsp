<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>관리자 - 상품 등록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 부트스트랩 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div style="margin: 0 auto !important;
	     width: 1300px !important;
	     margin-bottom: 100px !important;">
		<h1 style="margin-top:100px; text-align: center;">상품 등록</h1>
		<form action="/reservation/admin/adminProductRegister" method="POST">
			<table class="table table-hover" style="margin-top: 100px;">
				<tr>
					<td>이름</td>
					<td><input type="text" name="productName"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="productPrice"></td>
				</tr>
				<tr>
					<td>설명</td>
					<td><input type="text" name="productDescription"></td>
				</tr>
				<tr>
					<td>크기</td>
					<td><input type="text" name="productSize"></td>
				</tr>
				<tr>
					<td>최대인원</td>
					<td><input type="text" name="productUserMax"></td>
				</tr>
				<tr>
					<td>최소인원</td>
					<td><input type="text" name="productUserMin"></td>
				</tr>
				<tr>
					<td colspan="6">
						<input type="submit" value="등록">
						<input type="reset" value="초기화">
						<input type="button" value="리스트" onclick="location.href='/reservation/admin/adminProductList'">
					</td>
				</tr>
			</table>
		</form>
    </div>
    <jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>