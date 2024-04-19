<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>후원하기</title>
<link rel="stylesheet" href="${css }/donationForm.css" />
<link rel="stylesheet" href="${css }/root.css" />
<link rel="stylesheet" href="${css }/transition.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<jsp:include page="${views }/include/header.jsp" flush="false"></jsp:include>
	<div class="donate-container">
		<div class="donate-page slide-animation">
			<form action="" method="post">
				<img src="${images }/logo-brown.png" />
				<div class="donate-title">강아지들에게 힘이 되어 주세요</div>
				<div class="shelter-info">
					<div class="donate-subtitle">보호소 정보</div>
					<table class="donate-table">
						<tr>
							<th>보호소명</th>
							<td><input type="text" name="shelterName" value="2조보호소"
								readonly /></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="shelterNumber"
								value="02-0000-0000" readonly /></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="shelterAddr" value="서울특별시 강남구"
								readonly /></td>
						</tr>
					</table>
				</div>



				<div class="user-info">
					<div class="donate-subtitle">기본 정보</div>
					<table class="donate-table">
						<tr>
							<th>이름</th>
							<td><input type="text" name="userName" value="김지현" readonly /></td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td><input type="text" name="userName" value="010-0000-0000"
								readonly /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="emailName"
								value="jihyeon2368@naver.com" readonly /></td>
						</tr>
					</table>
				</div>

				<div class="bank-info">
					<div class="donate-subtitle">후원 정보</div>
					<table class="donate-table">
						<tr>
							<th>후원금액</th>
							<td><input type="text" name="price" id="price"
								maxlength="20" /></td>
						</tr>
						<tr>
							<th>후원방법</th>
							<td><div class="acc-button">
									<a href="#">계좌이체</a>
								</div>
								<div class="kakao-button">
									<a href="#">카카오페이</a>
								</div></td>
						</tr>
						<tr>
							<th>은행명</th>
							<td><input type="text" name="bank" value="우리은행" readonly /></td>
						</tr>
						<tr>
							<th>예금주</th>
							<td><input type="text" name="userName" value="김지현" readonly /></td>
						</tr>
						<tr>
							<th>계좌번호</th>
							<td><input type="text" name="bankAcc"
								value="1234567-1234567" readonly /></td>
						</tr>
					</table>
				</div>
				<div class="donate-button">
					<input class="large-btn brown-btn" type="button"
						onclick="history.back()" value="취소"> <input
						class="large-btn brown-btn" type="submit" value="후원하기">
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false"></jsp:include>
	<script src="${js }/donationform.js"></script>
</body>
</html>
