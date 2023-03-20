<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>댓글 수정 창</title>
	</head>
	<body>
		<form action="/reviewcomment/modify" method="post">
			${reviewcomment } <br>
			<input type="hidden" id="reviewNo" name="reviewNo" value=${review.reviewNo }> <br>
			<input type="hidden" id="commentNo" name="commentNo" value=${reviewcomment.commentNo }> <br>
			<input type="hidden" id="userId" name="userId" value="${user }"> <br>
			<input type="text" id="commentContent" name="commentContent" value="${reviewcomment.commentContent }" placeholder="수정할 내용을 입력해주세요."> <br>
			<input type="submit" class="btn btn-secondary commentsubmit" value="수정">
		</form>
	</body>
</html>