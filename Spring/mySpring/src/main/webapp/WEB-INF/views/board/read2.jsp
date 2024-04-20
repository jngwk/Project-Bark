<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="${css }/read.css" />
<link rel="stylesheet" href="${css }/root.css" />
</head>
<body>
	<jsp:include page="${views }/include/header.jsp" flush="false" />

	<div class="board-read">
		<div class="category-container">
			<div class="read-category">
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
		<div class="read-container">
			<div class="read-board">
				<div class="read-top">
					<div class="read-title">
						<p>${board.title}</p>
					</div>
				</div>
				<div class="read-board">
					<p>${board.content}</p>
				</div>
			</div>
			<div class="read-button">
				<div class="story-button">
					<a class="large-btn brown-btn" href="history.back()">목록</a>
				</div>
				<div class="story-button">
					<a class="large-btn brown-btn" href="#">추천</a>
				</div>
			</div>
			<div class="reply-container">
				<div class="reply-board">
<!-- restController 처리 : start css 수정 필요  form > div
					<form action="#" method="post">
						<input class="reply-write" type="text" name="reply"
							placeholder="댓글을 입력하세요" /> <label
							for="reply-buttom"> <img
							src="/images/icons/write-icon.png">
						</label> <input class="reply-button" id="reply-buttom" type="submit" />
					</form> 
-->
					<div>
					<input class="reply-write" type="text" name="reply"
							placeholder="댓글을 입력하세요" /> 
					<input class="reply-button" id="reply-buttom" type="submit" > 
						<label for="reply-buttom"> <img	src="/images/icons/write-icon.png"></label> 
					</input>
					</div>
<!-- end : css 수정 필요  form > div  -->
					<div class="reply-list">
						<ul class="comment">
							<li>
								<div class="reply-profile">
									<span>김지현</span><span>2024-04-13</span>
								</div>
								<div class="reply-content">
									<p>정욱님 프론트 언제쯤 되세요</p>
									<a href="#" id="removeBtn" class="font-dark">수정</a> <a href="#"
										id="update" class="font-dark">삭제</a>
								</div>
							</li>
							<li>
								<div class="reply-profile">
									<span>김지현</span><span>2024-04-13</span>
								</div>
								<div class="reply-content">
									<p>정욱님 프론트 언제쯤 되세요정욱님 프론트 언제쯤 되세요정욱님 프론트 언제쯤 되세요정욱님 프론트 언제쯤
										되세요정욱님 프론트 언제쯤 되세요정욱님 프론트 언제쯤 되세요정욱님 프론트 언제쯤 되세요정욱님 프론트 언제쯤
										되세요정욱님 프론트 언제쯤 되세요정욱님 프론트 언제쯤 되세요정욱님 프론트 언제쯤 되세요</p>
									<a href="#" id="removeBtn" class="font-dark">수정</a> <a href="#"
										id="update" class="font-dark">삭제</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="category-container">
			<div class="readinfo-category">
				<div class="read-right">
					<div class="read-info">
						<p>작성자</p>
						<p>${user.name}</p>
					</div>
					<div class="read-info">
						<p>조회수</p>
						<p>${board.hit}</p>
					</div>
					<div class="read-info">
						<p>추천수</p>
						<p>${board.likea}</p>
					</div>
					<div class="read-info">
						<p>작성일</p>
						<p><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regDate}" /></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
<script>
$(document).ready(function(){
	let bnoValue = '<c:out value="${board.bno}"/>'; //현재 게시글에 댓글추가
	let idValue = '<c:out value="${board.id}"/>'; //현재 게시글에 댓글추가
	
	let findtag = $(".reply-board");
	let content = findtag.find("input[name='reply']");

	let commentBtn = $("#reply-buttom");

	
	let replyUL = $(".reply");
	showList(1);
 	
	function showList(page) {
		getList({
			bno : bnoValue,
			page : page || 1
		}, function(list) {
			let str="";
			if (list == null || list.length==0) {
				replyUL.html("");
				return;
			}
			list.forEach(function(item) {
				str += `<li data-commentNo="\${item.commentNo}">
					<div class="reply-profile">
						<span>\${item.name}</span><span><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="\${comment.regDate} />"</span>
					<div class="reply-content">
					<p>\${comment.content}</p>
					<a href="#" id="removeBtn" class="font-dark">수정</a> <a href="#"
						id="update" class="font-dark">삭제</a>
					</li>
					`;
			});
			replyUL.html(str);
		});
	}
	
	commentBtn.on("click", function(e) {
	let comment={
			comment: content.val(),
			id: idValue,
			bno: bnoValue
	};
	add(reply, function(result) {
		alert(result);
		modal.find("input").val("");
		modal.modal("hide");
		showList(1);
	});
});
</script>
</body>
</html>
