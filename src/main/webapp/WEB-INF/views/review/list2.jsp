<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<h1>후기게시판</h1>
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
					<button type="button" onclick="location.href='/review/list'">최신순</button>
					<button type="button" onclick="location.href='/review/listbyold'">오래된순</button>
					<button type="button" onclick="location.href='/review/listbyview'">조회수순</button>
					<button type="button" onclick="location.href='/review/listbylike'">좋아요순</button>
				</div>
			</div>
			<table id="list-tbl">
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
						<tr onclick="location.href='/review/detail?reviewNo=${review.reviewNo }'" id="listtr" style="cursor: pointer;">
							<td class="review-number">${i.count }</td>
							<td>${review.reviewTitle }</td>
							<td>${review.userId }</td>
							<td><fmt:formatDate value="${review.rCreateDate }" pattern="yyyy-MM-dd" /></td>
							<td>${review.reviewLikeCount }</td>
							<td>${review.viewCount }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr align="center">
						<!-- 페이징 영역 -->
						<td colspan="6" align="center">
							<c:if test="${pi.currentPage != 1}">
								<a class="page" href="/review/list?page=1"><span> 처음 </span></a>
							</c:if>
							<c:if test="${pi.currentPage != 1}">
								<a class="page" href="/review/list?page=${pi.currentPage - 1 }"><span> 이전 </span></a>
							</c:if>
							<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
								<c:url var="pageUrl" value="/review/list">
									<c:param name="page" value="${p}" />
								</c:url>
								<a class="page" href="${pageUrl }">
									<c:if test="${p eq pi.currentPage }">
										<span style="font-size: larger;">${p }</span>
									</c:if>
									<c:if test="${p ne pi.currentPage }">
										${p }
									</c:if>
								</a>
							</c:forEach>
							<c:if test="${pi.currentPage != pi.maxPage }">
								<a class="page" href="/review/list?page=${pi.currentPage + 1 }">
									<span> 다음 </span>
								</a>
							</c:if>
							<c:if test="${pi.currentPage != pi.maxPage }">
								<a class="page" href="/review/list?page=${pi.maxPage }">
									<span> 마지막 </span>
								</a>
							</c:if>
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