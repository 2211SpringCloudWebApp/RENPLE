<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 수정</title>
<link rel="stylesheet" href="../../../resources/questionCss/modify.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="outter">
		<h1>문의사항 수정</h1>
		<form action="/question/update" method="post" enctype="multipart/form-data">
				<div id="inner">
					<input type="hidden" name="questionNo" value="${qna.questionNo }">
					<input type="hidden" name=questionFilename value="${qna.questionFilename }">
					<div id="content1">
						제목 : <input type="text" name="questionTitle" value="${qna.questionTitle }"><br>
					</div>
					<div id="content2">
						내용 : <textarea name="questionContent" rows="10">${qna.questionContent }</textarea>
					</div>
					<div id="content3">
						아이디 : <input type="text" name="userId" value="${qna.userId}" readonly> <br>
					</div>
					<div id="content4">
						<c:if test="${qna.questionFilename eq null }">
		   					 첨부파일 : <input type="file" name="reloadFile" id="fileImage" value="${qna.questionFilename }">
						</c:if>
						<c:if test="${qna.questionFilename ne null }">
							첨부파일 : <a href="/question?questionNo=${qna.questionNo }">${qna.questionFilename }</a>
							<button>
								<a href="javascript:void(0);" onclick="removeCheckImg('${qna.questionFilename}', ${qna.questionNo});">파일삭제</a>
							</button>
							<br>
							<img class="img" src="../../../resources/uploadFiles/${question.questionFilename }" alt="공지 이미지">
						</c:if>
					</div>
					<div id="Container"></div>
					</div>
					<div class="content-btn">
						<input type="submit" value="수정하기">
					</div>
			</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
			function removeCheckImg(questionFilename, questionNo) {
				if(confirm("정말 삭제하시겠습니까?")) {
				location.href="/question/deleteFile?questionFilename="+questionFilename+"&questionNo="+questionNo;
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