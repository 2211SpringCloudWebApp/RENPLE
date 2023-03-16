<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기 수정</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    	<link rel="stylesheet" href="../../../../resources/reviewCss/write.css">
	</head>
	<body>
	<c:if test="${loginUser == null }">
		<body onload = "add()">
	</c:if>
	<jsp:include page="../header.jsp"></jsp:include>
		<div id="container">
			<p id="maintitle"><b>후기 수정</b></p>
			<div id="input-area">
				<form action="/review/modify.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="userId" value="${loginUser.userId }">
				<input type="hidden" name="reviewNo" value="${review.reviewNo }">
				<input type="text" id="reviewTitle" name="reviewTitle" value="${review.reviewTitle }" placeholder="  제목"> <br><br>
				<input type="number" min="1" max="5" id="reviewRating" name="reviewRating" value="${review.reviewRating }" placeholder="  별점 (1~5 입력)"> <br><br>
				<textarea name="reviewContent" id="reviewContent" placeholder="  내용">${review.reviewContent }</textarea> <br><br>
				<input type="file" name="reloadFile" value="${review.reviewFilename }"> &nbsp;&nbsp; ${review.reviewFilename }<br><br>
				<div id="button-area">
					<button type="submit" class="btn btn-secondary">수정하기</button>
					<button type="button" class="btn btn-light" onclick="goBack();">게시글로 돌아가기</button>
				</div>
				</form>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
		<script>
			function goBack() {
				history.back();
			}
			function add() {
				alert("로그인후 이용가능합니다.");
				history.back();
			}
		</script>
	</body>
</html>