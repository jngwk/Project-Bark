<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보호소 조회</title>
<link rel="stylesheet" href="${css }/shelterMap.css" />
<link rel="stylesheet" href="${css }/root.css" />
</head>
<body>
	<jsp:include page="${views }/include/header.jsp" flush="false"></jsp:include>

	<div class="map-container">

		<div class="shelter-side">
			<div class="shelter-tab">
				<ul class="tab">
					<li><a class="shelter-name">보호소 이름</a></li>
					<li><a class="shelter-area">보호소 위치</a></li>
				</ul>
			</div>
			<div class="shelter-search">
				<div class="name-search">
					<form>
						<input class="search" type="search" placeholder="보호소 이름 검색"> 
						<input class="submit" type="submit" value="검색">
					</form>
				</div>
				<div class="area-search">
					<form>
						<select class="main-city">
							<option>지역</option>
							<option value="seoul">서울</option>
							<option value="gyeonggi">경기도</option>
						</select> <select class="sub-city" id="sub-city">
							<option>시/군/구</option>
						</select> <input class="submit" type="submit" value="검색">
					</form>
				</div>
			</div>
			<div class="list-container">
				<div class="shelter-list">
					<ul class="shelter-ul">
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
						<li>
							<div class="shelter-detail">
								<p>1조보호소</p>
								<span>서울시 강남구</span>
							</div>
							<div class="shelter-buttons">
								<div class="detail-box">
									<a href="#" class="donate green-btn large-btn">후원하기</a> <a
										href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
									<a href="#" class="campaign green-btn large-btn">캠페인 둘러보기</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="map">
			<div class="shelter-map">
				<div class="api-image">
					<img class="api" src="${images }/map.jpg">
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false"></jsp:include>
	<script src="${js }/shelterMap.js"></script>
</body>
</html>