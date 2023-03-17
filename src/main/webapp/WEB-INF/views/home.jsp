<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공간대여서비스</title>
<link rel="stylesheet" href="../../resources/mainCss/main.css">
<!-- No mapping for GET /favicon.ico 안뜨게 설정 -->
<link rel="icon" type="image/ico"
	href="${pageContext.request.contextPath}/resources/static/images/favicon.ico">
</head>

<body>
	<div id="container">
		<jsp:include page="./header.jsp"></jsp:include>
		<main>
			<div id="img-box">
				<img class="img" src="../../resources/img/main/num1.webp" /> <img
					class="img" src="../../resources/img/main/num2.webp" /> <img
					class="img" src="../../resources/img/main/num3.webp" /> <img
					class="img" src="../../resources/img/main/num4.webp" />
			</div>
			<div id="box1">
				<div class="box11">
					<p style="font-size: 15px; color: #D5CEA3;">매일 다른 공간 찾아가기 힘들지
						않았나요?</p>
					<br> <strong>
						<p style="font-size: 30px; color: #3C2A21;">
							사무실이 아닌, 카페도 아닌<br> 레플로 출근하세요!
						</p> <br>
						<p style="font-size: 20px; color: #D5CEA3;">
					</strong> 내가 원하는 정보들만 모아서<br> 내가 원하는 시간에 이용이 가능합니다.
					</p>

				</div>
				<div class="box11">
					<img src="../../resources/img/main/rabbit.png" alt="rabbit1"
						class="rabbit1">
				</div>
			</div>
			<div id="box2">
				<p style="font-size: 20px; color: #3C2A21;">1일 무료 체험 이용해보고 결정하세요</p>
				<p style="font-size: 15px; color: white;">회원가입 후 레플을 만나보세요!</p>
				<p style="font-size: 30px; color: #3C2A21;">
					공유게시판에서 실이용자들의<br>생생한 후기를 볼 수 있습니다.
				</p>
				<div id="box21">
					<p>회원 전용 사이트로 레플의 모든 것을 자유롭게 경험하세요.</p>
				</div>
				<div id="box22">
					<p>
						가입 시 1일 이용권 0원! <br>언제든 해지할 수 있어요.
					</p>
				</div>
			</div>
			<div id="box3">
				<p>근사한 업무 공간, 레플의 회원이 되어보세요!</p>
				<p>내 라이프에 맞춰 이용한 시간만큼 결제할 수 있어요.</p>
				<img src="../../resources/img/main/ticket.png" alt="ticket"
					class="ticket">
				<div>
					<button class="box3-btn" type="button">
						<a href="#">더 많은 회원권 보러가기</a>
					</button>
				</div>
			</div>
			<div id="box4">
				<p style="text-align: center; font-size: 30px;">레플의 지점을 둘러보세요</p>
				<p style="text-align: center; font-size: 15px;">당신의 집 근처 사무실을
					만나보세요</p>
				<div id="slideShow">
					<div class="slides">
						<div class="slides-box">
							<img src="../../resources/img/main/img-slide-booth-joint.webp"
								alt="joint">
							<p>따로 또 같이</p>
							<h2>조인트 부스</h2>
						</div>
						<div class="slides-box">
							<img src="../../resources/img/main/img-slide-hive.webp"
								alt="hive">
							<p>따뜻하고 아늑한 공간</p>
							<h2>하이브</h2>
						</div>
						<div class="slides-box">
							<img
								src="../../resources/img/main/img-slide-library-seating.webp"
								alt="library">
							<p>업무에 집중할 수 있는</p>
							<h2>라이브러리 시팅</h2>
						</div>
						<div class="slides-box">
							<img src="../../resources/img/main/img-slide-meeting-booth.webp"
								alt="meeting">
							<p>의견을 주고 받는</p>
							<h2>미팅 부스</h2>
						</div>
						<div class="slides-box">
							<img src="../../resources/img/main/img-slide-nest.webp"
								alt="nest">
							<p>개방감과 아늑함</p>
							<h2>네스트</h2>
						</div>
						<div class="slides-box">
							<img src="../../resources/img/main/img-slide-phone-booth.webp"
								alt="phone">
							<p>맘 편히 통화할 수 있는</p>
							<h2>폰 부스</h2>
						</div>
						<div class="slides-box">
							<img src="../../resources/img/main/img-slide-social-bench.webp"
								alt="bench">
							<p>영감의 대화가 깃드는</p>
							<h2>소셜 벤치</h2>
						</div>
					</div>
					<p class="controller">
						<span class="prev">&lang;</span> <span class="next">&rang;</span>
					</p>
				</div>
			</div>
		</main>
		<jsp:include page="./footer.jsp"></jsp:include>
	</div>
	<script>
		function goHome() {
			location.href = "/";
		}
		const images = document.querySelectorAll('.img');
		let current = 0;

		function showSlide() {
			for (let i = 0; i < images.length; i++) {
				images[i].classList.remove('on');
			}
			current++;
			if (current > images.length) {
				current = 1;
			}
			images[current - 1].classList.add('on');
			setTimeout(showSlide, 4000);
		}
		showSlide();
	</script>
	<script>
		const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
		const slideImg = document.querySelectorAll('.slides-box'); //모든 슬라이드들
		let currentIdx = 0; //현재 슬라이드 index
		const slideCount = slideImg.length; // 슬라이드 개수
		const prev = document.querySelector('.prev'); //이전 버튼
		const next = document.querySelector('.next'); //다음 버튼
		const slideWidth = 300; //한개의 슬라이드 넓이
		const slideMargin = 100; //슬라이드간의 margin 값
		slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

		function moveSlide(num) {
			slides.style.left = -num * 400 + 'px';
			currentIdx = num;
		}

		prev.addEventListener('click', function() {
			if (currentIdx !== 0)
				moveSlide(currentIdx - 1);
		});

		next.addEventListener('click', function() {
			if (currentIdx !== slideCount - 1) {
				moveSlide(currentIdx + 1);
			}
		});
	</script>
</body>

</html>