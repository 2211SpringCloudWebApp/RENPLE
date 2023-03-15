<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link rel="stylesheet" href="../../resources/noticeCss/modify.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br><br>
<div id="outter">
	<h1>공지사항 수정</h1>
	<div id="inner">
	<form action="/notice/modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
		<input type="hidden" name="noticeFilename" value="${notice.noticeFilename }">
		<input type="hidden" name="noticeFilepath" value="${notice.noticeFilepath }">
		제목 : <input type="text" name="noticeTitle" value="${notice.noticeTitle }"> <br>
		내용 : <textarea rows="10" cols="50" name="noticeContent">${notice.noticeContent }</textarea><br>
		첨부파일 : <input type="file" name="reloadFile"><br>
		<br>
		<div class="content-btn">
			<input type="submit" value="수정하기">
		</div>
	</form>
		</div>
		</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>