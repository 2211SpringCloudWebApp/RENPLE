<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 답변</title>
</head>
<body>
	<h1>문의 답변</h1>
	제목 : ${question.questionTitle }
	<br> 내용 : ${question.questionContent }
	<br> 아이디 : ${question.userId }
	<br>

	<form action="/comment/insert" method="post">
		<input type="hidden" name="userId" value="${question.userId }">
		<input type="hidden" name="questionNo" value="${question.questionNo }">
		<c:if test="${comment.commentContent eq null}">
			<textarea rows="10" cols="30" name="commentContent"></textarea>
			<br>
			<button type="submit">댓글 작성</button>
		</c:if>
		<c:if test="${comment.commentContent ne null}">
			<textarea rows="10" cols="30" name="commentContent">${comment.commentContent }</textarea>
			<br>
			<button type="button" onclick="deleteChk();">삭제</button>
			<button type="button" onclick="updateChk();">수정</button>
		</c:if>

	</form>

	<br>
	<br>

	<a href="/comment/list">목록으로</a>
	
	<script type="text/javascript">
		function deleteChk() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location.href = "/comment/delete?commentNo=" + ${comment.commentNo};
			}
		}
		
		function updateChk() {
			if (confirm("정말로 수정하시겠습니까?")) {
				let msg = document.querySelector('[name=commentContent]').value;
				location.href = "/comment/update?commentNo=${comment.commentNo}&commentContent="+msg;
			}
		}
	</script>
</body>
</html>