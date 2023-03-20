<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복 체크</title>
</head>
<body>
<form action="/user/emailChk" method="get" name="emailCheckForm">
			<h1>이메일 중복 확인</h1>
			<div id="inputBox">
				<div id="emailBox">
					<input type="text" name="userEmail" value="${user.userEmail}" required autofocus> 
					<input type="submit" value="중복 체크">
				</div>
				<div id="textBox">
					<c:choose>
						<c:when test="${user eq null}">
							<h1>${user.userEmail}는 사용 가능한 이메일입니다.</h1>
						</c:when>
						<c:when test="${user ne null}">
							<h1>${user.userEmail}는 이미 사용중인 이메일입니다.</h1>
						</c:when>
					</c:choose>
				</div>
				<div id="buttonBox">
					<c:choose>
						<c:when test="${user eq null}">
							<input type="button" value="사용" class="choice" onclick="emailOk()">
						</c:when>
					</c:choose>
					<input type="button" onclick="window.close()" class="choice" value="취소" />
				</div>
			</div>
		</form>
		<script>
		function chk() {
			if (document.joinform.userId.value == "") {
				alert("사용자 아이디를 입력해주세요");
				document.joinform.userId.focus();
				return;
			}
			var url = "/user/idChk?userId=" + document.joinform.userId.value;
			window.open(url, "chkIdForm", "width=800, height=500");
		}
		function dupIdChk() {
			var dupId = document.querySelector("[type=hidden]").value;
			if (dupId == "") {
				alert("아이디 중복확인이 필요합니다.")
				return false;
			} else {
				return true;
			}
		}
		</script>
</body>
</html>