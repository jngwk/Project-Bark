<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="${css }/root.css" />
<link rel="stylesheet" href="${css }/noticeList.css" />
</head>
<body>
	<jsp:include page="${views }/include/header.jsp" flush="false" />

	<section class="notice">
		<p class="page-title">Notice</p>

		<!-- board seach area -->
		<div class="notice-button">
			<a class="medium-btn brown-btn" href="#">글쓰기</a>
		</div>
		<div id="board-search">
			<div class="container">
				<div class="search-window">
					<form action="#" method="post">
						<div class="search-wrap">
							<label for="search" class="blind">공지사항 내용 검색</label> <select>
								<option>카테고리</option>
								<option>내용</option>
								<option>제목</option>
								<option>작성자</option>
							</select> <input id="search" type="search" name=""
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
						<tr>
							<td>3</td>
							<th><a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a></th>
							<td>2017.07.13</td>
							<td>84</td>
						</tr>

						<tr>
							<td>2</td>
							<th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
							<td>2017.06.15</td>
							<td>84</td>
						</tr>

						<tr>
							<td>1</td>
							<th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
							<td>2017.06.15</td>
							<td>84</td>
						</tr>
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
