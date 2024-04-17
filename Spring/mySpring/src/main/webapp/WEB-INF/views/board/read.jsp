<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<p>제목입니다.</p>
					</div>
				</div>
				<div class="read-board">
					<p>대통령으로 선거될 수 있는 자는 국회의원의 피선거권이 있고 선거일 현재 40세에 달하여야 한다. 국가는
						주택개발정책등을 통하여 모든 국민이 쾌적한 주거생활을 할 수 있도록 노력하여야 한다. 대통령은 국가의 원수이며, 외국에
						대하여 국가를 대표한다. 모든 국민은 언론·출판의 자유와 집회·결사의 자유를 가진다. 헌법재판소는 법관의 자격을 가진
						9인의 재판관으로 구성하며, 재판관은 대통령이 임명한다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된
						국회의원으로 구성한다. 법률이 헌법에 위반되는 여부가 재판의 전제가 된 경우에는 법원은 헌법재판소에 제청하여 그 심판에
						의하여 재판한다. 국가는 평생교육을 진흥하여야 한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는
						3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다. 대통령으로 선거될 수 있는 자는
						국회의원의 피선거권이 있고 선거일 현재 40세에 달하여야 한다. 국가는 주택개발정책등을 통하여 모든 국민이 쾌적한
						주거생활을 할 수 있도록 노력하여야 한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 모든 국민은
						언론·출판의 자유와 집회·결사의 자유를 가진다. 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며, 재판관은
						대통령이 임명한다. 국회는 국민의 보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 법률이 헌법에
						위반되는 여부가 재판의 전제가 된 경우에는 법원은 헌법재판소에 제청하여 그 심판에 의하여 재판한다. 국가는 평생교육을
						진흥하여야 한다. 중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의
						위원으로 구성한다. 위원장은 위원중에서 호선한다. 대통령으로 선거될 수 있는 자는 국회의원의 피선거권이 있고 선거일
						현재 40세에 달하여야 한다. 국가는 주택개발정책등을 통하여 모든 국민이 쾌적한 주거생활을 할 수 있도록 노력하여야
						한다. 대통령은 국가의 원수이며, 외국에 대하여 국가를 대표한다. 모든 국민은 언론·출판의 자유와 집회·결사의 자유를
						가진다. 헌법재판소는 법관의 자격을 가진 9인의 재판관으로 구성하며, 재판관은 대통령이 임명한다. 국회는 국민의
						보통·평등·직접·비밀선거에 의하여 선출된 국회의원으로 구성한다. 법률이 헌법에 위반되는 여부가 재판의 전제가 된
						경우에는 법원은 헌법재판소에 제청하여 그 심판에 의하여 재판한다. 국가는 평생교육을 진흥하여야 한다.
						중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다.
						위원장은 위원중에서 호선한다.</p>
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
					<form action="#" method="post">
						<input class="reply-write" type="text" name="reply"
							placeholder="댓글을 입력하세요" /> <label
							for="reply-buttom"> <img
							src="/images/icons/write-icon.png">
						</label> <input class="reply-button" id="reply-buttom" type="submit" />
					</form>
					<div class="reply-list">
						<ul>
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
						<p>지현</p>
					</div>
					<div class="read-info">
						<p>조회수</p>
						<p>8</p>
					</div>
					<div class="read-info">
						<p>추천수</p>
						<p>15</p>
					</div>
					<div class="read-info">
						<p>작성일</p>
						<p>2024-04-13 12:22:22</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
</body>
</html>
