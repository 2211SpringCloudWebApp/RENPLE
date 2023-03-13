<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 상세 페이지</title>
<link rel="stylesheet" href="../../resources/userCss/enroll.css">
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

#email_ok {
	color: #008000;
	display: none;
}

#email_already, #pw_not_ok {
	color: #6A82FB;
	display: none;
}
</style>
</head>

<body>
	<!-- <form action="/user/select" method="post" onsubmit="retutn totalChk()"> -->
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
								<input class="input-box" type="text" name="userId"
									value="${user.userId}" readonly>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>비밀번호<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="password" name="userPw"
									value="${user.userPw}" required>
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
									value="${user.userPw}" required
									oninput = "checkPw()">
							</div>
						</div>
					</div>
					<div class="chkMessge">
						<span id="pw_not_ok">비밀번호가 일치하지 않습니다</span>
					</div>
					<div class="content">
						<div class="content-name">
							<label>이름</label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="text" name="userName"
									value="${user.userName}" readonly>
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
									value="${user.userEmail}" required>
							</div>
						</div>
						<div class="content-btn">
							<button type="button" onclick="chkEmail()">
								<span>중복확인</span>
							</button>
						</div>
					</div>
					<div class="chkMessge">
						<span id="email_ok">사용 가능한 이메일입니다</span> 
						<span id="email_already">사용 불가능한 이메일입니다</span>
					</div>
					<div class="content">
						<div class="content-name">
							<label>휴대폰<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="tel" name="userPhone"
									value="${user.userPhone}" required>
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>주소<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<input class="input-box" type="text" name="userAddress"
								value="${user.userAddress}" required>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>가입날짜</label>
						</div>
						<div class="content-text">
							<input class="input-box" type="datetime" name="uCreateDate"
								value="${user.uCreateDate}" readonly>
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
	
	<script type="text/javascript">
		/* 비밀번호 확인 */
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
		
		/* 이메일 중복 확인 */
		function chkEmail() {
			var email = $('input[name=userEmail]').val();
			$.ajax({
				url : '/user/emailChk',
				type : 'post',
				data : {
					"userEmail" : email
				},
				success : function(data) { 
					if (data == 0) { 
						$('#email_ok').css("display", "inline-block");
						$('#email_already').css("display", "none");
					} else {
						$('#email_already').css("display", "inline-block");
						$('#email_ok').css("display", "none");
						$('input[name=userEmail]').val('');
					}
				},
				error : function() {
					alert("에러발생");
				}
			});
		};
		
		/* 유효성 체크 통과시 회원가입이 가능하게함 */
		/* function totalChk() {
			return true;
		} */
	</script>
</body>

</html>