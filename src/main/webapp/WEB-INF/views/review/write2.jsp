<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기 작성</title>
<!-- 		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
    	<link rel="stylesheet" href="../../../resources/reviewCss/write.css">
    	<style>
    		input[type=number]{
	            margin-bottom: 0;
	            margin-left: 8px;
	            padding: 6px 8px;
	            font-size: 1em;
	            border: none;
	            border-radius: 4px;
	        }
	        .rating-wrap{
	            padding: 10px;
	            display: flex;
	        }
	        .rating {
	            display: flex;
	            align-items: center;
	            position: relative;
	        }
	        .star {
	            width: 30px;
	            height: 30px;
	            margin-right: 2px;
	        }
	        .starcolor{
	            fill: #ff8844;
	        }
	        .star:last-of-type {
	            margin-right: 0;
	        }
	        .overlay {
	            background-color: #000;
	            opacity: 0.5;
	            position: absolute;
	            top: 0;
	            right: 0;
	            bottom: 0;
	            z-index: 1;
	            transition: all 0.3s ease-in-out;
	        }
	        @supports (mix-blend-mode: color) {
	            .overlay{
	                mix-blend-mode: color;
	                opacity: unset;
	            }
	        }
    	</style>
	</head>
	<body>
		<script>
			function add() {
				alert("로그인후 이용가능합니다.");
				history.back();
			}
//===================================================================================
//===================================================================================
			const starSize = 30, maxStar = 5, gutter = 2;//별 크기, 별 개수
	        let maskMax = 0; //오버레이 마스크 최대 너비
	        window.addEventListener('DOMContentLoaded',()=>{
	            //별 이미지 SVG 개수만큼 생성
	            for(let i = 0;i < maxStar;i++){
	                let el = document.createElement('div');
	                //el.classList.add('star');
	                el.style.width = starSize + 'px';
	                el.style.height = starSize + 'px';
	                el.style.marginRight = gutter + 'px';
	                //인라인 SVG 이미지 부착
	                el.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="none" class="starcolor" d="M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"/></svg>';
	                document.querySelector('.rating').appendChild(el);
	            }
	            
	            maskMax = parseInt(starSize * maxStar + gutter * (maxStar-1));//최대 마스크 너비 계산
	            document.querySelector('input[name=reviewRating]').max = maxStar;//입력 필드 최대값 재설정
	            setRating(document.querySelector('input[name=reviewRating]').value);//초기 별점 마킹
	
	            //별점 숫자 입력 값 변경 이벤트 리스너
	            document.querySelector('input[name=reviewRating]').addEventListener('change',(e)=>{
	                const val = e.target.value;
	                //계산식 - 마스크 최대 너비에서 별점x별크기를 빼고, 추가로 별점 버림 정수값x거터 크기를 빼서 마스크 너비를 맞춤
	                setRating(val);
	            })
	            
	            //별점 마킹 함수
	            function setRating(val = 0){
	                document.querySelector('.overlay').style.width = parseInt(maskMax - val * starSize - Math.floor(val) * gutter) + 'px';//마스크 크기 변경해서 별점 마킹
	            }
	            
	            //마우스 클릭 별점 변경 이벤트 리스너
	            document.querySelector('.rating').addEventListener('click',(e)=>{
	                //closest()로 .rating 요소의 왼쪽 위치를 찾아서 현재 클릭한 위치에서 빼야 상대 클릭 위치를 찾을 수 있음.
	                const maskSize = parseInt(maskMax - parseInt(e.clientX) + e.target.closest('.rating').getBoundingClientRect().left);//클릭한 위치 기준 마스크 크기 재계산
	                document.querySelector('.overlay').style.width = maskSize + 'px'; //오버레이 마스크 크기 변경해서 별점 마킹
	                document.querySelector('input[name=reviewRating]').value = Math.floor((maskMax - maskSize) / (starSize + gutter)) + parseFloat(((maskMax - maskSize) % (starSize + gutter) / starSize).toFixed(1));
	            })
	        })
		</script>
		<c:if test="${user == null }">
			<body onload = "add()">
		</c:if>
		<jsp:include page="../header.jsp"></jsp:include>
		<div id="container">
			<p id="maintitle"><strong>후기 작성</strong></p>
			<br>
			<div id="input-area">
				<form action="/review/write" method="post" enctype="multipart/form-data">
				<input type="hidden" name="userId" value="${user }">
				<input type="hidden" name="productNo" value=1>
				<input type="text" id="reviewTitle" name="reviewTitle" placeholder="  제목"> <br><br>
				
<!-- 				<input type="number" min="1" max="5" id="reviewRating" name="reviewRating" placeholder="  평점 (1~5 입력)"> <br><br> -->
				
				<label style="color: white;">
		            별점(아이콘을 클릭하여 조절) <input type="number" name="reviewRating" value="3" step="0.1" min="0.1" max="5" readonly/>
		        </label>
		        <div class="rating-wrap">
		       		<div class="rating">
		       			<div class="overlay"></div>
		        	</div>
		        </div>
				
				
				
				
				<textarea name="reviewContent" id="reviewContent" placeholder="  내용 (최대 1000자까지 입력가능)"></textarea> <br><br>
				<input type="file" name="uploadFile"> <br><br>
				<div id="button-area">
					<button type="submit" class="btn btn-secondary">작성</button>
					<button type="reset" class="btn btn-light">취소</button>
				</div>
				</form>
			</div>
			<br>
			<br>
			<br>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>