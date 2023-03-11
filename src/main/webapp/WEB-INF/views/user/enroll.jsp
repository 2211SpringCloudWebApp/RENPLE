<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

#id_ok, #email_ok {
	color: #008000;
	display: none;
}

#id_already, #email_already, #pw_not_ok {
	color: #6A82FB;
	display: none;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- <form action="/user/enroll" method="post" onsubmit="retutn totalChk()"> -->
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
						<input type="hidden" name="chkUserId">
						<div class="content-text">
							<div>
								<input class="input-box" type="text" name="userId"
									placeholder="아이디를 입력해주세요" required autofocus> 
							</div>
						</div>
						<div class="content-btn">
							<button type="button" onclick="chkId()">
								<span>중복확인</span>
							</button>
						</div>
					</div>
					<div class="chkMessge">
						<span id="id_ok">사용 가능한 아이디입니다</span> 
						<span id="id_already">사용 불가능한 아이디입니다</span>
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
									placeholder="비밀번호를 한번 더 입력해주세요" required
									oninput = "checkPw()">
							</div>
						</div>
					</div>
					<div class="chkMessge">
						<span id="pw_not_ok">비밀번호가 일치하지 않습니다</span>
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
									placeholder="green@apple.com" required>
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
							<label>전화번호<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="tel" name="userPhone"
									placeholder="숫자만 입력해주세요." required>
							</div>
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
						<div class="content-btn">
							<button type="button">
								<span>주소검색</span>
							</button>
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
	<script type="text/javascript">
		/* 아이디 중복 확인 */
		function chkId() {
			var id = $('input[name=userId]').val();
			/* console.log(id); */
			$.ajax({
				url : '/user/idChk',
				type : 'post',
				data : {
					"userId" : id
				},
				success : function(data) { // 컨트롤러에서 넘어온 result값을 받는다 
					/* console.log(data) */
					if (data == 0) { // result가 1이 아니면(0일 경우) -> 사용 가능한 아이디 
						$('#id_ok').css("display", "inline-block");
						$('#id_already').css("display", "none");
					} else { // result가 1일 경우 -> 이미 존재하는 아이디
						$('#id_already').css("display", "inline-block");
						$('#id_ok').css("display", "none");
						$('input[name=userId]').val('');
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
		
		/* 유효성 체크 통과시 회원가입이 가능하게함 */
		/* function totalChk() {
			return true;
		} */
	</script>
</body>

</html>