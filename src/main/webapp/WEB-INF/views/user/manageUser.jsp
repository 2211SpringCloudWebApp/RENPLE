<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 상세 페이지</title>
<link rel="stylesheet" href="../../../resources/userCss/enroll.css">
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

#email_not_ok2, #email_not_ok3, #email_not_ok4 {
	color: #6A82FB;
	display: none;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<form action="/user/modifyUser" method="post" autocomplete="off"
		onsubmit="return totalChk();">
		<div id="outter">
			<h1>회원 상세 페이지</h1>
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
									value="${user.userPw}" required>
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
									value="${user.userEmail}" required onchange="chkEmail()">
							</div>
						</div>
					</div>
					<div class="chkMessge">
						<span id="email_ok">사용 가능한 이메일입니다</span> <span id="email_not_ok2">최대
							길이는 50자입니다.</span> <span id="email_not_ok3">이메일 형식이 올바르지 않습니다.</span><span
							id="email_not_ok4">중복된 이메일입니다. 새로운 이메일을 입력하세요.</span>
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
				<button type="submit" id="enroll-btn">
					<span>수정하기</span>
				</button>
			</div>
		</div>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script type="text/javascript">
		/* 이미 이메일 중복을 거치고 와서 초기값으로 필터링 할 필요 x */
		/* var emailChkNum = -100; */
		/* 이메일 중복 확인 */
		function chkEmail() {
			var userEmail = $('input[name=userEmail]').val();
			var userId = $('input[name=userId]').val();
			$.ajax({
				url : '/user/emailChk2',
				type : 'post',
				data : {
					userEmail : userEmail,
					userId : userId
				},
				success : function(data) {
					if (data == 0) { // result가 1이 아니면(0일 경우) -> 사용 가능한 아이디 
						$('#email_ok').css("display", "inline-block");
						$('#email_not_ok2').css("display", "none");
						$('#email_not_ok3').css("display", "none");
						$('#email_not_ok4').css("display", "none");
						/* emailChkNum = data; */
					} else if (data == -2) {
						$('#email_ok').css("display", "none");
						$('#email_not_ok2').css("display", "inline-block");
						$('#email_not_ok3').css("display", "none");
						$('#email_not_ok4').css("display", "none");
						/* emailChkNum = data; */
					} else if (data == -3) {
						$('#email_ok').css("display", "none");
						$('#email_not_ok2').css("display", "none");
						$('#email_not_ok3').css("display", "inline-block");
						$('#email_not_ok4').css("display", "none");
						/* emailChkNum = data; */
					} else if (data > 0) { // result가 1일 경우 -> 이미 존재하는 이메일
						$('#email_ok').css("display", "none");
						$('#email_not_ok2').css("display", "none");
						$('#email_not_ok3').css("display", "none");
						$('#email_not_ok4').css("display", "inline-block");
						$('input[name=userEmail]').val('');
						/* emailChkNum = data; */
					}
				},
				error : function() {
					alert("에러발생");
				}
			});
		};

		/* 유효성 체크 통과시 회원가입이 가능하게함 */
		function totalChk() {

			var userId = $("input[name=userId]");
			var userPw = $("input[name=userPw]");
			var reUserPw = $("input[name=reUserPw]");
			var userName = $("input[name=userName]");
			var userEmail = $("input[name=userEmail]");
			var userPhone = $("input[name=userPhone]");
			var userAddress = $("#address");
			var userDetailAddress = $("#detailAddress")

			if (userPw.val() == '') {
				alert("비밀번호를 입력하세요.");
				userPw.focus();
				return false;
			} 
			else if (userPw.val().length < 8 || userPw.val().length > 20) {
				alert("비밀번호는 영문 대소문자, 숫자 그리고 특수문자 조합으로 8~20자리 사용해야 합니다.");
				userPw.focus();
				return false;
			} 
			else if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/
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

			// 이메일 유효성 ajax로 처리
			if (userEmail.val() == '') {
				alert("이메일 주소를 입력하세요.");
				userEmail.focus();
				return false;
			}

			if (userPhone.val() == '') {
				alert("휴대번호를 입력하세요.");
				userPhone.focus();
				return false;
			} else if (!/^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/.test(userPhone
					.val())) {
				alert("휴대번호가 올바르지 않습니다.");
				userPhone.focus();
				return false;
			}

			if (userAddress.val() == '') {
				alert("주소를 입력하세요.");
				userAddress.focus();
				return false;
			}
						
			if (emailChkNum != 0) {
				alert("사용 불가능한 이메일입니다.");
				userEmail.focus();
				return false;
			}
			
			// 모두 통과해야 제출 가능
			return true;
		}
	</script>
</body>

</html>