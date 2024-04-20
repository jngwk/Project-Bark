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
<%
	session.setAttribute("userid", "user001");
%>
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

					<form action="#" method="post" id="reply_form">
<!-- 						<input class="reply-write" type="text" name="content"
							placeholder="댓글을 입력하세요" cols="3"/>  -->
						<textarea class="reply-write" name="content" placeholer="댓글을 입력하세요" style="width:100%;"></textarea>
						<label for="reply-buttom"> <img	src="/images/icons/write-icon.png"></label> 
					<input class="reply-button" id="reply-buttom" type="submit" />
					</form> 
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
						<p>${board.vote}</p>
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
//$(document).ready(function(){
	let bnoValue = '<c:out value="${board.bno}"/>'; //현재 게시글에 댓글추가

	let replyUL = $(".comment");
	showList(1);
	
 	// 댓글 리스트 조회
	function showList(page) {
		getList({
			board_bno : bnoValue,
			page : page || 1
		}, function(list) {
			let str="";
			if (list == null || list.length==0) {
				replyUL.html("");
				return;
			}
			list.forEach(function(item) {
				//let str2 = item.content..replace(/(?:\r\n|\r|\n)/g, '<br />');
				let str2 = item.content;
				//let str3 = str2.replace(/(?:\r\n|\r|\n)/g, '<br>');
				str += `<li >
					<div class="reply-profile">
						<span>\${item.user_id}</span><span>\${displayTime(item.regDate)}</span>
					</div>
					<div class="reply-content">
					<p><textarea  style="border: none; width:100%;" id="area\${item.commentNo}" readonly>\${item.content}</textarea></p>

					<a href='javascript:void(0);' class="font-dark" data-commentno="\${item.commentNo}" id="btn1\${item.commentNo}" onclick="btn1(this);">수정</a>
					<a href='javascript:void(0);' class="font-dark" data-commentno="\${item.commentNo}" id="btn2\${item.commentNo}" onclick="btn2(this);">삭제</a>
<!--
					<button class="font-dark" id="updateBtn\${item.commentNo}" data-commentno="\${item.commentNo}">수정</button>
					<button class="font-dark" id="removeBtn\${item.commentNo}" data-commentno="\${item.commentNo}">삭제</button>
-->
					</div>
<!--					
					<div class="reply-content" style="display:none" id="area\${item.commentNo}">
					<p><textarea  style="width:80%;">\${item.content}</textarea></p>
					<button class="font-dark" id="conformBtn\${item.commentNo}">확인</button>
					<button class="font-dark" id="cancelBtn\${item.commentNo}" >취소</button>
					</div>
-->				
					</li>
					`;
			});
			replyUL.html(str);
		});
	}
	// <a href="#" id="removeBtn" class="font-dark">수정</a> 	
	// <a href='javascript:void(0);' onclick="함수();">

	function getList(param, callback, error) {
		let board_bno = param.board_bno;
		let page = param.page || 1;
		$.getJSON("/comment/pages/" + board_bno + "/" + page + ".json",
			function(data) {
				if (callback) { callback(data);}
			
		}).fail(function(xhr, status, err) {
			if (error) { error();}
		});
	}				
	function displayTime(timeValue) {
		let today 	= new Date();
		let gap 	= today.getTime() - timeValue;
		let dateObj	= new Date(timeValue);
		if (gap < (1000*60*60*24)) {
			let hh = dateObj.getHours();
			let mi = dateObj.getMinutes();
			let ss = dateObj.getSeconds();
			return [(hh>9?'':'0')+hh, ':', (mi>9?'':'0')+mi, ':', (ss>9?'':'0')+ss].join('');
		}
		else {

			let yy = dateObj.getFullYear();
			let mm = dateObj.getMonth()+1;
			let dd = dateObj.getDate();
			return [yy,'/', (mm>9?'':'0')+mm,'/', (dd>9?'':'0')+dd].join('');
		}
	}				
					

	// 댓글 신규 등록 
	let findtag = $(".reply-board");
	let content = findtag.find("textarea[name='content']");
	let idValue ='<%=(String)session.getAttribute("userid")%>';	// 접속자 id 
	
	let registerBtn = $("#reply-buttom");
	
	registerBtn.on("click", function(e) {
		e.preventDefault();
		
		let comment={
				content: content.val(),
				user_id: idValue,
				board_bno: bnoValue
		};
		add(comment, function(result) {
			alert(result);
			content.val("");		// 입력값 clear
			showList(1);
		});
	});
	
	$("form[id=reply_form]").serialize()
	$("form#reply_form").serialize()
	$("#reply_form").serialize()
	
	//댓글 관련 함수들
	function add(comment, callback, error) { //댓글 추가 함수
		console.log("comment...");
		$.ajax({
		    type: 'post',
		    url: '/comment/new',
		    data: JSON.stringify(comment),
		    contentType: "application/json;charset=utf-8",
		    success: function (result, status, xhr) {
		        if (callback) { callback(result); }
		    },
		    error: function (xhr, status, er) {
		        if (error) { error(er); }
		    }
		}); 
	} //add
	

	function update(comment, callback, error) {
		$.ajax({
			type:'put',
			url: '/comment/' + comment.commentNo,
			data: JSON.stringify(comment),
			contentType: "application/json; charset=utf-8",
			success: function (result, status, xhr) {
			    if (callback) { callback(result); }
			},
			error: function (xhr, status, er) {
			    if (error) { error(er); }
			}
		});
	}
	
	

	function remove(rno, callback, error) {
		$.ajax({
			type:'delete',
			url: '/replies/' + rno,
			success: function (result, status, xhr) {
			    if (callback) { callback(result); }
			},
			error: function (xhr, status, er) {
			    if (error) { error(er); }
			}
		});
	}
	
	function get(rno, callback, error) {
		$.get("/replies/" + rno + ".json", function(result) {
			if (callback) { callback(result);}
		}).fail(function (xhr, status, err) {
			if (error) { error();}
		});
	}


	
//});

// 수정 -> 확인 변경 및 host 실행 처리
function btn1(obj) {

	let commentNo=$(obj).data("commentno");
	let area = "#area" + commentNo;
	let btn2 = "#btn2" + commentNo;
	
	if ("수정" ==  $(obj).text()) {
		$(obj).text("확인");
		$(btn2).text("취소");
		$(area).attr("readonly", false);
		$(area).focus();
	}
	else {
		//$(obj).text("수정");
		//$(btn2).text("삭제");
		//$(area).attr("readonly", true);
		let content = $(area).text();
		
		alert(bnoValue +content);
		 
		let comment = {commentNo:commentNo, board_no: bnoValue, content:content };
		update(comment, function(result) {
			alert(result);
			showList(1);
		}); 
	}
}

//삭제 
function btn2(obj) {
	let commentNo=$(obj).data("commentno");
	let area 	= "#area" + commentNo;
	let btn1 = "#btn1" + commentNo;
	
	if ("취소" ==  $(obj).text()) {
		$(obj).text("삭제");
		$(btn1).text("수정");
		$(area).attr("readonly", true);

	}
	else {
		//삭제 처리 ~~~ 
	}
}


</script>
</body>
</html>
