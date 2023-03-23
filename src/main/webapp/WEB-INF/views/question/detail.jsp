<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>문의사항 상세</title>
<link rel="stylesheet" href="../../../resources/questionCss/detail.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="outter">
		<h1>문의사항 상세</h1>
		<p>궁금한 점은 렌플에 물어보세요!</p>
		<div id="inner">
			<div id="contents">
			<input type="hidden" name="questionNo" value="${question.questionNo}">
				<div id="content1">
					<div id="content11">
						아이디 : ${question.userId }
					</div>
					<div id="content12">
						제목 : ${question.questionTitle }
					</div>
					<div id="content13">
						내용 : ${question.questionContent }
					</div>
						<c:if test="${not empty question.questionFilename}">
							<div id="content14">
								<div id="content15">
									첨부파일 : ${question.questionFilename }<br>
									<img src="../../../resources/uploadFiles/${question.questionFilename }" alt="문의 이미지">
								</div>
							</div>
						</c:if>
				</div>
				<div id="content2">
					<c:if test="${not empty question.commentContent }">
						<div id="content21">
							─────── ✦ 답변 ✦ ───────
							<br><br>
							${question.commentContent }
						</div>
					</c:if>
					<c:if test="${!not empty question.commentContent }">
						<div id="content22">
							─────── ✦ 답변이 등록되지 않았습니다. ✦ ───────
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="content-btn">
			<button>
				<a href="/question/view">목록으로</a>
			</button>
			<button>
				<a href="/question/modify?questionNo=${question.questionNo }">수정하기</a>
			</button>
			<button>
				<a href="javascript:void(0);" onclick="removeCheck(${question.questionNo });">삭제</a>
			</button>
		</div>
	</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	<script>
		function removeCheck(questionNo) {
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href = "/question/remove?questionNo=" + questionNo;
				}
			}
		
		const input = document.getElementById('fileImage');
	  	input.addEventListener('change', () => {
	    const file = input.files[0];
	    const reader = new FileReader();
	    reader.onload = () => {
	      const prevImg = document.getElementById('Container').querySelector('img');
	      if (prevImg) {
	        prevImg.remove();
	      }
	      const img = new Image();
	      img.src = reader.result;
	      document.getElementById('Container').appendChild(img);
	    };
	    reader.readAsDataURL(file);
	  	});
	</script>
</body>
</html>