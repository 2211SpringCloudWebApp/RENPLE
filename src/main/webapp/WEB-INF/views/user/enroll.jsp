<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../../resources/userCss/enroll.css">
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
	<form action="/user/enroll" method="post">
		<div id="outter">
			<h1>회원가입</h1>
			<div id="required">
				<span class="star">*</span> 필수입력사항
			</div>
			<div id="inner">
				<div id="inputForm">
					<div class="content">
						<div class="content-name">
							<label>아이디<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="text" name="userId"
									placeholder="아이디를 입력해주세요" required autofocus>
							</div>
						</div>
						<div class="content-btn">
							<button type="button">
								<span>중복확인</span>
							</button>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>비밀번호<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="password" name="userPw"
									placeholder="비밀번호를 입력해주세요" required>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>비밀번호 확인<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="password" name="reUserPw"
									placeholder="비밀번호를 한번 더 입력해주세요" required>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>이름<span class="star">*</span></label>
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
							<label>이메일<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="text" name="userEmail"
									placeholder="예: green@apple.com" required>
							</div>
						</div>
						<div class="content-btn">
							<button>
								<span>중복확인</span>
							</button>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>휴대폰<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="tel" name="userPhone"
									placeholder="숫자만 입력해주세요." required>
							</div>
						</div>
						<div class="content-btn">
							<button>
								<span>인증번호 받기</span>
							</button>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>주소<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<input class="input-box" type="text" name="userAddress"
								placeholder="주소를 입력해주세요" required>
						</div>
					</div>
				</div>
			</div>
			<div id="enroll-box">
				<button id="enroll-btn">
					<span>가입하기</span>
				</button>
			</div>
		</div>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>