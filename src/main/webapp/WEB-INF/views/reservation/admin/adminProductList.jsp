<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>관리자 - 상품 리스트 조회</title>
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
		<h1 style="margin-top:100px; text-align: center;">상품 리스트 조회</h1>
		<table class="table table-hover" style="margin-top: 100px;">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>가격</th>
				<th>설명</th>
				<th>크기</th>
				<th>최대인원</th>
				<th>최소인원</th>
				<th>등록일</th>
			</tr>
			<c:forEach items="${pList }" var="product" >
				<tr onclick="location.href='/reservation/admin/adminProductDetailView?productNo=${product.productNo }'" style="cursor: pointer;">
					<td>${product.productNo }</td>
					<td>${product.productName }</td>
					<td>${product.productPrice }</td>
					<td>${product.productDescription }</td>
					<td>${product.productSize }</td>
					<td>${product.productUserMax }</td>
					<td>${product.productUserMin }</td>
					<td>${product.pCreateDate }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8">
					<input type="button" value="상품등록" onclick="location.href='/reservation/admin/adminProductRegisterView'">
				</td>
			</tr>
		</table>
    </div>
    <jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>