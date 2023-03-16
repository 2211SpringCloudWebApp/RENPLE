<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>예약 내역 리스트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
  
  <jsp:include page="../../header.jsp"></jsp:include>
  <h1 style="margin-top:100px; text-align: center;">예약 내역 리스트</h1>
  <table class="table table-hover">
    <tr>
      <th>예약번호</th>
      <th>예약자</th>
      <th>예약인원</th>
      <th>예약날짜</th>
      <th>상품이름</th>
      <th>상품가격</th>
      <th>결제날짜</th>
      <th>상세조회</th>
    </tr>
    <c:forEach items="${rList }" var="item" >
	    <tr onclick="location.href='/reservation/detail/reservationDetail?orderNo=${item.orderNo }'" style="cursor: pointer;">
	      <td>${item.orderNo }</td>
	      <td>${item.orderName }</td>
	      <td>${item.orderUserCount }</td>
	      <td>${item.reservationDate }</td>
	      <td>${item.productName }</td>
	      <td>${item.productPrice }</td>
	      <td>${item.orderDate }</td>
	      <td><a href="/reservation/detail/reservationDetail?orderNo=${item.orderNo }">상세조회</a></td>
	    </tr>
    </c:forEach>
  </table>
  <jsp:include page="../../footer.jsp"></jsp:include>
  

</body>
</html>