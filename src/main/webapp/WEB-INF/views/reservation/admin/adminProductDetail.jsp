<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>관리자 - 상품 상세 조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>

<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<div id="outter">
		<h1 style="margin-top: 100px; text-align: center;">상품 상세 조회</h1>
		<form action="/reservation/admin/adminProductModify" method="POST">
			<table class="table table-hover" style="margin-top: 100px;">
				<tr>
					<td>번호</td>
					<td><input type="text" name="productNo"
						value="${product.productNo }" readonly="readonly"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="productName"
						value="${product.productName }"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="productPrice"
						value="${product.productPrice }"></td>
				</tr>
				<tr>
					<td>설명</td>
					<td><input type="text" name="productDescription"
						value="${product.productDescription }"></td>
				</tr>
				<tr>
					<td>크기</td>
					<td><input type="text" name="productSize"
						value="${product.productSize }"></td>
				</tr>
				<tr>
					<td>최대인원</td>
					<td><input type="text" name="productUserMax"
						value="${product.productUserMax }"></td>
				</tr>
				<tr>
					<td>최소인원</td>
					<td><input type="text" name="productUserMin"
						value="${product.productUserMin }"></td>
				</tr>
				<tr>
					<td>등록일</td>
					<td><input type="text" name="pCreateDate"
						value="${product.pCreateDate }" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="8"><input type="submit" value="수정"> <input
						type="button" value="삭제"
						onclick="removeCheck(${product.productNo})"> <input
						type="reset" value="초기화"> <input type="button" value="리스트"
						onclick="location.href='/reservation/admin/adminProductList'">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script type="text/javascript">
    	function removeCheck(productNo){
    		if(confirm("삭제하시겠습니까?")){
    			location.href="/reservation/admin/adminProductRemove?productNo="+productNo;
    		} 
    	}
    </script>

	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>