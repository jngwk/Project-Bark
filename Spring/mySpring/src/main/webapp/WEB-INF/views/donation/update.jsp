<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/write.css" />
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
							<p>
								<img src="${icons }/board-icon.png" />공지사항
							</p>
						</div>
						<div class="menu-shelter">
							<p>보호소 이야기</p>
						</div>
						<div class="menu-share">
							<p>정보공유</p>
						</div>
						<div class="menu-qna">
							<p>문의하기</p>
						</div>
					</div>
				</div>
			</div>
			<div class="write-container">
				<div class="write-board">
					<div class="write-title">
						<p>게시글 수정</p>
					</div>
					<div class="write-read">
						<form method="post" action="/donation/update">
							<div class="form-bg">
								<table class="write-table">
									<thead>
										<tr>
											<th>제목</th>
											<th><input type="text" name="Title" maxlength="50" value="${board.title}"/></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="textarea" colspan="3"><textarea placeholder="내용을 작성하세요."
													name="Content" maxlength="2048">${board.content}</textarea>
													<input type="hidden" name="bno" value="${board.bno}" />
													<input type="hidden" name="searchField" value="${searchField}" />
													<input type="hidden" name="searchWord" value="${searchWord}" />
													<input type="hidden" name="pageNum" value="${pageNum}" />
													<input type="hidden" name="amount" value="${amount}" />
											</td>
										</tr>
									</tbody>
								</table>
<!-- 
								<div class="write-imgUpload">
									<input class="upload-name" value="첨부파일" placeholder="첨부파일"
										readonly /> <label for="file" class="secondary-btn">파일찾기</label>
									<input type="file" id="file" />
								</div>
 -->								
							</div>
							<div class="write-button">
								<input type="button" data-ico="->" onclick="history.back()"
									value="취소" class="btn brown-btn large-btn" /> <input
									data-ico="->" type="submit" value="수정 완료"
									class="btn brown-btn large-btn" />
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
<script>
let pageNum = '<c:out value="${pageNum}"/>'; 
let amount= '<c:out value="${amount}"/>';
let searchField = '<c:out value="${searchField}"/>';
let searchWord = '<c:out value="${searchWord}"/>';

//alert (pageNum + ":" + amount + ":" + searchField + ":" + searchWord);

	
</script>
</body>
</html>
