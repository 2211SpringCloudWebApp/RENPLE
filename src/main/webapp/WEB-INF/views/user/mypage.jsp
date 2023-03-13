<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	
	<form action="/user/modify" method="post">
		<div id="outter">
			<h1>마이페이지</h1>
			<div id="required">
				<span class="star">*</span> 수정 가능 목록
			</div>
			<div id="inner">
				<div id="inputForm">
					<div class="content">
						<div class="content-name">
							<label>아이디</label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="text" name="userId" value="${user.userId }" readonly>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>비밀번호<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="password" name="userPw" value="${user.userPw }">
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>비밀번호 확인<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="password" name="reUserPw">
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>이름</label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="text" name="userName" value="${user.userName }" readonly>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>이메일<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="text" name="userEmail" value="${user.userEmail }" required>
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
								<input class="input-box" type="tel" name="userPhone" value="${user.userPhone }" required>
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
							<input id="sample4_postcode" class="input-box" type="text" name="userAddress" value="${user.userAddress }" required>
						</div>
						<div class="content-btn">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						</div>
					</div>
				</div>
			</div>
			<div id="enroll-box">
				<button id="enroll-btn">
					<span>수정하기</span>
				</button>
			</div>
		</div>
	</form>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>