<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기글 상세</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    	<link rel="stylesheet" href="../../../resources/reviewCss/detail.css">
		<style>
			.link-icon { position: relative; display: inline-block; width: auto;    font-size: 14px; font-weight: 500; color: #333; margin-right: 10px; padding-top: 50px; }
			.link-icon.twitter { background-image: url(/resources/img/review/icon-twitter.png); background-repeat: no-repeat; }
			.link-icon.facebook { background-image: url(/resources/img/review/icon-facebook.png); background-repeat: no-repeat; } 
			.link-icon.like-btn { background-image: url(/resources/img/review/like.png); background-repeat: no-repeat; } 
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	<body>
		<!-- 헤더 -->
		<jsp:include page="../header.jsp"></jsp:include>
		
		
		<!-- 메인 -->
		<div id="container">
			<p id="maintitle"><b>상세 후기</b></p>
			<div id="button-area">
				<c:url var="rModify" value="/review/modifyView.do">
					<c:param name="reviewNo" value="${review.reviewNo }" />
				</c:url>
				<c:choose>
					<c:when test="${loginUser.userId == review.userId || loginUser.userType == 0}">
						<button type="button" class="btn btn-secondary" onclick="location.href='${rModify}'">후기 수정</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger" onclick="removeCheck(${review.reviewNo});">후기 삭제</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-secondary" onclick="javascript:btn('회원정보가 다릅니다.')">후기 수정</button>&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-danger" onclick="javascript:btn('회원정보가 다릅니다.')">후기 삭제</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="main-contant">
				<c:if test="${review.reviewFilename eq null }">
					<div id="photo-area">
					
					</div>
				</c:if>
				<c:if test="${review.reviewFilename ne null }">
				<div id="photo-area">
					<img class="review-photo" src="/resources/img/review/${review.reviewFilename }" alt="리뷰 이미지">
				</div>
				</c:if>
				<div id="text-area">
					<p>
						${review.reviewContent }
					</p>
				</div>
			</div>
			<br>
			<c:url var="rModify" value="/review/modifyView.do">
				<c:param name="reviewNo" value="${review.reviewNo }" />
			</c:url>
			<div id="button-area2">
				<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">Twitter</a>&nbsp;&nbsp;&nbsp;
				<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">facebook</a> &nbsp;&nbsp;&nbsp;
				<c:if test="${loginUser != null }">
				
				
					<form action="/review/likeUp.do" method="post">
						<button type="button" class="link-icon like-btn" >Like!</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</form>
					
					
				</c:if>
				<c:if test="${loginUser == null }">
				
				
<!-- 					<button type="button" class="link-icon like-btn" onclick="alert('로그인이 필요한 기능입니다.');">Like!</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
					<form action="/review/likeUp.do" method="post">
						<input type="hidden" name="reviewNo" value="${review.reviewNo }">
						<button type="submit" class="link-icon like-btn" >Like!</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</form>
				
				</c:if>
			</div>
			<button type="button" class="btn btn-secondary" onclick="location.href='/review/list.do'">후기 목록</button>
			<br>
			<br>
		</div>
		
		<h1 style="Color: white; text-align: center;"> 댓글 목록 </h1>
		<div id="comment-area">
			<div id="commentwrite">
				<form action="/reviewcomment/write.do" method="post">
					<h4 style="Color: white;">댓글입력</h4>
					<input type="hidden" id="reviewNo" name="reviewNo" value=${review.reviewNo }>
					<input type="hidden" id="userId" name="userId" value="admin">
					<input type="text" id="commentContent" name="commentContent" placeholder="내용을 입력해주세요.">
					<input type="submit" class="btn btn-secondary commentsubmit" value="작성">
				</form>
			</div>
			<ol class="commentList">
				<c:forEach items="${cList }" var="comment">
					<li>
						<p>
							작성자 : ${comment.userId } / 작성 날짜 : <fmt:formatDate value="${comment.commentCreateDate}" pattern="yyyy-MM-dd" />
						</p>
						<p>${comment.commentContent }</p>
						<br>
					</li>
				</c:forEach>
			</ol>
		</div>
		
		<!-- 푸터 -->
		<jsp:include page="../footer.jsp"></jsp:include>
		
		
		<script>
			function removeCheck(reviewNo) {
				if(confirm("삭제 하시겠습니까?")) {
					location.href = "/review/remove.do?reviewNo=" + reviewNo;
				}
			}
			
			function shareTwitter() {
				var sendURL = "http://127.0.0.1:9999/review/detail.do?reviewNo=" + ${review.reviewNo};
				window.open("https://twitter.com/intent/tweet?text=&url" + sendURL);				
			}
			function shareFacebook() {
			    var sendUrl = "http://127.0.0.1:9999/review/detail.do?reviewNo=" + ${review.reviewNo};
			    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
			}
			
			function btn(sample) {
				alert(sample);
			}
			
			$(".commentsubmit").on("click", function(){
				var formObj = $("form[name='commentForm']");
				formObj.attr("action", "/reviewcomment/write.do");
				formObj.submit();
			});
		</script>
	</body>
</html>