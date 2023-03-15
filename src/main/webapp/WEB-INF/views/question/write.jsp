<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 작성</title>
<link rel="stylesheet" href="../../resources/noticeCss/write.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br><br>
	<div id="outter">
	<h1>문의사항 작성</h1>
	<div id="inner">
	<form action="/question/insert" method="post" enctype="multipart/form-data">
	<input type="hidden" value="${sessionScope.user}" name="userId">
		제목 : <input type="text" name="questionTitle"> <br>
		내용 : <textarea rows="" col="" name="questionContent"></textarea> <br>
		첨부파일 : <input type="file" name="uploadFile"><br><br>
		<div class="content-btn">
			<input type="submit" value="작성완료">
			<input type="reset" value="취소">
			</div>
	</form>
	</div>
	</div>
</body>
</html>