<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>공지사항</title>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
			<link rel="stylesheet" href="../../../resources/noticeCss/list.css">
			<style>
				<table class="table table-hover">
				...
				</table>
			</style>
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
						<th>첨부파일</th>
					</tr>
			</thead>
			<tbody>
				<c:forEach items="${nList }" var="notice" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td><a href="/notice/detail?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a></td>
						<td>${notice.viewCount }</td>
						<td>${notice.nCreateDate }</td>
						<td>
							<c:if test="${!empty notice.noticeFilename }">O</c:if>	
							<c:if test="${empty notice.noticeFilename }">X</c:if>
						</td>
						
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</body>

		</html>