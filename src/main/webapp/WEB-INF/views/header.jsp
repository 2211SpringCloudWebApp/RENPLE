<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- No mapping for GET /favicon.ico 안뜨게 설정 -->
<link rel="icon" type="image/ico"
	href="${pageContext.request.contextPath}/resources/static/images/favicon.ico">
</head>
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

nav {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background-color: #fff;
	z-index: 100;
}

nav ul {
	margin: 0;
	padding: 0;
	list-style: none;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

nav ul li {
	padding: 10px 20px;
}

nav ul li a {
	display: block;
	text-decoration: none;
	color: #333;
}

nav ul li ul {
	display: none;
	position: absolute;
	background-color: #fff;
}

nav ul li:hover ul {
	display: block;
}

nav ul li ul li {
	display: block;
}

nav ul li ul li:hover {
	background-color: #eee;
}

nav img {
	height: 50px;
	width: 125px;
}
</style>
<body>
	<header>
		<!-- 로그인을 하지 않은 경우 -->
		<c:if test="${sessionScope.user eq null }">
			<nav>
				<ul>
					<li><img src="../../resources/img/main/logo.png" alt="logo"
						onclick="goHome()"></li>
					<li><a>예약</a></li>
					<li><a href="/review/list">후기</a></li>
					<li><a>공지</a></li>
					<li><a href="/user/login">로그인</a></li>
				</ul>
			</nav>
		</c:if>

		<!-- 로그인을 한 경우 -->
		<c:if test="${sessionScope.user ne null }">
			<!-- 관리자의 경우 -->
			<c:if test="${sessionScope.user eq 'admin' }">
				<nav>
					<ul>
						<li><img src="../../resources/img/main/logo.png" alt="logo"
							onclick="goHome()"></li>
						<li><a href="/user/selectSearchAll">회원 관리</a></li>
						<li class="dropdown"><a>지점 관리</a>
							<ul>
								<li><a href="/reservation/admin/adminReservationList">예약 관리</a></li>
								<li><a href="/reservation/admin/adminProductList">상품 관리</a></li>
							</ul></li>
						<li class="dropdown"><a>게시판 관리</a>
							<ul>
								<li><a href="/review/list">후기 관리</a></li>
								<li><a href="/notice/listAdmin">공지 관리</a></li>
								<li><a href="/comment/list">문의 관리</a></li>
							</ul></li>
						<li class="dropdown"><a><b>${name }</b>님</a>
							<ul>
								<li><a href="/user/mypage?userId=${sessionScope.user }">마이페이지</a></li>
								<li><a href="/user/logout" onclick="return logout()">로그아웃</a>
								</li>
							</ul></li>
					</ul>
				</nav>
			</c:if>
			<!-- 이용자의 경우 -->
			<c:if test="${sessionScope.user ne 'admin' }">
				<nav>
					<ul>
						<li><img src="../../resources/img/main/logo.png" alt="logo"
							onclick="goHome()"></li>
						<li><a href="/officeMap">예약</a></li>
						<li><a href="/review/list">후기</a></li>
						<li><a href="/notice/view">공지</a></li>
						<li class="dropdown"><a><b>${name }</b>님</a>
							<ul>
								<li><a href="/user/mypage?userId=${sessionScope.user }">마이페이지</a></li>
								<li><a href="/question/view">문의하기</a></li>
								<li><a>예약내역</a></li>
								<li><a href="/user/logout" onclick="return logout()">로그아웃</a></li>
							</ul></li>
					</ul>
				</nav>
			</c:if>
		</c:if>
	</header>
	<script>
		function goHome() {
			location.href = "/";
		}
		
		var dropdown = document.querySelector('.dropdown');
		dropdown.addEventListener('click', function() {
			var menu = dropdown.querySelector('#dropBox')[0];
			if (menu.style.display === 'none') {
				menu.style.display = 'block';
			} else {
				menu.style.display = 'none';
			}
		});
	</script>
</body>
</html>