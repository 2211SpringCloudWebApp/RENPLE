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
	첨부파일 : ${question.questionFilename }<br>
	
	<%-- <c:url var="qModify" value="/question/modify">
		<c:param name="questionNo" value="${question.questionNo }"></c:param>
	</c:url> --%>
	<a href="/question/view">목록으로</a>
	<a href="/question/modify?questionNo=${question.questionNo }">수정하기</a>
	<a href="javascript:void(0);" onclick="removeCheck(${question.questionNo });">삭제</a>
	<script>
			function removeCheck(questionNo) {
				if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/question/remove?questionNo="+questionNo;
				}
			}
		</script>
</body>
</html>