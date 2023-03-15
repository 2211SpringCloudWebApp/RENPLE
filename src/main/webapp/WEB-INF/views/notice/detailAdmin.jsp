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
	번호 : ${notice.noticeNo } | 제목 : ${notice.noticeTitle } | 작성자 : 관리자 |
	작성일자 : ${notice.nCreateDate }
	<br> 내용 : ${notice.noticeContent }
	<br> 첨부파일 : ${notice.noticeFilename }
	<br>
	<c:url var="nModify" value="/notice/modifyView">
		<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
	</c:url>
	<a href="/notice/listAdmin">목록</a>
	<a href="${nModify }">수정</a>
	<a href="javascript:void(0);"
		onclick="removeCheck(${notice.noticeNo });">삭제</a>
	<script>
			function removeCheck(noticeNo) {
				if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/notice/remove?noticeNo="+noticeNo;
				}
			}
		</script>
</body>
</html>