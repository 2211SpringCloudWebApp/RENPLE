<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>관리자 - 예약 내역 상세 조회</title>
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
		<h1 style="margin-top:100px; text-align: center;">예약 내역 상세 조회</h1>
		<table class="table table-hover" style="margin-top: 100px;">
			<tr>
				<td colspan="2" align="center">
			       <input type="button" value="예약취소" onclick="deleteCheck(${order.orderNo});" class='btn btn-warning'/>
			       <input type="button" value="리스트" onclick="location.href='/reservation/admin/adminReservationList'" class='btn btn-success'/>
			    </td>
			</tr>
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
				<td>요청사항</td>
				<td>
					<textarea cols="73" rows="7" style="resize: none;">${order.orderRequest }</textarea> 
				</td>
			</tr>
		</table>
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