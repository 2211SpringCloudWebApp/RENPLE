<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 수정</title>
<link rel="stylesheet" href="../../../resources/noticeCss/modify.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div id="outter">
	<h1>문의사항 수정</h1>
	<div id="inner">
	<form action="/question/update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="questionNo" value="${qna.questionNo }">
		제목 : <input type="text" name="questionTitle" value="${qna.questionTitle }"><br>
		내용 : <textarea name="questionContent">${qna.questionContent }</textarea><br>
	    아이디 : <input type="text" name="userId" value="${qna.userId}" readonly> <br>
		
		<c:if test="${qna.questionFilename eq null }">
		    첨부파일 : <input type="file" name="reloadFile" value="${qna.questionFilename }"><br>
		</c:if>
		<c:if test="${qna.questionFilename ne null }">
			첨부파일 : <a href="/question?questionNo=${qna.questionNo }">${qna.questionFilename }</a>
			<button>
				<a href="javascript:void(0);" onclick="removeCheckImg('${qna.questionFilename}', ${qna.questionNo});">파일삭제</a>
			</button>
			<img class="img" src="../../../resources/questionUploadFiles/${qna.questionFilename }" alt="문의 이미지">
		</c:if>
		<br>
		<div class="content-btn">
			<input type="submit" value="수정하기">
		</div>
	</form>
	</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
			function removeCheckImg(questionFilename, questionNo) {
				if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/question/deleteFile?questionFilename="+questionFilename+"&questionNo="+questionNo;
				}
			}
		</script>
</body>
</html>