  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link rel="stylesheet" href="../../../resources/noticeCss/detail.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div id="outter">
		<h1>공지사항 상세</h1>
		<p>렌플의 새로운 소식들과 유용한 정보들을 확인해 보세요.</p>
		<div id="inner">
			<div id="content1">
				번호 : ${notice.noticeNo }
			</div>
			<div id="content2">
				제목 : ${notice.noticeTitle }
			</div>
			<div id="content3">
				작성일자 : ${notice.nCreateDate }
			</div>
			<div id="content4">
				내용 : ${notice.noticeContent }
			</div>
			<div id="content5">
				<!-- 첨부파일이 있을 경우에만 첨부파일을 보여줄 수 있도록 하는 코드 -->
				<c:if test="${not empty notice.noticeFilename}">
					첨부파일 : ${notice.noticeFilename }<br>
					<img class="img" src="../../../resources/noticeUploadFiles/${notice.noticeFilename }" alt="공지 이미지">
				</c:if>
			</div>
		</div>
		<div class="content-btn">
			<button>
				<a href="/notice/view">목록</a>
			</button>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>