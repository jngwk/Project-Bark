<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/donationInfo.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/root.css" />

</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp"
		flush="false" />
	
	<div class="adoptionInfo-total">
		<section class="adoptionInfo">
		<p class="page-title">Donation Info</p>
		<p class="page-subtitle">[후원안내]</p>
	</section>
	<div class="adoptionInfo-container">
		<div class="adoptionInfo-content">
			<div class="adoptionInfo-background">
				<div class="adoptionInfo-title">후원 방법</div>
			</div>
			<div class="adoptionInfo-list">
				<ul>
					<li>1. 후원하기 메뉴 선택 후 원하는 보호소 검색.</li>
					<li>2. 보호소 조회에서 보호소 검색 후 후원하기 클릭.</li>
					<li>3. 신청서에 개인정보 작성 후 후원.</li>
					<li>4. 결제 후 일주일안에 Bark에서 보호소로 처리.</li>
					<li>5. 개별 후원금 처리상태는 마이페이지에서 확인</li>
					<br>
					<br>
					<li>*계좌이체 제외 신용카드,간편결제 모두 가능합니다.</li>
				</ul>
			</div>
		</div>
		<div class="adoptionInfo-image">
			<img class="donationInfo-dog" src="${images }/dogs/donationInfo1.jpg" />
		</div>
	</div>
	<div class="adoptionInfo-container">
		<div class="adoptionInfo-image">
			<img class="donationInfo-dog" src="${images }/dogs/donationInfo2.jpg" />
		</div>
		<div class="adoptionInfo-content">
			<div class="adoptionInfo-background">
				<div class="adoptionInfo-title">후원한 돈은 어떻게 쓰이나요?</div>
			</div>
			<div class="adoptionInfo-list">
				<ul>
					<li>저희는 후원을 희망하는 후원자 여러분과</li>
					<li>도움을 필요로 하는 보호소들의</li>
					<li>연결 다리 역할을 해주고있습니다.</li>
					<li>자세한 후원금 사용처는 해당 보호소에 문의 부탁드립니다.</li>
					<li>소액도 보호소와 유기견들에게 많은 힘이됩니다.</li>
					<br/>
					
				</ul>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
</body>
</html>