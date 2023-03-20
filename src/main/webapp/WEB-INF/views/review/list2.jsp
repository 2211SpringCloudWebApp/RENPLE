<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기글 목록</title>
    	<link rel="stylesheet" href="../../../resources/reviewCss/list.css">
		<style>
			table {
				border : 1px solid black;
				border-collapse : collapse;
			}
			td, th {
				border : 1px solid black;
				border-collapse : collapse;
			}
		</style>
	</head>
	<body>
	<jsp:include page="../header.jsp"></jsp:include>
		<div id="container">
			<div class="mainTitle">
				<p><b>후기게시판 목록</b></p>
			</div>

			<div class="listnav">
				<div class="search-area">
					<form action="/review/search" method="get">
						<input TYPE="IMAGE" src="../../../resources/img/review/list-search-icon.png" name="Submit" value="Submit" class="searchBtn" align="absmiddle">
						<select name="searchCondition" class="searchOption">
							<option value="all">전체</option>
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="searchValue" class="searchValue" value="" placeholder="게시글 검색">
					</form>
				</div>
				<div class="sortbtn" role="group">
					<button type="button" class="btn btn-danger" onclick="location.href='/review/list'">최신순</button>
					<button type="button" class="btn btn-warning" onclick="location.href='/review/listbyold'">오래된순</button>
					<button type="button" class="btn btn-success" onclick="location.href='/review/listbyview'">조회수순</button>
					<button type="button" class="btn btn-primary" onclick="location.href='/review/listbylike'">좋아요순</button>
				</div>
			</div>
			<table class="table table-hover" id="list-tbl">
				<thead>
					<tr>
						<th>No. 〒</th>
						<th>Title ✍</th>
						<th>Writer 👨</th>
						<th>Date 📅</th>
						<th>Like ❤️</th>
						<th>View 👀</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rList }" var="review" varStatus="i">
						<tr onclick="location.href='/review/detail?reviewNo=${review.reviewNo }'" style="cursor: pointer;">
							<td class="review-number">${i.count }</td>
							<td>${review.reviewTitle }</td>
							<td>${review.userId }</td>
							<td>${review.rCreateDate }</td>
							<td>${review.reviewLikeCount }</td>
							<td>${review.viewCount }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr align="center">
						<td colspan="6">
							<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
								<c:url var="pageUrl" value="/review/list">
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								<a href="${pageUrl }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</td>				
					</tr>
				</tfoot>
			</table>
			<div class="button-area">
			<c:if test="${user eq null}">
				<button type="button" class="btn btn-primary" onclick="javascript:btn('로그인이 필요합니다.')">후기글 작성</button>
			</c:if>
			<c:if test="${user ne null}">
				<button type="button" class="btn btn-primary" onclick="location.href='/review/writeView'">후기글 작성</button>
			</c:if>
				<button type="button" class="btn btn-primary" onclick="location.href='/'">홈으로 가기</button>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</body>
	<script>
		function btn(sample) {
			alert(sample);
		}
	</script>
</html>