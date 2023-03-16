<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="../../resources/userCss/login.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
@font-face {
	font-family: 'Chosunilbo_myungjo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'Chosunilbo_myungjo';
}

#pw_not_ok {
	color: #695D58;
	display: none;
}
</style>
</head>
<body>
	<form action="/user/userPw" method="post">
		<div id="outter">
			<h1>비밀번호 변경</h1>
			<input type="hidden" name="userId" value="${user.userId }">
			<div id="inner">
				<div id="input-main">
					<div class="input-box">
						<input type="password" name="userPw" placeholder="비밀번호를 입력해주세요"
							required>
					</div>
				</div>
				<div id="input-main">
					<div class="input-box">
						<input type="password" name="reUserPw" placeholder="비밀번호를 한번 더 입력해주세요"
							required oninput = "checkPw()">
					</div>
				</div>
				<div class="chkMessge" style="text-align: center;">
						<span id="pw_not_ok" style="margin-bottom: 10px;">비밀번호가 일치하지 않습니다</span>
				</div>
				<div id="input-btn">
					<button type="submit">
						<span>완료</span>
					</button>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		function checkPw() {
			var pw = $('input[name=userPw]').val();
			var repw = $('input[name=reUserPw]').val();
			$.ajax({
				url : '/user/pwChk',
				type : 'post',
				data : {
					"userPw" : pw,
					"reUserPw" : repw
				},
				success : function(data) { 
					if (data == 0) { 
						$('#pw_not_ok').css("display", "none");
					} else {
						$('#pw_not_ok').css("display", "inline-block");
					}
				},
				error : function() {
					alert("에러발생");
				}
			});
		};	
	</script>
</body>
</html>