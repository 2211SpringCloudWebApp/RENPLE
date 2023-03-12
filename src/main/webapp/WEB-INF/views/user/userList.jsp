<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>이용자 조회</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<style>
	a:after, a:link {
		text-decoration-line: none;
	}
</style>

<body>
	<h1>이용자 조회</h1>
	<div id="tableBox">
		<table class="table table-hover table-condensed">
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>휴대번호</th>
				</tr>
			</thead>
			<!-- 조건 필터링 하지 않은 경우 -->
			<form action="/user/selectSearchAll" method="get">
				<%-- <c:if test="${search eq null }">
					<tbody>
						<c:forEach var="user" items="${list }" varStatus="status">
							<tr>
								<td>${pi.totalCount - (pi.currentPage-1) * pi.boardLimit - status.index}</td>
								<td><a href="/user/select?userId=${user.userId }">${user.userId }</a></td>
								<td>${user.userName }</td>
								<td>${user.userPhone }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<!-- 페이징 -->
							<td colspan="4" align="center">
								<c:if test="${pi.currentPage != 1}">
									<a href="/user/selectAll?page=1"><span> 처음 </span></a>
								</c:if> 
								<c:if test="${pi.currentPage != 1}">
									<a href="/user/selectAll?page=${pi.currentPage - 1 }"><span> 이전 </span></a>
								</c:if>
								 
								<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
									<c:url var="pageUrl" value="/user/selectAll">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<a href="${pageUrl }"> 
										<c:if test="${p eq pi.currentPage }">
											<span style="font-size: larger;">${p }</span>
										</c:if> 
										<c:if test="${p ne pi.currentPage }">${p }</c:if>
									</a>
								</c:forEach> 
								
								<c:if test="${pi.currentPage != pi.lastPage }">
									<a href="/user/selectAll?page=${pi.currentPage + 1 }"><span> 다음 </span></a>
								</c:if> 
								<c:if test="${pi.currentPage != pi.lastPage }">
									<a href="/user/selectAll?page=${pi.lastPage }"><span> 마지막 </span></a>
								</c:if>
							</td>
						</tr>
						<tr>
							<!-- 조건부 검색 부분 -->
							<td colspan="1">
								<select name="searchCondition" class="form-select" aria-label="Default select example">
									<option value="all">전체</option>
									<option value="userId">아이디</option>
									<option value="userName">이름</option>
									<option value="userPhone">휴대번호</option>
								</select>
							</td>
							<td colspan="2">
								<input type="text" name="searchValue" placeholder="검색어를 입력하세요" style="width: 100%;">
							</td>
							<td colspan="1">
								<button type="submit" class="btn btn-primary" style="width: 100%;">확인</button>
							</td>
						</tr>
					</tfoot>
				</c:if> --%>

				<!-- 조건 필터링을 한 경우 -->
				<c:if test="${search ne null }">
					<tbody>
						<c:forEach var="user" items="${list }" varStatus="status">
							<tr>
								<td>${pi.totalCount - (pi.currentPage-1) * pi.boardLimit - status.index}</td>
								<td><a href="/user/select?userId=${user.userId }">${user.userId }</a></td>
								<td>${user.userName }</td>
								<td>${user.userPhone }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<!-- 페이징 -->
							<td colspan="4" align="center">
								<c:if test="${pi.currentPage != 1}">
									<a href="/user/selectSearchAll?page=1&searchValue=${search.searchValue }&searchCondition=${search.searchCondition }"><span> 처음 </span></a>
								</c:if> 
								<c:if test="${pi.currentPage != 1}">
									<a href="/user/selectSearchAll?page=${pi.currentPage - 1 }&searchValue=${search.searchValue }&searchCondition=${search.searchCondition }"><span> 이전 </span></a>
								</c:if>
								 
								<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
									<c:url var="pageUrl" value="/user/selectSearchAll">
										<c:param name="page" value="${p }"></c:param>
										<c:param name="searchValue" value="${search.searchValue }"></c:param>
										<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									</c:url>
									<a href="${pageUrl }"> 
										<c:if test="${p eq pi.currentPage }">
											<span style="font-size: larger;">${p }</span>
										</c:if> 
										<c:if test="${p ne pi.currentPage }">${p }</c:if>
									</a>
								</c:forEach> 
								
								<c:if test="${pi.currentPage != pi.lastPage }">
									<a href="/user/selectSearchAll?page=${pi.currentPage + 1 }&searchValue=${search.searchValue }&searchCondition=${search.searchCondition }"><span> 다음 </span></a>
								</c:if> 
								<c:if test="${pi.currentPage != pi.lastPage }">
									<a href="/user/selectSearchAll?page=${pi.lastPage }&searchValue=${search.searchValue }&searchCondition=${search.searchCondition }"><span> 마지막 </span></a>
								</c:if>
							</td>
						</tr>
						<tr>
							<!-- 조건부 검색 부분 -->
							<td colspan="1">
								<select name="searchCondition" class="form-select" aria-label="Default select example">
									<option value="all" 
										<c:if test="${search.searchCondition == 'all' }">
										selected</c:if>>전체
									</option>
									<option value="userId" 
										<c:if test="${search.searchCondition == 'userId' }">
										selected</c:if>>아이디
									</option>
									<option value="userName" 
										<c:if test="${search.searchCondition == 'userName' }">
										selected</c:if>>이름
									</option>
									<option value="userPhone" 
										<c:if test="${search.searchCondition == 'userPhone' }">
										selected</c:if>>휴대번호
									</option>
								</select>
							</td>
							<td colspan="2">
								<input type="text" name="searchValue" value="${search.searchValue }" 
								placeholder="검색어를 입력하세요" style="width: 100%;">
							</td>
							<td colspan="1">
								<button type="submit" class="btn btn-primary" style="width: 100%;">확인</button>
							</td>
						</tr>
					</tfoot>
				</c:if>
			</form>
		</table>
	</div>
</body>

</html>