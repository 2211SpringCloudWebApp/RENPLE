<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>예약 내역 상세 조회</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- [orderNo=1, orderName=박상은, orderPhone=01094111994, orderEmail=p9s9e9@naver.com, postCode=01044,
	 roadAddress=서울 강북구 삼양로136길 18, detailAddress=1202호, orderRequest=없어여, orderUserCount=18,
	  reservationDate=2023-3-27, orderDate=2023-03-16 11:14:51.247, productNo=1, productName=강남1호점,
	   productPrice=10, productDescription=강남역 3번출구 5분거리 위치, productSize=300평, productUserMax=80, 
	   productUserMin=20, productCreateDate=2023-03-16 11:13:28.111] -->
	<table class="table table-hover">
		<tr>
			<td>예약번호</td>
			<td>${order.orderNo }</td>
		</tr>
		<tr>
			<td>예약자</td>
			<td>${order.orderName }</td>
		</tr>
		<tr>
			<td>예약인원</td>
			<td>${order.orderUserCount }</td>
		</tr>
		<tr>
			<td>예약날짜</td>
			<td>${order.reservationDate }</td>
		</tr>
		<tr>
			<td>예약지점</td>
			<td>${order.productName }</td>
		</tr>
		<tr>
			<td>예약금액</td>
			<td>${order.productPrice }원</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>${order.postCode }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${order.roadAddress }</td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td>${order.detailAddress }</td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td>${order.orderPhone }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${order.orderEmail }</td>
		</tr>
		<tr>
			<td>결제날짜</td>
			<td>${order.orderDate }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
		       <input type="button" value="예약취소" onclick="location.href='/reservation/delete?orderNo=${order.orderNo}'" class='btn btn-warning'/>
		       <input type="button" value="리스트" onclick="location.href='/reservation/detail/reservationList'" class='btn btn-success'/>
		    </td>
		</tr>
	</table>
</body>
</html>