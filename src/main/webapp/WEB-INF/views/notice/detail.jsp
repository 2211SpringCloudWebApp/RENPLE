<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
</head>
<body>
	<h1>공지사항 상세</h1>
	<p>레플의 새로운 소식들과 유용한 정보들을 확인해 보세요.</p>
	번호 : ${notice.noticeNo } | 제목 : ${notice.noticeTitle } | 작성일자 :
	${notice.nCreateDate }
	<br> 내용 : ${notice.noticeContent }
	<br> 첨부파일 : ${notice.noticeFilename }
	<br>
	<a href="/notice/view">목록</a>
</body>
</html>