<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>이용자 조회</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
	a:after,
	a:link {
		text-decoration-line: none;
		/* color: black; */
	}
	}
</style>

<body>
	<h1>이용자 조회</h1>
	<div id="tableBox">
		<table class="table table-hover table-condensed">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>휴대번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${list }" varStatus="status">
					<tr>
						<td>${pi.totalCount - (pi.currentPage-1) * pi.boardLimit - status.index}</td>
						<td><a href="/user/select?userId=${user.userId }">${user.userId }</a></td>
						<td>${user.userPw }</td>
						<td>${user.userPhone }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<!-- 페이징 -->
					<td colspan="4" align="center">
						<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
							<c:url var="pageUrl" value="/user/selectAll">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<a href="${pageUrl }">
								<c:if test="${p eq pi.currentPage }">
									<span style="font-size: larger;">${p }</span>
								</c:if>
								<c:if test="${p ne pi.currentPage }">${p }</c:if>
							</a>
						<!-- 
						<a href="/user/selectAll?page=${p }"> 
							<c:if test="${p eq pi.currentPage }">${p }</c:if> 
							<c:if test="${p ne pi.currentPage }">${p }</c:if>
						</a>
						 -->
						</c:forEach>
					</td>
				</tr>
				<tr>
					<!-- 조건부 검색 부분 -->
				</tr>
			</tfoot>
		</table>
	</div>
</body>

</html>