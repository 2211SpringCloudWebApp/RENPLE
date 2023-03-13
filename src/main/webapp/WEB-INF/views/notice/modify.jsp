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
	<form action="/notice/modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
		<input type="hidden" name="noticeFilename" value="${notice.noticeFilename }">
		<input type="hidden" name="noticeFilepath" value="${notice.noticeFilepath }">
		제목 : <input type="text" name="noticeTitle" value="${notice.noticeTitle }"> <br>
		내용 : <textarea rows="10" cols="50" name="noticeContent">${notice.noticeContent }</textarea><br>
		첨부파일 : <input type="file" name="reloadFile"><br>
		<br>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>