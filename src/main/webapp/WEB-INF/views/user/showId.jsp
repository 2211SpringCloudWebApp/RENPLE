<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 출력 페이지</title>
<link rel="stylesheet" href="../../../resources/userCss/login.css">
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
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
		function goLogin() {
			location.href = "/user/login";
		}
	</script>
</body>
</html>