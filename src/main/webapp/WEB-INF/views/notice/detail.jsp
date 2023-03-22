  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link rel="stylesheet" href="../../../resources/noticeCss/detail.css">
<style>
	#inner{
	padding-top: 2vh;
	padding-bottom: 2vh;
    border-bottom: 1px solid black;
	border-top: 1px solid black;
	height: 60vh;
	width: 60vw;
	line-height : 2vh;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div id="outter">
		<h1>공지사항 상세</h1>
		<p>렌플의 새로운 소식들과 유용한 정보들을 확인해 보세요.</p>
		<div id="inner">
			번호 : ${notice.noticeNo }<br> 
			제목 : ${notice.noticeTitle }<br>
			작성일자 : ${notice.nCreateDate }<br> 
			내용 : ${notice.noticeContent }<br>
			<div id="inner2">
	<!-- 			첨부파일이 있을 경우에만 첨부파일을 보여줄 수 있도록 하는 코드 -->
				<c:if test="${not empty notice.noticeFilename}">
					첨부파일 : ${notice.noticeFilename }<br>
					<img class="img" src="../../../resources/noticeUploadFiles/${notice.noticeFilename }" alt="공지 이미지">
				</c:if>
			</div>
		</div>
		<div class="content-btn">
			<button>
				<a href="/notice/view">목록으로 돌아가기</a>
			</button>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>