<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>상품 리스트 조회</title>
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
	     <div id="outter">
		<h1 style="margin-top:100px; text-align: center;">상품 리스트 조회</h1>
		<div id="inner">
		<table class="table table-hover" style="margin-top: 100px;">
			<tr>
				<td></td>
			</tr>
		</table>
		</div>
		</div>
    </div>
    <jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>