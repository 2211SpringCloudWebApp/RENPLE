<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="../../../resources/userCss/enroll.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
#outter {
    height: 100vh;
    width: 50vw;
    box-sizing: border-box;
    margin: 0 auto;
    padding-top: 35vh;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<form action="/user/userPw" method="post" onsubmit="return totalChk()">
		<div id="outter">
			<h1>비밀번호 변경</h1>
			<div id="inner">
				<input type="hidden" name="userId" value="${user.userId }">
				<div class="content">
					<div class="content-name">
						<label>비밀번호</label>
					</div>
					<div class="content-text">
						<div>
							<input class="input-box" type="password" name="userPw"
								placeholder="비밀번호를 입력해주세요">
						</div>
					</div>
				</div>
				<div class="content">
					<div class="content-name">
						<label>비밀번호 확인</label>
					</div>
					<div class="content-text">
						<div>
							<input class="input-box" type="password" name="reUserPw"
								placeholder="비밀번호를 한번 더 입력해주세요">
						</div>
					</div>
				</div>
			</div>
			<div id="enroll-box">
				<button id="enroll-btn">
					<span>완료</span>
				</button>
			</div>
		</div>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>

	<script type="text/javascript">
		function totalChk() {

			var userPw = $("input[name=userPw]");
			var reUserPw = $("input[name=reUserPw]");

			if (userPw.val() == '') {
				alert("비밀번호를 입력하세요.");
				userPw.focus();
				return false;
			} else if (userPw.val().length < 8 || userPw.val().length > 20) {
				alert("비밀번호는 영문 대소문자, 숫자 그리고 특수문자 조합으로 8~20자리 사용해야 합니다.");
				userPw.focus();
				return false;
			} else if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/
					.test(userPw.val())) {
				alert("비밀번호는 영문 대소문자, 숫자 그리고 특수문자 조합으로 8~20자리 사용해야 합니다.");
				userPw.focus();
				return false;
			}

			if (userPw.val() != reUserPw.val()) {
				alert("비밀번호가 일치하지 않습니다.");
				reUserPw.focus();
				return false;
			}
			
			return;
		}
	</script>
</body>
</html>