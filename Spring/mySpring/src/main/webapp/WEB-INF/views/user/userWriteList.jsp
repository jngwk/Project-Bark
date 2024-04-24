<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="${css }/root.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userWriteList.css" />
</head>
<body>
	<jsp:include page="${views }/include/header.jsp" flush="false" />

	<section class="notice">
		<p class="page-title">Contact</p><p class="page-subtitle">[문의하기]</p>

		<!-- board seach area -->
		<div id="board-search">
			<div class="container">
				<div class="search-window">
					<form action="/user/userWriteList" method="get">
						<div class="search-wrap">
							<label for="search" class="blind">문의하기 내용 검색</label> <select name="searchField">
								<option value="" >카테고리</option>
								<option value="content" <c:if test="${page.cri.searchField == 'content'}">selected</c:if>>내용</option>
								<option value="title" <c:if test="${page.cri.searchField == 'title'}">selected</c:if>>제목</option>
<%-- 								<option value="id" <c:if test="${page.cri.searchField == 'id'}">selected</c:if>>작성자</option> --%>
							</select> <input id="search" type="search" name="searchWord"
								placeholder="검색어를 입력해주세요." value="${page.cri.searchWord}" />
							<button type="submit" class="btn btn-dark">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- board list area -->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-num">번호</th>
							<th scope="col" class="th-title">제목</th>
							<th scope="col" class="th-exe">등록일</th>
							<th scope="col" class="th-exe">조회수</th>
							
						</tr>
					</thead>
					<tbody>
					<c:forEach var="bList" items="${bList}" >
						<tr>
							<td>${bList.no}</td>
							<td><a href="/board/contactRead?bno=${bList.bno}&searchField=${page.cri.searchField}&searchWord=${page.cri.searchWord}&pageNum=${page.cri.pageNum}&amount=${page.cri.amount}">
							${bList.title}</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${bList.regDate}" /> </td>
							<td>${bList.hit}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>

	<!-- 페이지넘버 -->
	<jsp:include page="${views }/include/pagination.jsp" flush="false" />
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
</body>
</html>
