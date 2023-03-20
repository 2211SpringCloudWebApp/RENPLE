<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>예약 페이지</title>
  <link rel="stylesheet" href="/resources/reservationCss/officeMap.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <!-- 카카오 지도 -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1cae0e9f167c56373b7a3b90893b809&libraries=services"></script>
  <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
  
  <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <div id="container">
  <jsp:include page="../../header.jsp"></jsp:include>


  <main>
    <div id="menu">
      <div id="menu_top">
        <img src="/resources/img/reservation/nav_map.svg">
        <h5>국내 1위 공유 오피스, 렌플</h5>
        <h4>15개의 렌플 지점 중</h4>
        <h4>원하는 지점 위치를 확인해보세요</h4>
      </div>
      <div id="menu_middle">
        
        <form action="/member/job.do" method="get">
          <div class="dropdown">
            <button type="button" id="location" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
              지역선택
            </button>
            <div class="dropdown-menu">
              <h5 class="dropdown-header">강남지역</h5>
              <div class="dropdown-list">
                <li><a class="dropdown-item" href="#" onclick="detail_page('서울 강남구 강남대로 지하 396', '강남구');">강남구<span>(4)</span></a></li>
                <li><a class="dropdown-item" href="#" onclick="detail_page('서울 서초구 서초대로 지하 294', '서초구');">서초구<span>(2)</span></a>
                <li><a class="dropdown-item" href="#" onclick="detail_page('서울 영등포구 의사당대로 지하 101', '영등포구');">영등포구<span>(1)</span></a>
                <li><a class="dropdown-item" href="#" onclick="detail_page('서울 동작구 남부순환로 지하 2089', '관악구');">관악구<span>(1)</span></a>
                <li><a class="dropdown-item" href="#" onclick="detail_page('서울 구로구 도림천로 477', '구로구');">구로구<span>(1)</span></a>
              </div>

              <h5 class="dropdown-header">강북지역</h5>
              <div class="dropdown-list">
                <li><a class="dropdown-item" href="#" onclick="detail_page('서울 중구 을지로 지하 106', '중구');">중구<span>(2)</span></a></li>
                <li><a class="dropdown-item" href="#" onclick="detail_page('서울 종로구 세종대로 지하 172', '종로구');">종로구<span>(1)</span></a></li>
                <li><a class="dropdown-item" href="#" onclick="detail_page('서울 용산구 한강대로 지하 112', '용산구');">용산구<span>(1)</span></a></li>
                <li><a class="dropdown-item" href="#" onclick="detail_page('서울 성동구 아차산로 100', '성동구');">성동구<span>(1)</span></a></li>
              </div>

              <h5 class="dropdown-header">인천지역</h5>
              <div class="dropdown-list">
                <li><a class="dropdown-item" href="#" onclick="detail_page('인천 부평구 광장로 16', '부평구');">부평구<span> (1)</a></li>
              </div>

            </div>
          </div>
        </form>
        <p><span id="list_count">15</span>개의 지점이 있어요.</p>
      </div>



      <div id="menu_bottom">
        <div id="menu_bottom_list">

          <div class="list-item" onclick="location.href='/gangnam1'" data-value="서울 강남구 강남대로 지하 396">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>강남1호점</h4></div>
                <div class="line-2">2</div>
                <div class="line-12">12</div>
              </div>
              <div class="shop-location">강남역 2, 3번 출구 도보 1분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 강남구 강남대로 지하 396">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>강남2호점</h4></div>
                <div class="line-2">2</div>
                <div class="line-12">12</div>
              </div>
              <div class="shop-location">강남역 4번 출구 도보 5분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 강남구 강남대로 지하 396">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>역삼점</h4></div>
                <div class="line-2">2</div>
              </div>
              <div class="shop-location">역삼역 3번 출구 도보 5분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 강남구 강남대로 지하 396">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>신논현점</h4></div>
                <div class="line-9">9</div>
                <div class="line-12">12</div>
              </div>
              <div class="shop-location">신논현역 6번 출구 도보 2분 거리</div>
            </div>
          </div>

          <div class="list-item" onclick="location.href='/gyodae'"data-value="서울 서초구 서초대로 지하 294">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>교대점</h4></div>
                <div class="line-2">2</div>
                <div class="line-3">3</div>
              </div>
              <div class="shop-location">교대역 8번 출구 도보 3분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 서초구 서초대로 지하 294">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>서초점</h4></div>
                <div class="line-3">3</div>
              </div>
              <div class="shop-location">남부터미널역 3번 출구 도보 5분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 영등포구 의사당대로 지하 101">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>여의도점</h4></div>
                <div class="line-5">5</div>
                <div class="line-9">9</div>
              </div>
              <div class="shop-location">여의도역 3번 출구 도보 3분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 동작구 남부순환로 지하 2089">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>사당점</h4></div>
                <div class="line-2">2</div>
                <div class="line-4">4</div>
              </div>
              <div class="shop-location">사당역 6번 출구 도보 3분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 구로구 도림천로 477">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>구로점</h4></div>
                <div class="line-2">2</div>
              </div>
              <div class="shop-location">구로디지털단지역 3번 출구 도보 4분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 중구 을지로 지하 106">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>을지로점</h4></div>
                <div class="line-2">2</div>
                <div class="line-3">3</div>
              </div>
              <div class="shop-location">을지로3가역 2번 출구 도보 4분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 중구 을지로 지하 106">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>명동점</h4></div>
                <div class="line-2">2</div>
              </div>
              <div class="shop-location">명동역 7번 출구 도보 5분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 종로구 세종대로 지하 172">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>광화문점</h4></div>
                <div class="line-5">5</div>
              </div>
              <div class="shop-location">광화문역 5번 출구 도보 2분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 용산구 한강대로 지하 112">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>용산점</h4></div>
                <div class="line-1">1</div>
                <div class="line-4">4</div>
              </div>
              <div class="shop-location">신용산역 2번 출구 도보 3분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="서울 성동구 아차산로 100">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>성수점</h4></div>
                <div class="line-2">2</div>
              </div>
              <div class="shop-location">성수역 2번 출구 도보 2분 거리</div>
            </div>
          </div>

          <div class="list-item" data-value="인천 부평구 광장로 16">
            <button>바로가기</button>
            <div class="shop">
              <div class="shop-title">
                <div><h4>부평역</h4></div>
                <div class="line-1">1</div>
              </div>
              <div class="shop-location">부평역 3번 출구 도보 4분 거리</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="map"></div>
    
  </main>
  <jsp:include page="../../footer.jsp"></jsp:include>
  </div>
 
  <script>
    window.onload = function(){
      sample5_execDaumPostcode('서울 강남구 강남대로 지하 396');
    }

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 4 // 지도의 확대 레벨
        };
    
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    // 마커 테스트
    var positions = [
    {
        title: '강남1호점', 
        latlng: new kakao.maps.LatLng(37.4956614, 127.0331457)
    },
    {
        title: '강남2호점', 
        latlng: new kakao.maps.LatLng(37.4965304, 127.024758)
    },
    {
        title: '역삼점', 
        latlng: new kakao.maps.LatLng(37.4990915, 127.0325779)
    },
    {
        title: '신논현점', 
        latlng: new kakao.maps.LatLng(37.5021078, 127.0261636)
    },
    {
        title: '교대점', 
        latlng: new kakao.maps.LatLng(37.4893682, 127.0136031)
    },
    {
        title: '서초점', 
        latlng: new kakao.maps.LatLng(37.4885013, 127.0137038)
    },
    {
        title: '여의도점', 
        latlng: new kakao.maps.LatLng(37.5193625, 126.9274176)
    },
    {
        title: '사당점', 
        latlng: new kakao.maps.LatLng(37.4801001, 126.9820634)
    },
    {
        title: '구로점', 
        latlng: new kakao.maps.LatLng(37.4820869, 126.9013946)
    },
    {
        title: '을지로점', 
        latlng: new kakao.maps.LatLng(37.5636171, 126.9896517)
    },
    {
        title: '명동점', 
        latlng: new kakao.maps.LatLng(37.5615436, 126.9884641)
    },
    {
        title: '광화문점', 
        latlng: new kakao.maps.LatLng(37.5718258, 126.9714147)
    },
    {
        title: '용산점', 
        latlng: new kakao.maps.LatLng(37.5255274, 126.9636506)
    },
    {
        title: '성수점', 
        latlng: new kakao.maps.LatLng(37.5423589, 127.0557611)
    },
    {
        title: '부평점', 
        latlng: new kakao.maps.LatLng(37.4905177, 126.7236766)
    },
    {
        title: '지하철', 
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    },
    // {
    //     title: '근린공원',
    //     latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    // }
  ];
  var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
  for (var i = 0; i < positions.length; i ++) {
      
      // 마커 이미지의 이미지 크기 입니다
      var imageSize = new kakao.maps.Size(24, 35); 
      
      // 마커 이미지를 생성합니다    
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
      
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
          map: map, // 마커를 표시할 지도
          position: positions[i].latlng, // 마커를 표시할 위치
          title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
          image : markerImage // 마커 이미지 
      });
  }

    //
    function sample5_execDaumPostcode(addr) {
      geocoder.addressSearch(addr, function(results, status) {
          if (status === daum.maps.services.Status.OK) {
              var result = results[0]; 
              var coords = new daum.maps.LatLng(result.y, result.x);
              
              mapContainer.style.display = "block";
              map.relayout();
              map.setCenter(coords);
              marker.setPosition(coords);
          }
      });
    }
    function detail_page(data, place){
      var list = document.querySelectorAll(".list-item");
      var list_count = document.querySelector("#list_count");
      var location = document.querySelector("#location");   // 지역선택
      var a = document.querySelector(".dropdown-item").innerHTML;   // 강남구(4), 서초구(2)
      var count = 0;

      list.forEach(function(item, index, array){
        var value = item.dataset.value;
        if(data != value){
          item.style.display = 'none';
        }
        if(data == value){
          count++;                           // 지점 개수 체크
          item.style.display = "block";      // div show
          sample5_execDaumPostcode(data);    // 지도 좌표 변경
          location.innerHTML= place;
        }
        list_count.innerHTML = count;
      });
    }

  </script>
</body>
</html>