<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>여의도점 - 렌플</title>
  <link rel="stylesheet" href="/resources/reservationCss/office.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    #modal.modal-overlay {
       width: 100%;
       height: 100%;
       position: absolute;
       left: 0;
       top: 0;
       display: flex;
       flex-direction: column;
       align-items: center;
       justify-content: center;
       background: rgba(255, 255, 255, 0.4); 
       box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
       backdrop-filter: blur(1.5px);
       -webkit-backdrop-filter: blur(1.5px);
       border-radius: 10px;
       border: 1px solid rgba(255, 255, 255, 0.18);
       z-index: 100;
       display: none;
   }
   #modal .modal-window {
       background: #f1f1f1;
       box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
       backdrop-filter: blur( 13.5px );
       -webkit-backdrop-filter: blur( 13.5px );
       border-radius: 10px;
       border: 1px solid rgba( 255, 255, 255, 0.18 );
       width: 500px;
       height: 550px;
       position: relative;
       top: -50px;
       padding: 10px;
   }
   #modal .title {
       padding-left: 180px;
       display: inline;
       text-shadow: 1px 1px 2px gray;
       color: black;
       
   }
   #modal .title h1 {
       display: inline;
   }
   #modal .close-area {
       display: inline;
       float: right;
       padding-right: 10px;
       cursor: pointer;
       text-shadow: 1px 1px 2px gray;
       color: black;
       font-size: 33px;
   }
   
   #modal .content {
       margin-top: 20px;
       padding: 0px 10px;
       text-shadow: 1px 1px 2px gray;
       color: black;
   }
   #input-main {
   	margin-top: 50px;
   }
   .input-box{
   	margin-bottom: 20px;
   }
   .modal-input{
   	width: 100%;
   	height: 50px;
   	padding: 0px 20px;
	font-size: 22px;
   }
   #input-find{
   	padding: 0px 20px;
   	text-align: right;
   	margin-bottom: 50px;
	margin-top: 50px;
   }
   #input-find a{
   	display: inline;
   }
   #loginBtn{
   	margin-bottom: 20px;
   }
   
    </style>
</head>

<body>
  <div>
  <jsp:include page="../../header.jsp"></jsp:include>
  
  <main>
<!-- 비로그인으로 예약 버튼 클릭시 모달창 띄우기 -->
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
			<div class="title">
                <h1>로그인</h1>
            </div>
            <div onclick="closeModal()" class="close-area">X</div>
            
            <form action="/user/modalLogin" method="post">
	            <input type="hidden" name="modal" value="yeouido">  <!-- 수정 -->
				<div id="inner">
					<div id="input-main">
						<div class="input-box">
							<input type="text" id="name" class="modal-input" name="userId" placeholder="아이디를 입력해주세요" required autofocus>
						</div>
						<div class="input-box">
							<input type="password" id="pw" class="modal-input" name="userPw" placeholder="비밀번호를 입력해주세요" required>
						</div>
					</div>
					
					<div id="input-find">
						<a href="#">아이디 찾기</a>
						<span>|</span>
						<a href="#">비밀번호 찾기</a>
					</div>
					<div id="input-btn">
						<button type="submit" class="modal-input" id="loginBtn">
							<span>로그인</span>
						</button>
						<button type="button" class="modal-input" onclick="location.href='/user/enroll'">
							<span>회원가입</span>
						</button>
					</div>
				</div>
			</form>
		</div>
    </div>
    <!-- ---------------------------------------------- -->
    
    <div id="demo" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
        <li data-target="#demo" data-slide-to="3"></li>
      </ul>

      <!-- The slideshow -->
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="/resources/img/reservation/pc_yeouido1_main_2.png" class="rounded" >
        </div>
        <div class="carousel-item">
          <img src="/resources/img/reservation/pc_yeouido1_main_3.png" class="rounded" >
        </div>
        <div class="carousel-item">
          <img src="/resources/img/reservation/pc_yeouido1_main_4.png" class="rounded" >
        </div>
        <div class="carousel-item">
          <img src="/resources/img/reservation/pc_yeouido1_main_5.png" class="rounded" >
        </div>
      </div>

      <!-- Left and right controls -->
      <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </a>
      <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
      </a>
    </div>
    <div id="middle"> 
      <div id="office-detail"> 
        <div id="office-detail-left">
          <section id="detail-1">
            <p>렌플만의 특별함</p>
            <ul>
              <li>
                <img src="/resources/img/reservation/detail1.png" alt="">
                <p>미팅룸</p>
              </li>
              <li>
                <img src="/resources/img/reservation/detail2.png" alt="">
                <p>푸드바</p>
              </li>
              <li>
                <img src="/resources/img/reservation/detail3.png" alt="">
                <p>프린팅 스테이션</p>
              </li>
              <li>
                <img src="/resources/img/reservation/detail4.png" alt="">
                <p>사무 가구</p>
              </li>
              <li>
                <img src="/resources/img/reservation/detail5.png" alt="">
                <p>24시간 냉난방</p>
              </li>
              <li>
                <img src="/resources/img/reservation/detail6.png" alt="">
                <p>네트워크</p>
              </li>
            </ul>
          </section>
          <section id="detail-2">
            <p>지점 리얼 후기</p>
            <section>
              <div id="detail-2-review-1">
                <a href="" target="_blank">
                  <img src="/resources/img/reservation/pc_yeouido1_review_1.png">
                  <div>
                    <span class="detail-span-top">
                      10인 기업
                    </span>
                    <p>
                      여의도의 여러 공유오피스들과 비교했을 때 가격과 제공 서비스가<br>
                      가장 합리적이어서 고민 없이 바로 계약을 체결했습니다.
                    </p>
                      <span class="detail-span-bottom" style="border-right: 1px solid #e4e4e4; padding-right: 15px;">여의도점</span>
                      <span class="detail-span-bottom" style="padding-left: 15px;">구기효님 </span>
                  </div>
                </a>  

              </div>
              <div id="detail-2-review-2">
                <a href="" target="_blank">
                  <img src="/resources/img/reservation/pc_yeouido1_review_2.png">
                  <div>
                    <span class="detail-span-top">
                      5인 기업
                    </span>
                    <p>
                      패스트파이브가 좋은 가장 첫 번째 이유는 입지!<br>
                      지하철역에 내려서 사무실까지 10분 이내로 가능해 만족스럽습니다.
                    </p>
                      <span class="detail-span-bottom" style="border-right: 1px solid #e4e4e4; padding-right: 15px;">여의도점</span>
                      <span class="detail-span-bottom" style="padding-left: 15px;">정기진님 </span>
                  </div>
                </a>

              </div>
            </section>
          </section>
        </div>

        <div id="office-detail-right">
          <header id="detail-header">
            <div>
              <ul>
                <li class="detail-subway-5">5 </li>
                <li class="detail-subway-9"> 9 </li>
              </ul>
              <h1>여의도점</h1>
              <dl>
                <div>
                  <dt> <img src="/resources/img/reservation/map_pin.svg" > </dt>
                  <dd> <span>서울특별시 영등포구 국제금융로2길 17</span> </dd>
                </div>
                <div>
                  <dt> <img src="/resources/img/reservation/tram.svg"> </dt>
                  <dd> <span>여의도역 3번 출구 도보 3분 거리</span> </dd>
                </div>
                <div>
                  <dt> <img src="/resources/img/reservation/corporate_fare.svg" > </dt>
                  <dd> <span>70평 규모</span> </dd>
                </div>
                <div>
                  <dt> <img src="/resources/img/reservation/tram.svg" > </dt>
                  <dd> <span>최소 인원 수 : 2명</span> </dd>
                </div>
                <div>
                  <dt> <img src="/resources/img/reservation/map_pin.svg"> </dt>
                  <dd> <span>최대 인원 수 : 35명</span> </dd>
                </div>
              </dl>
            </div>
            <button onclick="reservation('${sessionScope.user}');"> 예약하기 </button>
          </header>
        </div>
      </div>
    </div>
  </main>
 <jsp:include page="../../footer.jsp"></jsp:include>
 </div>
<script>
	 $(document).ready(function() {
	     var modal = document.querySelector("#modal");
	     modal.style.display = "none";
	 })	
	 
	 function reservation(userId) {
		    if (userId == null || userId == '') {
		        const modal = document.querySelector("#modal");
		        openModal();
		    } else {
		        location.href = "/yeouido/payment"; 
		    }
		}
	 
	function openModal(){
		document.querySelector("body").style.overflow="hidden";
		window.scrollTo(0,0);
        modal.style.display = "flex"
        
  	}
	function closeModal(){
  		document.querySelector("body").style.overflow="visible";
        modal.style.display = "none"
    }
</script>
</body>

</html>