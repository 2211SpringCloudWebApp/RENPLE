<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<h1>공지사항 수정</h1>
	<form action="/question/modify" method="post">
		<input type="hidden" name="questionNo" value="${question.questionNo }">
		제목 : <input type="text" name="questionTitle" value="${question.questionTitle }"><br>
		내용 : <textarea rows="" cols="" name="questionContent" value="${question.questionContent }"></textarea><br>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>