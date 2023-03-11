<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	<jsp:include page="../header.jsp"></jsp:include>
	<form action="/user/login" method="post">
		<div id="outter">
			<h1>로그인</h1>
			<div id="inner">
				<div id="input-main">
					<div class="input-box">
						<input type="text" name="userId" placeholder="아이디를 입력해주세요"
							required autofocus>
					</div>
					<div class="input-box">
						<input type="password" name="userPw" placeholder="비밀번호를 입력해주세요"
							required>
					</div>
				</div>
				<div id="input-find">
					<a href="#">아이디 찾기</a> <span>|</span> <a href="/user/findPw">비밀번호 찾기</a>
				</div>
				<div id="input-btn">
					<button type="submit">
						<span>로그인</span>
					</button>
					<button type="button" onclick="goEnroll()">
						<span>회원가입</span>
					</button>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
		function goEnroll() {
			location.href = "/user/enroll";
		}
	</script>
</body>

</html>