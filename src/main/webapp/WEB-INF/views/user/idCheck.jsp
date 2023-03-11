<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
</head>
<body>
	<main>
		<form action="/user/idChk" method="get" name="idCheckForm">
			<h1>아이디 중복 확인</h1>
			<h1>${user }</h1>
			<div id="inputBox">
				<div id="idBox">
					<input type="text" name="userId" value="${user.userId}" required autofocus>
					<input type="submit" value="중복 체크">
				</div>
				<div id="textBox">
					<c:choose>
						<c:when test="${user eq null}">
							<h1>${user.userId}는사용 가능한 아이디입니다.</h1>
						</c:when>
						<c:when test="${user ne null}">
							<h1>${user.userId}는이미 사용중인 아이디입니다.</h1>
						</c:when>
					</c:choose>
				</div>
				<div id="buttonBox">
					<c:choose>
						<c:when test="${user eq null}">
							<input type="button" value="사용" class="choice" onclick="idOk()">
						</c:when>
					</c:choose>
					<input type="button" onclick="window.close()" class="choice"
						value="취소" />
				</div>
			</div>
		</form>
	</main>
	<script>
		function idOk() {
			opener.joinform.userId.value = document.idCheckForm.userId.value;
			opener.joinform.chkUserId.value = document.idCheckForm.userId.value;
			self.close();
		}
	</script>
</body>
</html>