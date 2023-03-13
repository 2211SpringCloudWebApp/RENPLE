<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세</title>
</head>
<body>
	<h1>문의사항 상세</h1>
	제목 : ${question.questionTitle }<br>
	내용 : ${question.questionContent }<br>
	아이디 : ${question.userId }<br>
	<c:url var="qModify" value="/question/modify">
		<c:param name="questionNo" value="${question.questionNo }"></c:param>
	</c:url>
	<a href="/question/viewAdmin">목록으로</a>
	<a>댓글 달기</a>
</body>
</html>