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
<script src="//code.jquery.com/jquery-3.7.1.min.js"></script>
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
					
						<label for="reply-buttom"><input class="reply-button" id="reply-buttom" type="submit" > <img src="/images/icons/write-icon.png"></label> 
					</div>
<!-- end : css 수정 필요  form > div  -->
					<div class="reply-list">
						<ul class="comment">

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
	//let idValue = '<c:out value="${board.id}"/>'; //헌재 접속자 id 
	
	let findtag = $(".reply-board");
	let content = findtag.find("input[name='reply']");

	let commentBtn = $("#reply-buttom");

	
	let replyUL = $(".comment");
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
						<span>\${item.name}</span><span>\${displayTime(item.regDate)}</span>
					</div>
					<div class="reply-content">
					<p>\${item.content}</p>
					<a href="#" id="removeBtn" class="font-dark">수정</a> <a href="#"
						id="update" class="font-dark">삭제</a>
					</div>
					</li>
					`;
			});
			replyUL.html(str);
		});
	}
					
	function displayTime(timeValue) {
		//alert(timeValue);
		let today 	= new Date();
		let gap 	= today.getTime() - timeValue;
		let dateObj	= new Date(timeValue);
		if (gap < (1000*60*60*24)) {


			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();
			alert("aaa" + hh + mi + ss);			
			return [(hh>9?'':'0')+hh, ':', (mi>9?'':'0')+mi, ':', (ss>9?'':'0')+ss].join('');
			// return [ (hh>9?'':'0')+hh, ':', (mi>9?'':'0')+mi, ':', (ss>9?'':'0')+ss].join('');
		}
		else {

			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth()+1;
			let dd = dateObj.getDate();
			return [yy,'/', (mm>9?'':'0')+mm,'/', (dd>9?'':'0')+dd].join('');
			// return [yy,'/', (mm>9?'':'0')+mm,'/', (dd>9?'':'0')+dd].join('');
		}
	}				
					
					
	function getList(param, callback, error) {
		let bno = param.bno;
		let page = param.page || 1;
		$.getJSON("/comment/pages/" + bno + "/" + page + ".json",
			function(data) {
				if (callback) { callback(data);}
			
		}).fail(function(xhr, status, err) {
			if (error) { error();}
		});
	}

});
</script>
</body>
</html>
