<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/mainCss/table.css"> 
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div>
	<h1>문의 목록 + 댓글 목록</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<!-- <th>질문의 번호(공유)</th> -->
				<th>질문자(공유)</th>
				<th>질문의 제목</th>
				<th>질문의 등록일</th>
				<!-- <th>답변의 번호</th> -->
				<!-- <th>답변의 내용</th> -->
				<th>답변의 등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="comment" items="${commentList }" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<%-- <td>${comment.questionNo }</td> --%>
					<td>${comment.userId }</td>
					<td><a href="/comment/select?questionNo=${comment.questionNo }">${comment.questionTitle }</a></td>
					<td>${comment.qCreateDate }</td>
					<%-- <td>${comment.commentNo }</td> --%>
					<%-- <td>${comment.commentContent }</td> --%>
					<td>${comment.commentDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>