<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 목록</title>
</head>
<link rel="stylesheet" href="../../../resources/questionCss/list.css">

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<br><br><br><br>
	<h1>문의 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${qList }" var="question" varStatus="i">
				<tr>
					<td>${i.count}</td>
					<td><a href="/question/detail?questionNo=${question.questionNo }">${question.questionTitle }</a></td>
					<td>${question.viewCount }</td>
					<td>${question.qCreateDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="content-btn">
		<button>
			<a href="/question/insert">문의사항 작성</a>
		</button>
	</div>
</body>
</html>