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
	</div>
	<div class="content-btn">
		<button>
			<a href="/question/viewAdmin">목록으로</a>
		</button>
	</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>