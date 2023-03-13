<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
	<h1>공지사항 작성</h1>
	<form action="/notice/write" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="noticeTitle">
		내용 : <textarea name="noticeContent" rows="" cols=""></textarea>
<!-- 		첨부파일 : <input type="file" name="uploadFile"> -->
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>