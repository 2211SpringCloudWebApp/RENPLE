<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항</title>
<link rel="stylesheet" href="../../../resources/noticeCss/list.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="outter">
		<h1>공지사항</h1>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
					<th>첨부파일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${nList }" var="notice" varStatus="i">
					<tr onclick="location.href='/notice/detailAdmin?noticeNo=${notice.noticeNo }'"style="cursor: pointer;">
						<td>${i.count}</td>
						<td>${notice.noticeTitle }</td>
						<td>${notice.viewCount }</td>
						<td>${notice.nCreateDate }</td>
						<td>
							<c:if test="${!empty notice.noticeFilename }">O</c:if>
							<c:if test="${empty notice.noticeFilename }">X</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="content-btn">
			<button>
				<a href="/notice/writeView">작성하기</a>
			</button>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>