<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>관리자 공지사항</title>
			<link rel="stylesheet" href="../../../resources/noticeCss/list.css">
			
		</head>

		<body>
			<jsp:include page="../header.jsp"></jsp:include>
			<br><br><br><br><br>
			<h1>공지사항</h1>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
			</thead>
			<tbody>
				<c:forEach items="${nList }" var="notice" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td><a href="/notice/detailAdmin?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a></td>
						<td>${notice.viewCount }</td>
						<td>${notice.nCreateDate }</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
			<div class="content-btn">
			<button>
				<a href="/notice/writeView">작성하기</a>
			</button>
		</div>
		</body>

		</html>