<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="../../../resources/noticeCss/list.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="outter">
		<h1>공지사항</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${nList }" var="notice" varStatus="i">
					<tr onclick="location.href='/notice/detail?noticeNo=${notice.noticeNo }'"style="cursor: pointer;">
						<td>${i.count}</td>
						<td>${notice.noticeTitle }</td>
						<td>${notice.nCreateDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>