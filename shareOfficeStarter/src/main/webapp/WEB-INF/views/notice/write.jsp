<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link rel="stylesheet" href="../../resources/noticeCss/write.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="outter">
		<h1>공지사항 작성</h1>
		<div id="inner">
			<form action="/notice/write" method="post" enctype="multipart/form-data">
				제목 : <input type="text" name="noticeTitle"><br> 
				내용 : <textarea name="noticeContent" rows="5" cols="30"></textarea><br>
				첨부파일 : <input type="file" name="uploadFile" id="fileImage"><br>
				<div id="Container" contentEditable="false"></div>
				<div class="content-btn">
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
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