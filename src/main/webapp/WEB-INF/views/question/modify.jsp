<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 수정</title>
<link rel="stylesheet" href="../../resources/noticeCss/modify.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br><br>
<div id="outter">
	<h1>문의사항 수정</h1>
	<div id="inner">
	<form action="/question/update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="questionNo" value="${qna.questionNo }">
		제목 : <input type="text" name="questionTitle" value="${qna.questionTitle }"><br>
		내용 : <textarea name="questionContent">${qna.questionContent }</textarea><br>
	    아이디 : <input type="text" name="userId" value="${qna.userId}" readonly> <br>
	    첨부파일 : <input type="file" name="reloadFile">&nbsp;&nbsp; ${qna.questionFilename} <br>
		<br>
		<div class="content-btn">
			<input type="submit" value="수정하기">
		</div>
	</form>
	</div>
	</div>
</body>
</html>