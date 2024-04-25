<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shelterAdoptionList.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/root.css" />
<!-- <script src="../js/popup.js"></script> -->

</head>
<body>
	<jsp:include page="${views }/include/header.jsp" flush="false" />
	<section class="notice">
		<div class="page-title">
			<p>Adoption</p>
			<p class="page-lefttitle">[입양 내역]</p>
			<p class="slash">/</p>
			<a href="${contextPath }/user/userDonationList?id=${userId}">donation</a>
			<p class="page-righttitle">[기부 내역]</p>
		</div>

		<!-- board list area -->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-num">번호</th>
							<th scope="col" class="th-userID">이름</th>
							<th scope="col" class="th-userName">아이디</th>
							<th scope="col" class="th-dogName">강아지명</th>
							<th scope="col" class="th-regDate">입양신청일</th>
							<th scope="col" class="th-exe">입양승인</th>
						</tr>
					</thead>
					<tbody class="adoptionList">
						<c:forEach var="aList" items="${aList}">
							<tr>
								<td>${aList.adoptionno}</td>
								<td>${aList.userName}</td>
								<td>${aList.id}</td>
								<c:choose>
									<c:when test="${aList.dogName== null || aList.dogName ==''}">
										<td>이름없음</td>
									</c:when>
									<c:otherwise>
										<td>${aList.dogName}</td>
									</c:otherwise>
								</c:choose>
								<td>${aList.adopt_date}</td>
								<c:choose>
									<c:when test="${aList.state== 2}">
										<td><a
											href="${contextPath}/user/adoptionState?adoptionno=${aList.adoptionno}&state=1&userId=${aList.id }&id=${userId}"
											class="shelterReceive-btn brown-btn">승인</a></td>
									</c:when>
									<c:when test="${aList.state== 1}">
										<td><a
											href="${contextPath}/user/adoptionState?adoptionno=${aList.adoptionno}&state=2&userId=${aList.id }&id=${userId}"
											class="shelterRefuse-btn brown-btn">거절</a></td>
									</c:when>
									<c:otherwise>
										<td><a
											href="${contextPath}/user/adoptionState?adoptionno=${aList.adoptionno}&state=1&userId=${aList.id }&id=${userId}"
											class="shelterReceive-btn brown-btn">승인</a> <a
											href="${contextPath}/user/adoptionState?adoptionno=${aList.adoptionno}&state=2&userId=${aList.id }&id=${userId}"
											class="shelterRefuse-btn secondary-btn">거절</a></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:choose>
					<c:when test="${aList.size()==0}">
						<div class="noResults">
							<p>입양 내역이 없습니다.</p>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
	</section>

	<!-- 페이지넘버 -->
	<jsp:include page="${views }/include/pagination.jsp" flush="false" />
	<jsp:include page="${views }/include/footer.jsp" flush="false" />

</body>
</html>
