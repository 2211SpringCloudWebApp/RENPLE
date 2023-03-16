<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세</title>
<link rel="stylesheet"
	href="../../../resources/questionCss/detailAdmin.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="outter">
		<h1>문의사항 상세</h1>
		<div id="inner">
			<input type="hidden" name="questionNo" value="${question.questionNo}">
			제목 : ${question.questionTitle }<br> 
			내용 : ${question.questionContent }<br> 
			아이디 : ${question.userId }<br>
		<div>
          <img class="img" src="../../../resources/uploadFiles/${question.questionFilename} " alt="이미지"/>
        </div>
			<!-- 			첨부파일이 있을 경우에만 첨부파일을 보여줄 수 있도록 하는 코드 -->
			<%-- <c:if test="${not empty question.questionFilename}">
				첨부파일 : <a href="/question?questionNo=${qna.questionNo }">${question.questionFilename }</a><br>
				<img class="img" src="../../../resources/questionUploadFiles/${question.questionFilename }" alt="문의 이미지">
			</c:if>
			<c:url var="qModify" value="/question/detail">
				<c:param name="questionNo" value="${question.questionNo }"></c:param>
			</c:url> --%>
		</div>
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
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
			function removeCheck(questionNo) {
				if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/question/remove?questionNo="+questionNo;
				}
			}
		</script>
</body>
</html>