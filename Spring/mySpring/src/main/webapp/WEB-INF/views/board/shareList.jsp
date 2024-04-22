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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shareList.css" />
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" flush="false" />

	<section class="notice">
		<p class="page-title">Sharing Info</p><p class="page-subtitle">[정보공유]</p>

		<!-- board seach area -->
		<div class="notice-button">
			<a class="medium-btn brown-btn" href="${contextPath }/board/write">글쓰기</a>
		</div>
		<div id="board-search">
			<div class="container">
				<div class="search-window">
					<form action="/board/noticeList" method="get">
						<div class="search-wrap">
							<label for="search" class="blind">공지사항 내용 검색</label> <select name="searchField">
								<option value="">카테고리</option>
								<option value="content">내용</option>
								<option value="title">제목</option>
								<option value="id">작성자</option>
							</select> <input id="search" type="search" name="searchWord"
								placeholder="검색어를 입력해주세요." value="" />
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
							<td><a href="/notice/read?bno=${bList.bno}">${bList.title}</a></td>
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
