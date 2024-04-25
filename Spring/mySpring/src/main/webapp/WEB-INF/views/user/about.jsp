<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=d, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/about.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/root.css" />
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" flush="false" />
<div class="about-container">
		<!-- <section class="hidden">
        <img src="../images/about/about-dog.png" alt="" />
      </section> -->
		<section class="hidden">
			<img src="${images }/about/dog1.jpg" alt="" />
		</section>
		<!-- <section class="hidden">
        <span>'짖다'</span><span>'나무 껍질'</span>
      </section> -->

		<section class="hidden">
			<h1>'Bark'</h1>
		</section>
		<section class="hidden">
			<h2>유기견의 동물권을 '보호'하고 보호소들을 지원하기 위해 만들어졌습니다.</h2>
			<h2>주인에게 학대당하고 버림 받은 아이들의 '짖는' 소리를 전달해줍니다.</h2>
		</section>

		<section class="hidden">
			<p>Bark는 유기견 보호소와 유기견 입양 희망자들을 '연결'해주는 플랫폼입니다.</p>
		</section>

		<!-- <section class="hidden">
        <img src="../images/about/about-dog2.png" alt="" />
      </section> -->
		<section class="hidden">
			<img src="${images }/about/dog5.jpg" alt="" />
		</section>
		<section class="hidden">
			<p>최근 유기견 입양비, 책임비 등으로</p>
			<p>돈벌이를 하는 비즈니스들이 늘고 있다는걸 알고 계셨나요?</p>
		</section>

		<section class="hidden">
			<h2>'Bark'는 유기견을 '이용'하는 플랫폼이 아닙니다.</h2>
			<p>유기견들을 위한, 보호소를 위한 플랫폼, 'Bark'입니다.</p>
		</section>
		<!--<section class="hidden">
         <img src="../images/about/about-dog3.png" alt="" />
      </section>
      <section class="hidden"> -->
		<section class="hidden">
			<img src="${images }/about/dog3.jpg" alt="" />
		</section>
		<section>
			<h2>보호소와 예비 견주님을 이어줍니다.</h2>
			<p>'보호소 조회'를 통해 모금중인 캠페인을 확인하고 여러분의 마음을 전해보세요!</p>
			<div class="button-wrap">
				<button class="blue-btn large-btn hidden">보호소 조회</button>
				<button class="blue-btn large-btn hidden">캠페인 둘러보기</button>
				<button class="blue-btn large-btn hidden">입양하기</button>
			</div>
		</section>
		<section class="hidden">
			<p>학대당하고 버림받은 아이들의 새로운 가족이 되어 주세요.</p>
		</section>
		<section class="hidden">
			<img src="${images }/about/dog4.jpg" alt="" />
		</section>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false"></jsp:include>
	<script src="${js }/about.js"></script>
	
</body>
</html>
