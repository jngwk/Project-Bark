<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>후원하기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/formCompelete.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/root.css" />
</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp"
		flush="false"></jsp:include>
	<div class="donate-container">
		<div class="donate-page slide-animation">
			<div class="paymentForm">
				<img src="${images }/logo-brown.png" />
				<div class="donate-title">후원해주셔서 감사합니다</div>
				<div class="shelter-info">
					<div class="donate-subtitle">
						<div>회원님의 후원금은 강아지들과 더붙어사는 더 좋은 세상을 만드는데 사용됩니다.</div>
					</div>


							<div class="donate-button">
								<input class="large-btn green-btn" type="button"
									onclick="location.href='${contextPath }/donation/map'"
									value="목록"> <input
									onclick="location.href='${contextPath }/user/userDonationList'"
									class="large-btn green-btn" type="button" value="기부내역">
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="${views }/include/footer.jsp" flush="false"></jsp:include>
			<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</body>
</html>
