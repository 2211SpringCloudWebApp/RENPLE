<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link rel="stylesheet" href="../../resources/noticeCss/modify.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br><br>
<div id="outter">
	<h1>공지사항 수정</h1>
	<div id="inner">
	<form action="/notice/modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
		제목 : <input type="text" name="noticeTitle" value="${notice.noticeTitle }"> <br>
		내용 : <textarea rows="10" cols="50" name="noticeContent">${notice.noticeContent }</textarea><br>	
		
		<c:if test="${notice.noticeFilename eq null }">
			파일 : <input type="file" name="reloadFile" value="${notice.noticeFilename }">
		</c:if>
		<c:if test="${notice.noticeFilename ne null }">
			첨부파일 : <a href="/notice?noticeNo=${notice.noticeNo }">${notice.noticeFilename }</a>
			<button>
				<a href="javascript:void(0);" onclick="removeCheckImg('${notice.noticeFilename}', ${notice.noticeNo});">파일삭제</a>
			</button>
			<img class="img" src="../../../resources/noticeUploadFiles/${notice.noticeFilename }" alt="공지 이미지">			
		</c:if>
		
		
		<br>
		<div class="content-btn">
			<input type="submit" value="수정하기">
		</div>
	</form>
		</div>
		</div>
		<script>
			function removeCheckImg(noticeFilename, noticeNo) {
				if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/notice/removeFile?noticeFilename="+noticeFilename+"&noticeNo="+noticeNo;
				}
			}
		</script>
</body>
</html>