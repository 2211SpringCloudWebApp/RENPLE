<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>예약하기</title>
  <link rel="stylesheet" href="/resources/reservationCss/payment.css">
  <!-- / 카카오 주소 API -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- / 달력 API -->
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
  <link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <!-- / 결제 API -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!--  -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<body>
  <c:if test="${sessionScope.user eq null }">
  	<script>
    	alert("로그인이 필요합니다.");
    	location.href="/user/login";
  	</script>
  </c:if>
  <div id="container">
    <jsp:include page="../../header.jsp"></jsp:include>

    <main>
    <form id="form1" action="/payment" method="post">
      <h2 id="main-heading">예약하기</h2>
      <div class="contents">
        
        <div class="box-form-left">
          <h3>예약 공간</h3>
          <div class="space-info">
            <div class="info-photo">
              <h4>교대점</h4>
              <span><img src="/resources/img/reservation/reser_gyodae.jpg"></span>
              <p>
                1. 교대역 3분 거리! <br>
                2. 미팅룸 ,푸드바, 프린팅 스테이션, 사무 가구 구비 <br>
                3. 외부음식 및 주류 반입, 포장, 배달 가능. <br>
                4. 간단한 조리 가능. <br>
                최상의 서비스와 컨디션으로 이용하시기 편하게 준비해놓고<br>
                기다리고 있겠습니다 :)
              </p>
            </div>
          </div>
          <ul class="list-detail">
            <li>
              <span class="tit">> &nbsp;&nbsp;공간유형</span>
              <span class="data">회의실, 세미나룸</span>
            </li>
            <li>
              <span class="tit">> &nbsp;&nbsp;예약인원</span>
              <span class="data">최소 2명 ~ 최대 40명</span>
            </li>
          </ul>

          <div class="user-info">
            <div class="info-heading">
              <h3>예약자 정보</h3>
              <h3 class="info-requ">* 필수입력</h3>
            </div>


            <div>
              <dl class="flex-box">
                <dt class="flex-tit">
                  <label for="name">예약자</label>
                  <span class="ico-requ">*</span>
                </dt>
                <dd class="flex">
                  <input type="text" id="orderName" name="orderName" value="${user.userName }" required="required">
                </dd>
              </dl>
			  
              <dl class="flex-box">
                <dt class="flex-tit">
                  <label for="name">연락처</label>
                  <span class="ico-requ">*</span>
                </dt>

                <dd class="flex-phone">
                  <div class="phone-col">
                    <select name="phone1" name="Phone1"  id="orderPhone1" title="휴대폰 앞자리">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="016">016</option>
                      <option value="017">017</option>
                      <option value="018">018</option>
                      <option value="019">019</option>
                    </select>
                  </div>
                  <span>-</span>
                  <div class="phone-col">
                    <input name="phone2" name="Phone2" value="${phone2 }" id="orderPhone2"  maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" title="휴대폰 중간자리" type="tel">
                  </div>
                  <span>-</span>
                  <div class="phone-col">
                    <input name="phone3" name="Phone3" value="${phone3 }" id="orderPhone3" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required" title="휴대폰 뒷자리" type="tel">
                  </div>
                </dd>
              </dl>

              <dl class="flex-box">
                <dt class="flex-tit">
                  <label for="name">이메일</label>
                  <span class="ico-requ">*</span>
                </dt>
                <dd class="flex">
                  <input type="email" name="orderEmail" value="${user.userEmail }" id="orderEmail" required="required">
                </dd>
              </dl>
			  
              <dl class="flex-box">
                <dt class="flex-tit">
                  <label for="name">주소</label>
                  <span class="ico-requ">*</span>
                </dt>
                <dd class="flex-addr">
                  <input type="text" name="postCode" id="postcode" placeholder="우편번호" readonly="readonly" required="required">
                  <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                  <input type="text" class="flex-addr-col" name="roadAddress" id="roadAddress" placeholder="도로명주소" readonly="readonly" required="required"><br>
                  <input type="text" class="flex-addr-col" name="detailAddress" id="detailAddress" placeholder="상세주소" required="required">
                  <input type="hidden" id="jibunAddress">
				  <input type="hidden" id="extraAddress">
                </dd>
              </dl>

              <dl class="flex-box">
                <dt class="flex-tit">
                  <label for="name">요청사항</label>
                </dt>
                <dd class="flex">
                  <textarea name="orderRequest" id="orderRequest" cols="73" rows="7"></textarea>
                </dd>
              </dl>

            </div>


            <div class="info-notice">
              <h3>예약시 주의사항</h3>
              <ul>
                <li><span>1</span>
                  기물 파손 및 분실 시 전액 원가로 배상하셔야 하며, 부주의한 안전사고 등은 책임지지 않습니다.
                </li>
                <li><span>2</span>
                  공간 내에서 불법적인 행위는 절대 금합니다.
                </li>
                <li><span>3</span>
                  흡연은 건물 1층 흡연장 및 16층 옥상에서 가능합니다.<br>
                  (옥상에서도 아름다운 한강, 동여의도 조망이 가능합니다.)<br>
                  흡연 발견 시 즉각 퇴실처리 되시며 보증금 환불 불가합니다.
                </li>
                <li><span>4</span>
                  분실물에 대해서는 최대한 찾아서 돌려드리오나 찾아가지 않으시거나 연락 없으실 시 폐기처분합니다.
                </li>
                <li><span>5</span>
                  고성방가 및 상식 수준 이상의 소음은 금지합니다.
                </li>
                <li><span>6</span>
                  퇴실 전 공간 정리, 설거지, 냉난방기와 조명 OFF를 부탁드립니다.<br>
                  (뒷정리 미흡, 입퇴실 미준수 시 보증금 환급이 불가합니다.)
                </li>
              </ul>
            </div>
          </div>
        </div>

        
        <div class="box-form-right">
          <div class="info-pay">
            <h3>결제 예정 금액</h3>
            <ul>
              <li>
                <span class="info-pay-col1">예약인원</span>
                <span class="info-pay-col2">
               	  <input type="number" name="orderUserCount" id="reservationUserCount" class="totalCount" max="40" min="2" placeholder="0명"
               	  	     onkeyup="this.value=this.value.replace(/[^0-9]/g,''); totalCount()" required="required" />
                </span>
                
              </li>
              <li>
                <span class="info-pay-col1">예약날짜</span>
                <span class="info-pay-col2">
                  <input type="text" name="reservationDate" id="orderDate" class="datepicker inp" placeholder="선택" readonly="true" required="required"/>
                </span>
              </li>
              <li id="pay-result">
                <span id="pay-result-left">\</span>
                <span id="pay-result-right">239,000</span>
              </li>
            </ul>
            <input type="button" id="payment" value="결제" onclick="iamport()">
          </div>
        </div>
      </div>
      
      <input type="hidden" name="userId" value="${sessionScope.user }">
      <input type="hidden" name="productNo" value="21">
      <button type="submit" id="submit"></button>
    </form>
    
   	 	<!-- 예약된 날짜들 hidden으로 값 생성한뒤 JS에서 사용.  -->
	    <c:forEach var="date" items="${rList}">
	    	<input type="hidden" class="date" value="${date }">
		</c:forEach>
    
    </main>
	<jsp:include page="../../footer.jsp"></jsp:include>
  </div>
  
  <script>
  	function totalCount(){
  		const inputNumber = document.querySelector(".totalCount");

  		inputNumber.addEventListener('input', () => {
  		  const value = parseInt(inputNumber.value);
  		  if (value < 2) {
  		    inputNumber.value = 2;
  		    alert('2보다 작은 값을 입력할 수 없습니다.');
  		  } else if (value > 40) {
  		    inputNumber.value = 40;
  		    alert('40보다 큰 값을 입력할 수 없습니다.');
  		  }
  		});
  	}
  
  
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                
            }
        }).open();
    }

    //------------ 달력 ------------------
    $.datepicker.setDefaults({
        closeText: "닫기",
        prevText: "이전달",
        nextText: "다음달",
        currentText: "오늘",
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
            "7월", "8월", "9월", "10월", "11월", "12월"
        ],
        monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
            "7월", "8월", "9월", "10월", "11월", "12월"
        ],
        dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
        dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
        dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
        weekHeader: "주",
        dateFormat: "yy-m-d", // 날짜형태 예)yy년 m월 d일
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: "년",
       	beforeShowDay: disableAllTheseDays
    })

    $(".datepicker").datepicker({
        minDate: 0
    })
	
    // 예약된 날짜 선택 불가.
    var disabledDays = ["2023-3-12"];
    var date = document.querySelectorAll(".date");
    for(var i=0; i < date.length; i++){
    	disabledDays.push(date[i].value);
    }
    
    
    function disableAllTheseDays(date) {
        var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
        for (i = 0; i < disabledDays.length; i++) {
            if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
                return [false];
            }
        }
        return [true];
    }

    //  ------------------------------------
    
    function iamport(){
    	var orderName = document.querySelector("#orderName").value
    	var orderEmail = document.querySelector("#orderEmail").value
		//가맹점 식별코드
		IMP.init('imp34880640');
		IMP.request_pay({
		    pg : 'kicc',         // pg사
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '렌플 - 교대점 ' ,     //결제창에서 보여질 이름
		    amount : 20,        //실제 결제되는 가격
		    buyer_email : orderEmail,
		    buyer_name : orderName,
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/verifyIamport/" + rsp.imp_uid 
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
		        	console.log("결제 및 결제검증완료");
		        	document.querySelector("#submit").click();
	        	} else {
	        		console.log("결제 실패");
	        	}
	        });
		});
	}
</script>
</body>
</html>