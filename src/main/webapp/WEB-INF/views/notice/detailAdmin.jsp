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
		<p>레플의 새로운 소식들과 유용한 정보들을 확인해 보세요.</p>
		<div id="inner">
			번호 : ${notice.noticeNo }<br>
			제목 : ${notice.noticeTitle }<br>
			작성자 : 관리자<br>
			작성일자 : ${notice.nCreateDate } <br> 
			내용 : ${notice.noticeContent }<br>
<!-- 			첨부파일이 있을 경우에만 첨부파일을 보여줄 수 있도록 하는 코드 -->
			<c:if test="${not empty notice.noticeFilename}">
				첨부파일 : ${notice.noticeFilename }
				<img class="img" src="../../../resources/noticeUploadFiles/${notice.noticeFilename }" alt="공지 이미지">
			</c:if>
		</div>
		<div class="content-btn">
			<button>
				<a href="/notice/listAdmin">목록</a>
			</button>
			<button>
				<a href="/notice/modifyView?noticeNo=${notice.noticeNo }">수정</a>
			</button>
			<button>
				<a href="javascript:void(0);" onclick="removeCheck(${notice.noticeNo });">삭제</a>
			</button>
		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>
	<script>
			function removeCheck(noticeNo) {
				if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/notice/remove?noticeNo="+noticeNo;
				}
			}
	</script>
</body>
</html>