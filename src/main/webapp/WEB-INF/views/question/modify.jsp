<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 수정</title>
</head>
<body>
	<h1>문의사항 수정</h1>
	<form action="/question/modify" method="post">
		<input type="hidden" name="questionNo" value="${question.questionNo }">
		<a href="/question/detail?questionNo=${question.questionNo }">${question.questionTitle }</a>
		내용 : <textarea rows="" cols="" name="questionContent">${question.questionContent }</textarea><br>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>