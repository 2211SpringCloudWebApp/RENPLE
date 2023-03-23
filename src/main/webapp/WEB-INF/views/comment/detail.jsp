<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 답변</title>
<link rel="stylesheet"
	href="../../../resources/questionCss/detailAdmin.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="outter">
		<h1>문의 답변</h1>
		<div id="inner">
			<div id="contents">
				<div id="content1">
						<div id="content11">
							아이디 : ${question.userId }
						</div>
						<div id="content12">
							제목 : ${question.questionTitle }
						</div>
						<div id="content13">
							내용 : ${question.questionContent } 
						</div>
						<c:if test="${not empty question.questionFilename}">
							<div id="content14">
								<div id="content15">
									첨부파일 : ${question.questionFilename }<br>
									<img src="../../../resources/uploadFiles/${question.questionFilename }" alt="문의 이미지">
								</div>
							</div>
						</c:if>
					</div>
					<div id="content2">
						<form action="/comment/insert" method="post">
							<input type="hidden" name="userId" value="${question.userId }">
							<input type="hidden" name="questionNo" value="${question.questionNo }">
							<c:if test="${comment.commentContent eq null}">
								<div id="content21">
									<textarea placeholder="댓글을 작성해주세요" name="commentContent"></textarea>
								</div>
								<div class="content-btn">
									<button type="submit">댓글 작성</button>
								</div>
							</c:if>
							<c:if test="${comment.commentContent ne null}">
								<div id="content22">
									<textarea name="commentContent">${comment.commentContent }</textarea>
								</div>
								<div class="content-btn">
									<button type="button" onclick="deleteChk();">삭제</button>
									<button type="button" onclick="updateChk();">수정</button>
								</div>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		<div class="content-btn">
			<button>
				<a href="/comment/list">목록으로</a>
			</button>
		</div>
		</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script type="text/javascript">
		function deleteChk() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location.href = "/comment/delete?commentNo=" + ${comment.commentNo};
			}
		}

		function updateChk() {
			if (confirm("정말로 수정하시겠습니까?")) {
				let msg = document.querySelector('[name=commentContent]').value;
				location.href = "/comment/update?commentNo=${comment.commentNo}&commentContent="+ msg;
			}
		}
	</script>
</body>
</html>