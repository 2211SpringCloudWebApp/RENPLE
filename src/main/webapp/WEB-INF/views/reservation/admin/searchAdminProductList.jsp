<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>관리자 - 상품 리스트 조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div
		style="margin: 0 auto !important; width: 1300px !important; margin-bottom: 100px !important;">
		<h1 style="margin-top: 100px; text-align: center;">상품 리스트 조회</h1>
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
			<c:forEach items="${pList }" var="product">
				<tr
					onclick="location.href='/reservation/admin/adminProductDetailView?productNo=${product.productNo }'"
					style="cursor: pointer;">
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

		</table>
		<div>
			<div id="select">
				<form action="/reservation/admin/adminSearchProduct" method="get">
					<select name="searchCondition">
						<option value="all">전체</option>
						<option value="number">번호</option>
						<option value="product">지점</option>
					</select> <input type="hidden" name="userId" value="${userId }"> <input
						type="text" name="searchValue" value="${keyword }"
						placeholder="검색"> <input type="submit" id="search-btn"
						name="search-btn" value="검색"> <input type="button"
						value="상품등록"
						onclick="location.href='/reservation/admin/adminProductRegisterView'">
					<c:if test="${pi.currentPage - 1 != 0}">
						<a href="/reservation/admin/adminSearchProdctList?page=1"
							class="naviBtn"> ◀️◀️ </a>
					</c:if>
					<!--'<' 누르면 현재페이지 -1 한 페이지를 보여주기 -->
					<c:if test="${pi.currentPage - 1 != 0}">
						<a
							href="/reservation/admin/adminSearchProdctList?page=${pi.currentPage - 1 }"
							class="naviBtn"> ◀️ </a>
					</c:if>
					<c:if test="${pi.currentPage - 1 == 0}">
						<a href="javascript:void(0)" class="naviBtn"> ◀️ </a>
					</c:if>
					<!--ㄴ 현재페이지 - 1 해서 0이 아닐때만 이전으로 이동 0 이면 a링크 동작 x -->
					<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
						<c:url var="pageUrl"
							value="/reservation/admin/adminSearchProdctList">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
						<a href="${pageUrl }" class="naviBtn">${p }</a>&nbsp;
						</c:forEach>
					<!--현재페이지 + 1 이 최대페이지랑 똑같을때까지 '>' 이걸 보여주겠다 -->
					<c:if test="${pi.currentPage + 1 <= pi.maxPage}">
						<a
							href="/reservation/admin/adminSearchProdctList?page=${pi.currentPage + 1 }"
							class="naviBtn"> ▶️ </a>
					</c:if>
					<!--근데 현재페이지가 최대페이지랑 같다면 a링크는 동작하지 x -->
					<c:if test="${pi.currentPage == pi.maxPage}">
						<a href="javascript:void(0)" class="naviBtn"> ▶️ </a>
					</c:if>
					<c:if test="${pi.currentPage + 1 <= pi.maxPage}">
						<a
							href="/reservation/admin/adminSearchProdctList?page=${pi.maxPage }"
							class="naviBtn"> ▶️▶️ </a>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>