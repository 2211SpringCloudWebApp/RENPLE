<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>관리자 - 예약 내역 리스트</title>
  <link rel="stylesheet" href="../../../resources/reservationCss/listAdmin.css">
  <meta charset="utf-8">
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
  <jsp:include page="../../header.jsp"></jsp:include>
  <div id="outter">
	  <h1>예약 내역 리스트</h1>
		  <table>
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
			    <tr onclick="location.href='/reservation/admin/adminReservationDetail?orderNo=${item.orderNo }'" style="cursor: pointer;">
			      <td>${item.orderNo }</td>
			      <td>${item.orderName }</td>
			      <td>${item.orderUserCount }</td>
			      <td>${item.reservationDate }</td>
			      <td>${item.productName }</td>
			      <td>${item.productPrice }</td>
			      <td>${item.orderDate }</td>
			      <td><a href="/reservation/admin/adminReservationDetail?orderNo=${item.orderNo }">상세조회</a></td>
			    </tr>
		    </c:forEach>
		  </table>
  </div>
  <jsp:include page="../../footer.jsp"></jsp:include>
  
</body>
</html>