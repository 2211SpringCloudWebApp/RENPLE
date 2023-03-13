<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
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

footer a {
	text-decoration: none;
	color: #fff;
}

#footer {
	list-style: none;
	color: #fff;
	height: calc(100vh - 72px); 
	--height: 100vw;
	background-image: url("../../resources/img/main/num5.jpg");
	background-size: cover;
	background-position: center;
}

.footer_container {
	margin: 0 15%;
	padding: 10% 0 0 0;
}

#footer_top>span {
	writing-mode: vertical-rl;
	font-size: x-large;
	letter-spacing: 8px;
	font-weight: 900;
}

#footer_mid {
	margin-top: 9vh;
	text-align: center;
}

.footer_mid_logo_1 {
	font-size: 300%;
	margin-bottom: 5px;
}

.footer_mid_logo_2 {
	font-size: large;
}

.footer_bottom {
	margin: 8% 0 0 0;
	display: flex;
	justify-content: space-between;
	font-weight: 900;
}

.footer_bottom_p {
	line-height: 0.5;
	margin: 35px 0;
}

.right_vertical {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.rabbit {
	width: 36px;
}
</style>
</head>
<body>
	<footer id="footer">
		<div class="footer_container">
			<div id="footer_top">
				<span>RENTAL<br>PLACE</span>
			</div>
			
			<div id="footer_mid">
				<div class="footer_mid_logo_1">공간 대여</div>
				<div class="footer_mid_logo_2">RENTAL PLACE</div>
			</div>
			
			<div class="footer_bottom">
				<div>
					<span>이용약관</span> <span>개인정보 처리방침</span> <span>운영정책</span>

					<div class="footer_bottom_p">
						<p>KH 주식회사</p>
						<p>대표자 그린과 애플들</p>
						<p>서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 3F</p>
						<p>사업자등록번호 777-77-777777</p>
					</div>

					<span>Copyright © 1998-2023 KH Information Educational Institute All Right Reserved</span>
				</div>

				<div class="right_vertical">
					<div>
						<a><img src="../../resources/img/main/Icon-sns-instargram.svg" alt="인스타"></a> 
						<a><img src="../../resources/img/main/Icon-sns-facebook.svg" alt="페북"></a>
						<a><img src="../../resources/img/main/Icon-sns-blog.svg" alt="네이버블로그"></a>
					</div>

					<div>
						<a><img class="rabbit" src="../../resources/img/main/whiterabbit.png" alt="토끼"></a> 
						<a><img class="rabbit" src="../../resources/img/main/whiterabbit.png" alt="토끼"></a> 
						<a><img class="rabbit" src="../../resources/img/main/whiterabbit.png" alt="토끼"></a>
					</div>
				</div>
			</div>
		</div>
</body>
</html>