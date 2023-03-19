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
#id_ok, #email_ok {
	color: #008000;
	display: none;
}

#id_not_ok2, #id_not_ok3, #email_not_ok2, #email_not_ok3, #email_not_ok4
	{
	color: #6A82FB;
	display: none;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<form action="/user/enroll" method="post" autocomplete="off"
		onsubmit="return totalChk();">
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
									placeholder="아이디를 입력해주세요" autofocus onchange="chkId()">
							</div>
						</div>
					</div>
					<div class="chkMessge">
						<span id="id_ok">사용 가능한 아이디입니다</span><span id="id_not_ok2">영문
							대소문자, 숫자만 사용 가능하며 최소 길이 4, 최대 길이 25입니다.</span> <span id="id_not_ok3">중복된
							아이디입니다. 새로운 아이디를 입력하세요.</span>
					</div>
					<div class="content">
						<div class="content-name">
							<label>비밀번호<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="password" name="userPw"
									placeholder="비밀번호를 입력해주세요">
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
									placeholder="비밀번호를 한번 더 입력해주세요">
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
									placeholder="이름을 입력해 주세요">
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
									placeholder="green@apple.com" onchange="chkEmail()">
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
							<label>휴대번호<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<div>
								<input class="input-box" type="tel" name="userPhone"
									placeholder="숫자만 입력해주세요.">
							</div>
						</div>
					</div>
					<div class="content">
						<div class="content-name">
							<label>주소<span class="star">*</span></label>
						</div>
						<div class="content-text">
							<input id="address" class="input-box box" type="text"
								name="userAddress" placeholder="주소를 검색해주세요"
								style="margin-bottom: 5px;"> <input id="detailAddress"
								class="input-box" type="text" name="userAddress"
								placeholder="상세주소를 입력해주세요">
						</div>
						<div class="content-btn">
							<button type="button" onclick="sample4_execDaumPostcode()"
								style="height: 50%;">주소찾기</button>
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

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		var idChkNum = -100;
		/* 아이디 중복 확인 */
		function chkId() {
			var userId = $('input[name=userId]').val();
			$.ajax({
				url : '/user/idChk',
				type : 'post',
				data : {
					userId : userId
				},
				success : function(data) { // 컨트롤러에서 넘어온 result값을 받는다 
					if (data == 0) { // result가 1이 아니면(0일 경우) -> 사용 가능한 아이디 
						$('#id_ok').css("display", "inline-block");
						$('#id_not_ok2').css("display", "none");
						$('#id_not_ok3').css("display", "none");
						idChkNum = data;
					} else if (data == -2) {
						$('#id_ok').css("display", "none");
						$('#id_not_ok2').css("display", "inline-block");
						$('#id_not_ok3').css("display", "none");
						idChkNum = data;
					} else if (data > 0) { // result가 1일 경우 -> 이미 존재하는 아이디
						$('#id_ok').css("display", "none");
						$('#id_not_ok2').css("display", "none");
						$('#id_not_ok3').css("display", "inline-block");
						$('input[name=userId]').val('');
						idChkNum = data;
					}

				},
				error : function() {
					alert("에러발생");
				}
			});
		};

		var emailChkNum = -100;
		/* 이메일 중복 확인 */
		function chkEmail() {
			var userEmail = $('input[name=userEmail]').val();
			$.ajax({
				url : '/user/emailChk',
				type : 'post',
				data : {
					userEmail : userEmail
				},
				success : function(data) {
					if (data == 0) { // result가 1이 아니면(0일 경우) -> 사용 가능한 아이디 
						$('#email_ok').css("display", "inline-block");
						$('#email_not_ok2').css("display", "none");
						$('#email_not_ok3').css("display", "none");
						$('#email_not_ok4').css("display", "none");
						emailChkNum = data;
					} else if (data == -2) {
						$('#email_ok').css("display", "none");
						$('#email_not_ok2').css("display", "inline-block");
						$('#email_not_ok3').css("display", "none");
						$('#email_not_ok4').css("display", "none");
						emailChkNum = data;
					} else if (data == -3) {
						$('#email_ok').css("display", "none");
						$('#email_not_ok2').css("display", "none");
						$('#email_not_ok3').css("display", "inline-block");
						$('#email_not_ok4').css("display", "none");
						emailChkNum = data;
					} else if (data > 0) { // result가 1일 경우 -> 이미 존재하는 아이디
						$('#email_ok').css("display", "none");
						$('#email_not_ok2').css("display", "none");
						$('#email_not_ok3').css("display", "none");
						$('#email_not_ok4').css("display", "inline-block");
						$('input[name=userEmail]').val('');
						emailChkNum = data;
					}
				},
				error : function() {
					alert("에러발생");
				}
			});
		};

		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') {
								// 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("address").value = extraAddr;

							} else {
								document.getElementById("address").value = '';
							}

							// 우편번호 + 주소(도로명,지번) + 참고항목
							document.getElementById("address").value = addr
									+ extraAddr;
							// 위에가 다 입력될시 커서포커스를 상세주소입력칸으로 이동 
							document.getElementById("detailAddress").focus();

						}
					}).open();
		}

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

			// 아이디 유효성 문구는 ajax로 처리
			if (userId.val() == '') {
				alert("아이디를 입력하세요.");
				userId.focus();
				return false;
			}
			if (idChkNum != 0) {
				return false;
			}

			if (userPw.val() == '') {
				alert("비밀번호를 입력하세요.");
				userPw.focus();
				return false;
			} else if (userPw.val().length < 8 || userPw.val().length > 20) {
				alert("비밀번호는 8~20자여야 합니다.");
				userPw.focus();
				return false;
			} else if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/
					.test(userPw.val())) {
				alert("비밀번호는 영문 대소문자, 숫자 그리고 특수문자 조합으로 8~20자리 사용해야 합니다.");
				userPw.val('');
				userPw.focus();
				return false;
			}

			if (userPw.val() != reUserPw.val()) {
				alert("비밀번호가 일치하지 않습니다.");
				reUserPw.focus();
				return false;
			}

			if (userName.val() == '') {
				alert("이름을 입력하세요.");
				userName.focus();
				return false;
			} else if (userName.val().length < 2 || userName.val().length > 6) {
				alert("이름은 2~6자여야 합니다.");
				userId.focus();
				return false;
			}

			// 이메일 유효성 문구는 ajax로 처리
			if (userEmail.val() == '') {
				alert("이메일 주소를 입력하세요.");
				userEmail.focus();
				return false;
			}
			if (emailChkNum != 0) {
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
			
			if (userDetailAddress.val() == '') {
				alert("상세주소를 입력하세요.");
				userDetailAddress.focus();
				return false;
			}

			// 모두 통과해야 제출 가능
			return true;
		}
	</script>
</body>

</html>