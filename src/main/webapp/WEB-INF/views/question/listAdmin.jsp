<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 목록</title>
<link rel="stylesheet" href="../../../resources/questionCss/listAdmin.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="outter">
		<h1>문의 목록</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
					<th>첨부파일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${qList }" var="question" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td><a href="/question/detailAdmin?questionNo=${question.questionNo }">${question.questionTitle }</a></td>
						<td>${question.qCreateDate }</td>
						<td>
							<c:if test="${!empty question.questionFilename }">O</c:if>	
							<c:if test="${empty question.questionFilename }">X</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>