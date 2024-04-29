<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contactWrite.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
<script src="${pageContext.request.contextPath}/resources/js/write.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" flush="false" />
	<div class="board-write">
		<div class="board-write-inner">
			<div class="category-container">
				<div class="write-category">
					<div class="category-title">
						<p>게시판</p>
					</div>
					<div class="category-menu">
						<div class="menu-notice">
							<p>공지사항</p>
						</div>
						<div class="menu-shelter">
							<p>보호소 이야기</p>
						</div>
						<div class="menu-share">
							<a href="${contextPath }/board/shareWrite"><p>정보공유</p></a>
						</div>
						<div class="menu-qna">
							<p><img src="${icons }/board-icon.png" />문의하기</p>
						</div>
					</div>
				</div>
			</div>
			<div class="write-container">
				<div class="write-board">
					<div class="write-title">
						<p>문의 하기</p>
					</div>
					<div class="write-read">
						<form method="post" action="/board/contactWrite">
							<div class="form-bg">
								<table class="write-table">
									<thead>
										<tr>
											<th>제목</th>
											<th><input type="text" name="Title" maxlength="50" /></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="textarea" colspan="3"><textarea placeholder="내용을 작성하세요."
													name="Content" maxlength="2048"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="write-imgUpload">
									<input class="upload-name" value="첨부파일" placeholder="첨부파일"
										readonly /> <label for="file" class="secondary-btn">파일찾기</label>
									<input type="file" id="file" />
								</div>
							</div>
							<div class="write-button">
								<input type="button" data-ico="->" onclick="history.back()"
									value="취소" class="btn brown-btn large-btn" /> <input
									data-ico="->" type="submit" value="작성 완료"
									class="btn brown-btn large-btn" />
									<input type="hidden" name="id" value="<%=(String) session.getAttribute("userId")%>" />
<!-- 									<input type="hidden" name="user_id" value="jihyeon2368" /> -->
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
</body>
</html>
