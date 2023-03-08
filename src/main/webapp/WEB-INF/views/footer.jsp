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
		background-image: url("../../resources/img/main/num5.jpg");
		height: calc(100vh - 72px);
		background-size: cover;
		background-position: center;
	}
	
	.footer_container {
		margin: 0 130px;
		padding: 48px 30px;
	}
	
	#footer_top>span {
		writing-mode: vertical-rl;
		font-size: x-large;
		letter-spacing: 8px;
		font-weight: 900;
	}
	
	#footer_mid {
		margin-top: 70px;
		text-align: center;
	}
	
	.footer_mid_logo_1 {
		font-size: 56px;
		margin-bottom: 5px;
	}
	
	.footer_mid_logo_2 {
		font-size: large;
	}
	
	#footer_bottom {
		margin-top: 100px;
		display: flex;
	}
	
	.footer_bottom_left {
		font-weight: 900;
	}
	
	.footer_bottom_left>div {
		margin-bottom: 48px;
		line-height: 0.5;
		pointer-events: none;
	}
	
	.footer_info1 {
		display: flex;
	}
	
	.footer_info1 ul {
		padding-left: 0;
	}
	
	.footer_info1 li {
		display: inline-block;
		padding-right: 30px;
	}
	
	.footer_bottom_right {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		align-items: flex-end;
		margin-left: auto;
	}
	
	.footer_sns ul {
		padding-left: 0;
	}
	
	.footer_sns li {
		display: inline-block;
		margin-left: 30px;
	}
	
	.footer_sns_icon3 {
		padding-right: 0;
	}
	
	.rabbit {
		width: 50px;
		height: 63px;
	}

</style>
</head>
<body>
	<footer id="footer">
		<div class="footer_container">
			<div id="footer_top">
				<span>RENTAL<br>PLACE
				</span>
			</div>

			<div id="footer_mid">
				<div class="footer_mid_logo_1">공간 대여</div>
				<div class="footer_mid_logo_2">RENTAL PLACE</div>
			</div>

			<div id="footer_bottom">
				<div class="footer_bottom_left">
					<div class="footer_info1">
						<ul>
							<li class="footer_btm_info1"><a href="#">이용약관</a></li>
							<li class="footer_btm_info2"><a href="#">개인정보 처리방침</a></li>
							<li class="footer_btm_info3"><a href="#">운영정책</a></li>
						</ul>
					</div>
					<div class="footer_info2">
						<p>KH 주식회사</p>
						<p>대표자 그린과 애플들</p>
						<p>서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 3F</p>
						<p>사업자등록번호 777-77-777777</p>
					</div>
					<small>Copyright © 1998-2023 KH Information Educational
						Institute All Right Reserved</small>
				</div>

				<div class="footer_bottom_right">
					<div class="footer_sns">
						<ul>
							<li class="footer_sns_icon1"><a href="#"><img
									src="../../resources/img/main/Icon-sns-instargram.svg"
									alt="인스타"></a></li>
							<li class="footer_sns_icon2"><a href="#"><img
									src="../../resources/img/main/Icon-sns-facebook.svg" alt="페북"></a>
							</li>
							<li class="footer_sns_icon3"><a href="#"><img
									src="../../resources/img/main/Icon-sns-blog.svg" alt="네이버블로그"></a>
							</li>
						</ul>
					</div>
					<div class="footer_rabbit">
						<img class="rabbit" src="../../resources/img/main/whiterabbit.png"
							alt="토끼^^**"> <img class="rabbit"
							src="../../resources/img/main/whiterabbit.png" alt="토끼^^**">
						<img class="rabbit" src="../../resources/img/main/whiterabbit.png"
							alt="토끼^^**">
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>