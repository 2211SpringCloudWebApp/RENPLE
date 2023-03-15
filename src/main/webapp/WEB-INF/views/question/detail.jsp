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
	<div id="outter">
	<h1>문의사항 상세</h1>
	<div id="inner">
	제목 : ${question.questionTitle }<br>
	내용 : ${question.questionContent }<br>
	아이디 : ${question.userId }<br>
	첨부파일 : ${question.questionFilename }<br>
	<br>
	
	<div class="content-btn">
		<button>
			<a href="/question/view">목록으로</a>
		</button>
		<button>
			<a href="/question/modify?questionNo=${question.questionNo }">수정하기</a>
		</button>
		<button>
			<a href="javascript:void(0);" onclick="removeCheck(${question.questionNo });">삭제</a>
		</button>
	</div>
	
	</div>
	</div>
	<script>
			function removeCheck(questionNo) {
				if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/question/remove?questionNo="+questionNo;
				}
			}
		</script>
</body>
</html>