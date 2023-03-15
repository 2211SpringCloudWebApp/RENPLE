<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>강남 1호점 - 렌플</title>
  <link rel="stylesheet" href="/resources/reservationCss/office.css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
  <div>
  <jsp:include page="../../header.jsp"></jsp:include>
  
  <main>
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
          <img src="/resources/img/reservation/gangnam1_main_1.png" class="rounded" >
        </div>
        <div class="carousel-item">
          <img src="/resources/img/reservation/gangnam1_main_3.png" class="rounded" >
        </div>
        <div class="carousel-item">
          <img src="/resources/img/reservation/gangnam1_main_4.png" class="rounded" >
        </div>
        <div class="carousel-item">
          <img src="/resources/img/reservation/gangnam1_main_5.png" class="rounded" >
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
                  <img src="/resources/img/reservation/gangnam1_review_1.png">
                  <div>
                    <span class="detail-span-top">
                      14인 기업
                    </span>
                    <p>
                    간식, 마스크, 건강검진권 증정 등 다양한 이벤트 덕분에 업무 중
									  순간에 환기가 됩니다. 패스트파이브는 아낌없이 주는 나무 같아요!
                    </p>
                      <span class="detail-span-bottom" style="border-right: 1px solid #e4e4e4; padding-right: 15px;">강남1호점</span>
                      <span class="detail-span-bottom" style="padding-left: 15px;">신희채님 </span>
                  </div>
                </a>  

              </div>
              <div id="detail-2-review-2">
                <a href="" target="_blank">
                  <img src="/resources/img/reservation/gangnam1_review_2.png">
                  <div>
                    <span class="detail-span-top">
                      14인 기업
                    </span>
                    <p>
                    간식, 마스크, 건강검진권 증정 등 다양한 이벤트 덕분에 업무 중
									  순간에 환기가 됩니다. 패스트파이브는 아낌없이 주는 나무 같아요!
                    </p>
                      <span class="detail-span-bottom" style="border-right: 1px solid #e4e4e4; padding-right: 15px;">을지로점</span>
                      <span class="detail-span-bottom" style="padding-left: 15px;">김은지님 </span>
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
                <li class="detail-subway-2">2 </li>
                <li class="detail-subway-sin"> 신 </li>
              </ul>
              <h1>강남 1호점</h1>
              <dl>
                <div>
                  <dt> <img src="/resources/img/reservation/map_pin.svg" > </dt>
                  <dd> <span>강남구 강남대로 382</span> </dd>
                </div>
                <div>
                  <dt> <img src="/resources/img/reservation/tram.svg"> </dt>
                  <dd> <span>강남역 2, 3번 출구 도보 1분 거리</span> </dd>
                </div>
                <div>
                  <dt> <img src="/resources/img/reservation/corporate_fare.svg" > </dt>
                  <dd> <span>300평 규모, 총 2개 층</span> </dd>
                </div>
                <div>
                  <dt> <img src="/resources/img/reservation/tram.svg" > </dt>
                  <dd> <span>최소 인원 수 : 2명</span> </dd>
                </div>
                <div>
                  <dt> <img src="/resources/img/reservation/map_pin.svg"> </dt>
                  <dd> <span>최대 인원 수 : 30명</span> </dd>
                </div>
              </dl>
            </div>
            <button onclick="location.href='/gangnam1/payment'"> 예약하기 </button>
          </header>
        </div>
      </div>
    </div>
  </main>
 <jsp:include page="../../footer.jsp"></jsp:include>
 </div>
</body>

</html>