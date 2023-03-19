<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/mainCss/table.css">
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<form action="/comment/list" method="get">
		<div id="outter">
			<h1>문의 관리</h1>
			<div id=selectBox>
				<button type="button" onclick="location.href='/comment/selectOk'">답변 YES</button>
				<button type="button" onclick="location.href='/comment/selectNotOk'">답변 NO</button>
			</div>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>제목</th>
						<th>등록일</th>
						<th>답변일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="comment" items="${commentList }" varStatus="status">
						<tr
							onclick="location.href='/comment/select?questionNo=${comment.questionNo }'"
							style="cursor: pointer;">
							<td>${pi.totalCount - (pi.currentPage-1) * pi.boardLimit - status.index}</td>
							<td>${comment.userId }</td>
							<td>${comment.questionTitle }</td>
							<td>${comment.qCreateDate }</td>
							<td>${comment.commentDate }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<!-- 페이징 -->
						<td colspan="5" align="center"><c:if
								test="${pi.currentPage != 1}">
								<a
									href="/comment/list?page=1&searchValue=${search.searchValue }&searchCondition=${search.searchCondition }"><span>
										처음 </span></a>
							</c:if> <c:if test="${pi.currentPage != 1}">
								<a
									href="/comment/list?page=${pi.currentPage - 1 }&searchValue=${search.searchValue }&searchCondition=${search.searchCondition }"><span>
										이전 </span></a>
							</c:if> <c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
								<c:url var="pageUrl" value="/comment/list">
									<c:param name="page" value="${p }"></c:param>
									<c:param name="searchValue" value="${search.searchValue }"></c:param>
									<c:param name="searchCondition"
										value="${search.searchCondition }"></c:param>
								</c:url>
								<a href="${pageUrl }"> <c:if test="${p eq pi.currentPage }">
										<span style="font-size: larger;">${p }</span>
									</c:if> <c:if test="${p ne pi.currentPage }">${p }</c:if>
								</a>
							</c:forEach> <c:if test="${pi.currentPage != pi.lastPage }">
								<a
									href="/comment/list?page=${pi.currentPage + 1 }&searchValue=${search.searchValue }&searchCondition=${search.searchCondition }"><span>
										다음 </span></a>
							</c:if> <c:if test="${pi.currentPage != pi.lastPage }">
								<a
									href="/comment/list?page=${pi.lastPage }&searchValue=${search.searchValue }&searchCondition=${search.searchCondition }"><span>
										마지막 </span></a>
							</c:if></td>
					</tr>
					<tr>
						<!-- 조건부 검색 부분 -->
						<td colspan="1"><select name="searchCondition"
							class="form-select" aria-label="Default select example">
								<option value="all"
									<c:if test="${search.searchCondition == 'all' }">
											selected</c:if>>전체
								</option>
								<option value="userId"
									<c:if test="${search.searchCondition == 'userId' }">
											selected</c:if>>아이디
								</option>
								<option value="questionTitle"
									<c:if test="${search.searchCondition == 'userName' }">
											selected</c:if>>제목
								</option>
						</select></td>
						<td colspan="3"><input type="text" name="searchValue"
							value="${search.searchValue }" placeholder="검색어를 입력하세요"
							style="width: 100%;"></td>
						<td colspan="1">
							<button type="submit" class="btn btn-primary"
								style="width: 100%;">확인</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>