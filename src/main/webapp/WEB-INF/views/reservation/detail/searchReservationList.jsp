<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>예약 내역 리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="../../header.jsp"></jsp:include>
	<div
		style="margin: 0 auto !important; width: 1300px !important; box-sizing: border-box; height: calc(100vh - 72px);">
		<h1 style="margin-top: 100px; text-align: center;">예약 내역 리스트</h1>
		<table class="table table-hover">
			<tr>
				<th>예약번호</th>
				<th>예약자</th>
				<th>예약인원</th>
				<th>예약날짜</th>
				<th>지점</th>
				<th>상품가격</th>
				<th>결제날짜</th>
				<th>상세조회</th>
			</tr>
			<c:forEach items="${rList }" var="item">
				<tr
					onclick="location.href='/reservation/detail/reservationDetail?orderNo=${item.orderNo }'"
					style="cursor: pointer;">
					<td>${item.orderNo }</td>
					<td>${item.orderName }</td>
					<td>${item.orderUserCount }</td>
					<td>${item.reservationDate }</td>
					<td>${item.productName }</td>
					<td>${item.productPrice }</td>
					<td>${item.orderDate }</td>
					<td><a
						href="/reservation/detail/reservationDetail?orderNo=${item.orderNo }">상세조회</a></td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<div id="select">
				<form action="/reservation/detail/searchReservation" method="get"
					style="text-align: center">
					<select name="searchCondition">
						<option value="all"
							<c:if test="${searchBoard.searchCondition == 'all' }">selected</c:if>>전체</option>
						<option value="writer"
							<c:if test="${searchBoard.searchCondition == 'writer' }">selected</c:if>>예약자</option>
						<option value="product"
							<c:if test="${searchBoard.searchCondition == 'product' }">selected</c:if>>지점</option>
					</select> <input type="hidden" name="userId" value="${userId }"> <input
						type="text" name="searchValue" value="${searchBoard.searchValue }"
						placeholder="검색"> <input type="submit" id="search-btn"
						name="search-btn" value="검색">
					<c:if test="${pi.currentPage - 1 != 0}">
						<a
							href="/reservation/detail/searchReservation?page=1&searchValue=${searchBoard.searchValue }&searchCondition=${searchBoard.searchCondition }"
							class="naviBtn"> ◀️◀️ </a>
					</c:if>
					<!--'<' 누르면 현재페이지 -1 한 페이지를 보여주기 -->
					<c:if test="${pi.currentPage - 1 != 0}">
						<a
							href="/reservation/detail/searchReservation?page=${pi.currentPage - 1 }&searchValue=${searchBoard.searchValue }&searchCondition=${searchBoard.searchCondition }"
							class="naviBtn"> ◀️ </a>
					</c:if>
					<c:if test="${pi.currentPage - 1 == 0}">
						<a href="javascript:void(0)" class="naviBtn"> ◀️ </a>
					</c:if>
					<!--ㄴ 현재페이지 - 1 해서 0이 아닐때만 이전으로 이동 0 이면 a링크 동작 x -->
					<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
						<c:url var="pageUrl" value="/reservation/detail/searchReservation">
							<c:param name="page" value="${p }"></c:param>
							<c:param name="searchValue" value="${searchBoard.searchValue }"></c:param>
							<c:param name="searchCondition"
								value="${searchBoard.searchCondition }"></c:param>
						</c:url>
						<a href="${pageUrl }" class="naviBtn">${p }</a>&nbsp;
						</c:forEach>
					<!--현재페이지 + 1 이 최대페이지랑 똑같을때까지 '>' 이걸 보여주겠다 -->
					<c:if test="${pi.currentPage + 1 <= pi.maxPage}">
						<a
							href="/reservation/detail/searchReservation?page=${pi.currentPage + 1 }&searchValue=${searchBoard.searchValue }&searchCondition=${searchBoard.searchCondition }"
							class="naviBtn"> ▶️ </a>
					</c:if>
					<!--근데 현재페이지가 최대페이지랑 같다면 a링크는 동작하지 x -->
					<c:if test="${pi.currentPage == pi.maxPage}">
						<a href="javascript:void(0)" class="naviBtn"> ▶️ </a>
					</c:if>
					<c:if test="${pi.currentPage + 1 <= pi.maxPage}">
						<a
							href="/reservation/detail/searchReservation?page=${pi.maxPage }&searchValue=${searchBoard.searchValue }&searchCondition=${searchBoard.searchCondition }"
							class="naviBtn"> ▶️▶️ </a>
					</c:if>
				</form>
			</div>
		</div>




	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>

</body>
</html>