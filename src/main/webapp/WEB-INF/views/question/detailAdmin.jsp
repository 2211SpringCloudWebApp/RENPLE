<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세</title>
<link rel="stylesheet" href="../../../resources/noticeCss/detail.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br><br>
<div id="outter">
	<h1>문의사항 상세</h1>
	<div id="inner">
	제목 : ${question.questionTitle }<br>
	내용 : ${question.questionContent }<br>
	아이디 : ${question.userId }<br>
	<c:url var="qModify" value="/question/modify">
		<c:param name="questionNo" value="${question.questionNo }"></c:param>
	</c:url>
	 <!-- 		<hr> -->
<!-- 		<!-- 	관리자가 답글을 작성하는 경우 --> -->
<!-- 		<h2>답글 작성</h2> -->
<!-- 		<form action="/comment/insert" method="post"> -->
<%-- 			<input type="hidden" name="userId" value="${question.userId }"> --%>
<%-- 			<input type="hidden" name="questionNo" value="${question.questionNo }"> --%>
<!-- 			<textarea rows="" cols="" name="commentContent"></textarea><br> -->
<!-- 				<button type="submit" class="content-btn">작성하기</button> -->
<!-- 		</form> -->
	</div>
	<div class="content-btn">
		<button>
			<a href="/question/viewAdmin">목록으로</a>
		</button>
	</div>
	</div>
</body>
</html>