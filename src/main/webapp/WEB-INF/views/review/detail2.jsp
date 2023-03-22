<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기글 상세 - ${review.reviewTitle }</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../../resources/reviewCss/detail.css">
<link rel="icon" href="data:,">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
.link-icon.twitter {
	background-image: url(/resources/img/review/twitter.png);
	background-repeat: no-repeat;
	width: 75px;
	height: 50px;
}

.link-icon.facebook {
	background-image: url(/resources/img/review/facebook.png);
	background-repeat: no-repeat;
	width: 75px;
	height: 50px;
}

.link-icon.like-btn {
	background-image: url(/resources/img/review/like.png);
	background-repeat: no-repeat;
	width: 75px;
	height: 50px;
}

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<!-- 		헤더 영역 -->
	<jsp:include page="../header.jsp"></jsp:include>


	<!-- 		=== === === 메인 영역 === === === -->
	<div id="container">
		<p id="maintitle" style="font-size: 30px;">
			<b>상세 후기</b>
		</p>
		<div id="button-area">
			<c:url var="rModify" value="/review/modifyView">
				<c:param name="reviewNo" value="${review.reviewNo }" />
			</c:url>
			<c:choose>
				<c:when test="${user == review.userId || user == 'admin'}">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='${rModify}'">후기 수정</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger"
						onclick="removeCheck(${review.reviewNo});">후기 삭제</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-secondary"
						onclick="javascript:btn('회원정보가 다릅니다.')">후기 수정</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger"
						onclick="javascript:btn('회원정보가 다릅니다.')">후기 삭제</button>
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test="${review.reviewFilename eq null }">
			<div id="main-contant-noimg">
				<div id="ratingStar">
					<label style="color: white;"> <input type="hidden"
						name="reviewRating" value="${review.reviewRating }" step="0.1"
						min="0.1" max="5" readonly />
					</label>
					&nbsp;<div class="rating-wrap">
						&nbsp;<div class="rating">
						&nbsp;<div class="overlay"></div>
					&nbsp;</div>
				&nbsp;</div>
				</div>
				<p class="reviewContent">${review.reviewContent }</p>
			</div>
		</c:if>
		<c:if test="${review.reviewFilename ne null }">
			<div id="main-contant">
				<div id="photo-area">
					<img class="review-photo"
						src="/resources/img/review/uploadimg/${review.reviewFilename }"
						alt="리뷰 이미지">
				</div>
				<div id="text-area">
					<div id="ratingStar">
						<label style="color: white;"> <input type="hidden"
							name="reviewRating" value="${review.reviewRating }" step="0.1"
							min="0.1" max="5" readonly />
						</label>
						&nbsp;<div class="rating-wrap">
							&nbsp;<div class="rating">
							&nbsp;<div class="overlay"></div>
						&nbsp;</div>
					&nbsp;</div>
					</div>
					<p class="reviewContent">${review.reviewContent }</p>
				</div>
			</div>
		</c:if>
		<br>
		<div id="button-area2">
			<a id="btnTwitter" class="link-icon twitter" style="Color: white;"
				href="javascript:shareTwitter();"></a>&nbsp;&nbsp;&nbsp; <a
				id="btnFacebook" class="link-icon facebook" style="Color: white;"
				href="javascript:shareFacebook();"></a> &nbsp;&nbsp;&nbsp;
			<c:if test="${user == null }">
				<a class="link-icon like-btn" style="cursor: pointer;"
					onclick="alert('로그인이 필요한 기능입니다.');"></a>
			</c:if>
			<c:if test="${user != null }">
				<input type="hidden" name="reviewNo" value="${review.reviewNo }">
				<a class="link-icon like-btn" style="cursor: pointer;"
					onclick="location.href = '/review/likeUp?reviewNo=${review.reviewNo }'"></a>
			</c:if>
		</div>
		<button type="button" class="btn btn-secondary"
			onclick="location.href='/review/list'">후기 목록</button>
		<br> <br>
	</div>


	<!-- 		=== === === 댓글영역 === === === -->
	<h1 style="Color: white; text-align: center;">댓글 목록</h1>
	<br>
	<br>
	<div class="comment-area">
		<h4 style="Color: white; text-align: center;">댓글입력</h4>
		<br>
		<c:if test="${user != null }">
			<div style="color: white;" class="commentwrite">
				<form action="/reviewcomment/write" method="post">
					<input type="hidden" id="reviewNo" name="reviewNo"
						value=${review.reviewNo }> <input type="hidden"
						id="userId" name="userId" value="${user }"> 작성자 : ${user }&nbsp;<input
						type="text" id="commentContent" name="commentContent"
						placeholder="내용을 입력해주세요."> <input type="submit"
						class="btn btn-secondary commentsubmit" value="작성">
				</form>
			</div>
		</c:if>
		<c:if test="${user == null }">
			<div class="commentwrite">
				<input type="hidden" id="reviewNo" name="reviewNo"
					value=${review.reviewNo }> <input type="hidden" id="userId"
					name="userId" value="${user }"> <input type="text"
					id="commentContent" name="commentContent" placeholder="내용을 입력해주세요.">
				<input type="submit" class="btn btn-secondary commentsubmit"
					onclick="alert('로그인이 필요한 기능입니다.');" value="작성">
			</div>
		</c:if>

		<div id="commentList">
			<table id="comment-tbl">
				<c:forEach items="${cList }" var="reviewcomment" varStatus="i">
					<c:if test="${reviewcomment.commentType == 0 }">
						<tr onclick="toggleBtn2(${reviewcomment.commentNo})" style="cursor: pointer;">
							<td>${i.count }.&nbsp;&nbsp;</td>
							<td>작성자 : ${reviewcomment.userId }&nbsp;</td>
							<td>작성 날짜 : <fmt:formatDate
									value="${reviewcomment.commentCreateDate}" pattern="yyyy-MM-dd" /></td>
							<c:if test="${user == reviewcomment.userId || user == 'admin'}">
								<td>&nbsp;
									<button onclick="toggleBtn1(${reviewcomment.commentNo})">수정</button>
								</td>
								<td>&nbsp;
									<button onclick="commentRemoveCheck(${reviewcomment.commentNo}, ${review.reviewNo });">삭제</button>
								</td>
							</c:if>
						</tr>
						<tr>
							<td></td>
							<td colspan="4"><b>↳ ${reviewcomment.commentContent }</b></td>
						</tr>
					</c:if>
					<tr>
						<td></td>
						<td colspan="4" style="display: none;"
							id="${reviewcomment.commentNo }">
							<c:if test="${user == reviewcomment.userId || user == 'admin' }">
								<div class="modifyDiv">
									<form action="/reviewcomment/modify" method="post">
										<input type="hidden" id="commentNo" name="commentNo"
											value=${reviewcomment.commentNo }> <input
											type="hidden" id="userId" name="userId" value="${user }">
										<input type="hidden" id="reviewNo" name="reviewNo"
											value="${reviewcomment.reviewNo }"> <input
											type="text" id="commentContent" name="commentContent"
											value="${reviewcomment.commentContent }"
											placeholder="수정할 내용을 입력해주세요."> 
										<input type="submit" class="commentsubmit" value="수정">
									</form>
								</div>
							</c:if>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3" style="display: none;"
							id="${reviewcomment.commentNo }write">
							<c:if test="${user == reviewcomment.userId || user == 'admin' }">
								<div class="modifyDiv">
									<form action="/reviewcomment/writewrite" method="post">
										<input type="hidden" id="commentNo" name="commentNo"
											value=${reviewcomment.commentNo }> <input
											type="hidden" id="userId" name="userId" value="${user }">
										<input type="hidden" id="reviewNo" name="reviewNo"
											value="${reviewcomment.reviewNo }">내용 입력 <input
											type="text" id="commentContent" name="commentContent"
											placeholder="내용을 입력해주세요."> 
										<input type="submit" class="commentsubmit" value="입력">
									</form>
								</div>
							</c:if>
						</td>
						<c:if test="${reviewcomment.commentType == 1 }">
							<tr>
								<td></td>
								<td>작성자 : ${reviewcomment.userId }&nbsp;</td>
								<td>작성 날짜 : <fmt:formatDate
										value="${reviewcomment.commentCreateDate}" pattern="yyyy-MM-dd" /></td>
								<c:if test="${user == reviewcomment.userId || user == 'admin'}">
									<td>&nbsp;
										<button onclick="toggleBtn1(${reviewcomment.commentNo})">수정</button>
									</td>
									<td>&nbsp;
										<button onclick="commentRemoveCheck(${reviewcomment.commentNo}, ${review.reviewNo });">삭제</button>
									</td>
								</c:if>
							</tr>
							<tr>
								<td></td>
								<td colspan="4"><b>↳ ${reviewcomment.commentContent }</b></td>
							</tr>	
						</c:if>
				</c:forEach>
			</table>
		</div>
	</div>

	<!-- 		푸터 영역 -->
	<jsp:include page="../footer.jsp"></jsp:include>


	<script>
			function removeCheck(reviewNo) {
				if(confirm("게시글을 삭제 하시겠습니까?")) {
					location.href = "/review/remove?reviewNo=" + reviewNo;
				}
			}
			function commentRemoveCheck(commentNo, reviewNo) {
				if(confirm("댓글을 삭제 하시겠습니까?")) {
					
					location.href = "/reviewcomment/remove?commentNo=" + commentNo + "&reviewNo=" + reviewNo; 
				}
			}
			
			function shareTwitter() {
				var sendURL = "http://127.0.0.1:9999/review/detail?reviewNo=" + ${review.reviewNo};
				window.open("https://twitter.com/intent/tweet?text=&url" + sendURL);				
			}
			function shareFacebook() {
			    var sendUrl = "http://127.0.0.1:9999/review/detail?reviewNo=" + ${review.reviewNo};
			    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
			}
			
			function btn(sample) {
				alert(sample);
			}
			
			// num = ${reviewcomment.commentNo}
			function toggleBtn1(num) {
			  const btn1 = document.getElementById(num.toString());
				  
				  // btn1 숨기기
				if(btn1.style.display !== 'none') {
				    btn1.style.display = 'none';
				  }
				  // btn1 보이기
				  else {
				    btn1.style.display = 'block';
				  }
			}
			// num = ${reviewcomment.commentNo}
			function toggleBtn2(num) {
				var write = 'write';
				const btn2 = document.getElementById(num.toString() + wrtie);
				  
					  
				// btn2 숨기기
				if(btn2.style.display !== 'none') {
				    btn2.style.display = 'none';
				}
				// btn2 보이기
				else {
				    btn2.style.display = 'block';
				}
			}

		// =================================================================================================
		// =================================================================================================
		// =================================================================================================
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
</body>
</html>