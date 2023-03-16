<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 작성</title>
<link rel="stylesheet" href="../../../resources/questionCss/write.css">
<style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="outter">
		<h1>문의사항 작성</h1>
		<div id="inner">
			<form action="/question/insert" method="post"
				enctype="multipart/form-data">
				<input type="hidden" value="${sessionScope.user}" name="userId">
				제목 : <input type="text" name="questionTitle"> <br> 
				내용 : <textarea rows="" col="" name="questionContent"></textarea><br> 
				첨부파일 : <input type="file" name="uploadFile" id="fileImage"><br>
				<div id="Container" contentEditable="false"></div>
				<div class="content-btn">
					<input type="submit" value="작성완료"> <input type="reset"
						value="취소">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
  // input 요소 가져오기
  const input = document.getElementById('fileImage');
  // input 요소에 onchange 이벤트 추가
  input.addEventListener('change', () => {
    // 선택한 파일 가져오기
    const file = input.files[0];
    // FileReader 객체 생성
    const reader = new FileReader();
    // 파일을 읽어와서 이미지로 변환 후 Container에 삽입
    reader.onload = () => {
      // 이전 이미지 요소 가져오기
      const prevImg = document.getElementById('Container').querySelector('img');
      if (prevImg) {
        // 이전 이미지 요소가 있으면 삭제
        prevImg.remove();
      }
      // 새로운 이미지 요소 생성
      const img = new Image();
      img.src = reader.result;
      document.getElementById('Container').appendChild(img);
    };
    reader.readAsDataURL(file);
  });
</script>
</body>
</html>