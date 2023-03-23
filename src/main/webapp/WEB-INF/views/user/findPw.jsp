<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../../../resources/userCss/enroll.css">
<style>
#outter {
	height: 100vh;
	width: 50vw;
	box-sizing: border-box; margin : 0 auto;
	padding-top: 35vh;
	box-sizing: border-box;
	margin: 0 auto;
	margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<form action="/user/findPw" method="post">
		<div id="outter">
			<h1>비밀번호 찾기</h1>
			<div id="inner">
				<div id="inputForm">
					<div class="content">
						<div class="content-name">
							<label>아이디</label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="text" name="userId"
									placeholder="아이디를 입력해주세요" required autofocus>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>이름</label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="text" name="userName"
									placeholder="이름을 입력해 주세요" required>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>이메일</label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="text" name="userEmail"
									placeholder="green@apple.com" required>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>전화번호</label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="tel" name="userPhone"
									placeholder="숫자만 입력해주세요." required>
							</div>
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
</body>

</html>