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
			<div id="qna">
				<div id="question">
					<div class="img">
						<img src="../../../resources/img/question/question.gif" />
					</div>
					<div class="notImg">
						<input type="hidden" name="questionNo"
							value="${question.questionNo}"> 제목 :
						${question.questionTitle }<br> 내용 :
						${question.questionContent }<br> 아이디 : ${question.userId }<br>
						<!-- 			첨부파일이 있을 경우에만 첨부파일을 보여줄 수 있도록 하는 코드 -->
						<c:if test="${not empty question.questionFilename}">
						첨부파일 : ${question.questionFilename }
						<br>
							<img class="img"
								src="../../../resources/questionUploadFiles/${question.questionFilename }"
								alt="문의 이미지">
						</c:if>
					</div>
				</div>
				<div id="answer">
					<div class="notImg">
						<c:if test="${not empty question.commentContent }">
							<h1>답변 : ${question.commentContent }</h1>
						</c:if>
						<c:if test="${!not empty question.commentContent }">
							<h1>답변 : 없음</h1>
						</c:if>
					</div>
					<div class="img">
						<img src="../../../resources/img/question/answer.gif" />
					</div>
				</div>
			</div>
		</div>
		<div class="content-btn">
			<button>
				<a href="/question/view">목록으로</a>
			</button>
			<button>
				<a href="/question/modify?questionNo=${question.questionNo }">수정하기</a>
			</button>
			<button>
				<a href="javascript:void(0);"
					onclick="removeCheck(${question.questionNo });">삭제</a>
			</button>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
				function removeCheck(questionNo) {
					if (confirm("정말 삭제하시겠습니까?")) {
						location.href = "/question/remove?questionNo=" + questionNo;
					}
				}
			</script>
</body>

</html>