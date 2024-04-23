<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/adoptionInfo.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/root.css" />

</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp"
		flush="false" />
	
	<div class="adoptionInfo-total">
		<section class="adoptionInfo">
		<p class="page-title">Adoption Info</p>
		<p class="page-subtitle">[입양안내]</p>
	</section>
	<div class="adoptionInfo-container">
		<div class="adoptionInfo-content">
			<div class="adoptionInfo-background">
				<div class="adoptionInfo-title">입양자 준수사항</div>
			</div>
			<div class="adoptionInfo-list">
				<ul>
					<li>적합한 사료의 급여와 급수, 적당한 운동, 휴식 및 수면이 보장되도록 한다.</li>
					<li>질병에 걸리거나 부상을 입은 경우 신속한 치료 등 필요한 조치를 한다.</li>
					<li>합리적 이유 없이 고통을 주거나 상해를 입히지 않는다.</li>
					<li>입양한 동물을 상업적(식용, 번식, 판매 등)으로 이용하지 않는다.</li>
					<li>입양한 동물로 인해 발생하는 모든 사고에 대해 민형사상 책임을 진다.</li>
					<li>입양한 동물을 유기하거나 파양하지 않는다.</li>
					<li>2개월 이상인 개는 내장형 방식으로 등록한다.</li>
					<li>입양 후 지자체(동물보호센터) 사후관리에 협조한다.</li>
					<li>입양한 동물의 복지를 위해 중성화 수술을 실시한다.</li>
				</ul>
			</div>
		</div>
		<div class="adoptionInfo-image">
			<img class="donationInfo-dog" src="${images }/dogs/adoptionInfo1.jpg" />
		</div>
	</div>
	<div class="adoptionInfo-container">
		<div class="adoptionInfo-image">
			<img class="donationInfo-dog" src="${images }/dogs/adoptionInfo1.jpg" />
		</div>
		<div class="adoptionInfo-content">
			<div class="adoptionInfo-background">
				<div class="adoptionInfo-title">입양방법</div>
			</div>
			<div class="adoptionInfo-list">
				<ul>
					<li>적합한 사료의 급여와 급수, 적당한 운동, 휴식 및 수면이 보장되도록 한다.</li>
					<li>질병에 걸리거나 부상을 입은 경우 신속한 치료 등 필요한 조치를 한다.</li>
					<li>합리적 이유 없이 고통을 주거나 상해를 입히지 않는다.</li>
					<li>입양한 동물을 상업적(식용, 번식, 판매 등)으로 이용하지 않는다.</li>
					<li>입양한 동물로 인해 발생하는 모든 사고에 대해 민형사상 책임을 진다.</li>
					<li>입양한 동물을 유기하거나 파양하지 않는다.</li>
					<li>2개월 이상인 개는 내장형 방식으로 등록한다.</li>
					<li>입양 후 지자체(동물보호센터) 사후관리에 협조한다.</li>
					<li>입양한 동물의 복지를 위해 중성화 수술을 실시한다.</li>
				</ul>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
</body>
</html>