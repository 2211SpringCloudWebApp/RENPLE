<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>관리자 - 예약 내역 상세 조회</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="../../../resources/reservationCss/detailAdmin.css">
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="outter">
		<h1>예약 내역 상세 조회</h1>
		<div id="inner">
		<table>
			<tr>
				<td>예약번호 : </td>
				<td>${order.orderNo }</td>
			</tr>
			<tr>
				<td>예약자 : </td>
				<td>${order.orderName }</td>
			</tr>
			<tr>
				<td>예약인원 : </td>
				<td>${order.orderUserCount }</td>
			</tr>
			<tr>
				<td>예약날짜 : </td>
				<td>${order.reservationDate }</td>
			</tr>
			<tr>
				<td>예약지점 : </td>
				<td>${order.productName }</td>
			</tr>
			<tr>
				<td>예약금액 : </td>
				<td>${order.productPrice }원</td>
			</tr>
			<tr>
				<td>우편번호 : </td>
				<td>${order.postCode }</td>
			</tr>
			<tr>
				<td>주소 : </td>
				<td>${order.roadAddress }</td>
			</tr>
			<tr>
				<td>상세주소 : </td>
				<td>${order.detailAddress }</td>
			</tr>
			<tr>
				<td>휴대폰 : </td>
				<td>${order.orderPhone }</td>
			</tr>
			<tr>
				<td>이메일 : </td>
				<td>${order.orderEmail }</td>
			</tr>
			<tr>
				<td>결제날짜 : </td>
				<td>${order.orderDate }</td>
			</tr>
			<tr>
				<td>요청사항 : </td>
				<td>
					<textarea cols="73" rows="7" style="resize: none;">${order.orderRequest }</textarea> 
				</td>
			</tr>
		</table>
		</div>
			<div class="content-btn">
				<input type="button" value="예약취소" onclick="deleteCheck(${order.orderNo});" class='btn btn-warning'/>
				<input type="button" value="리스트" onclick="location.href='/reservation/admin/adminReservationList'" class='btn btn-success'/>
			</div>
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		function deleteCheck(orderNo){
			if(confirm("예약을 취소하시겠습니까?")){
				location.href="/reservation/adminDelete?orderNo="+orderNo;
			} 
		}
	</script>
</body>
</html>