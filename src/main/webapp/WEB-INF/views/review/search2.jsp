<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색 결과</title>
    	<link rel="stylesheet" href="../../../resources/reviewCss/list.css">
    	<link rel="icon" href="data:,">
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
				<h1>게시글 검색 결과</h1>
			</div>
			<div class="search-area">
				<form action="/review/search" method="get">
					<input TYPE="IMAGE" src="../../../resources/img/review/question-mark.png" name="Submit" value="Submit" class="searchBtn" align="absmiddle">
					<select name="searchCondition" class="searchOption">
						<option value="all">전체</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchValue" class="searchValue" value="" placeholder="게시글 검색" style="color: ghostwhite;">
				</form>
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
					<c:forEach items="${sList }" var="review" varStatus="i">
						<tr>
							<td class="review-number">${i.count }</td>
							<td><a href="/review/detail?reviewNo=${review.reviewNo }">${review.reviewTitle }</a></td>
							<td>${review.userId }</td>
							<td>${review.rCreateDate }</td>
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
								<a href="/review/list?page=1&searchValue=${search.searchValue }&searchCondition=${search.searchCondition }"><span> 처음 </span></a>
							</c:if>
							<c:if test="${pi.currentPage != 1}">
								<a href="/review/list?page=${pi.currentPage - 1 }&searchValue=${search.searchValue}&searchCondition=${search.searchCondition}"><span> 이전 </span></a>
							</c:if>
							<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
								<c:url var="pageUrl" value="/review/list">
									<c:param name="page" value="${p}" />
									<c:param name="searchValue" value="${search.searchValue }" />
									<c:param name="searchCondition" value="${search.searchCondition }" />
								</c:url>
								<a href="${pageUrl }">
									<c:if test="${p eq pi.currentPage }">
										<span style="font-size: larger;">${p }</span>
									</c:if>
									<c:if test="${p ne pi.currentPage }">
										${p }
									</c:if>
								</a>
							</c:forEach>
							<c:if test="${pi.currentPage != pi.maxPage }">
								<a href="/review/list?page=${pi.currentPage + 1 }&searchValue=${search.searchValue }&searchCondition=${search.searchCondition }">
									<span> 다음 </span>
								</a>
							</c:if>
							<c:if test="${pi.currentPage != pi.maxPage }">
								<a href="/review/list?page=${pi.maxPage }&searchValue=${search.searchValue}&searchCondition=${search.searchCondition}">
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
</html>