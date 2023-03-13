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
	<form action="/question/update" method="post">
		<input type="hidden" name="questionNo" value="${qna.questionNo }">
		제목 : <input type="text" name="questionTitle" value="${qna.questionTitle }"><br>
		내용 : <textarea name="questionContent">${qna.questionContent }</textarea><br>
	    아이디 : <input type="text" name="userId" value="${qna.userId}" readonly> <br>
	    첨부파일 : <input type="file" name="questionFilename">&nbsp;&nbsp; ${qna.questionFilename} <br>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>