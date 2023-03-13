<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 출력 페이지</title>
<link rel="stylesheet" href="../../resources/userCss/login.css">
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
</style>
</head>
<body>
	<div id="outter">
		<h1>아이디 조회 결과</h1>
		<div id="inner">
			<div id="input-main">
				<div class="input-box">
					<input type="text" name="userId" value="${user.userId }">
				</div>
			<div id="input-btn">
				<button type="button" onclick="goLogin();">
					<span>확인</span>
				</button>
			</div>
		</div>
	</div>
<script>
	function goLogin() {
		location.href = "/user/login";
	}
</script>
</body>
</html>