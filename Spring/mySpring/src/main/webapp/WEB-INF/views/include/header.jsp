<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }"
		scope="application" />
	<c:set var="views" value="${contextPath }/WEB-INF/views"
		scope="application" />
	<c:set var="css" value="${contextPath }/resources/css"
		scope="application" />
	<c:set var="images" value="${contextPath }/resources/images"
		scope="application" />
	<c:set var="icons" value="${images }/icons" scope="application" />
	<c:set var="js" value="${contextPath }/resources/js"
		scope="application" />
	<!-- header -->
	<div class="header-container">
		<div class="header-inner">
			<c:choose>
				<c:when
					test="${fn:contains(pageContext.request.requestURI, 'main.jsp')}">
					<c:set var="logo" value="${images }/logo-white.png" />
				</c:when>
				<c:otherwise>
					<c:set var="logo" value="${images }/logo-white.png" />
				</c:otherwise>
			</c:choose>
			<a href="/"> <img class="logo" src="${logo}" alt="logo"
				width="200px" />
			</a>
			<div class="navigation-menu">
				<ul>
					<!-- <li><a class="transition" href="#"><strong
							class="xlarge-font hover-underline">소개</strong></a></li> -->
					<li class="dropdown"><a class="transition" href="#"><strong
							class="xlarge-font hover-underline">ABOUT</strong></a>
						<div class="dropdown-content">
							<a class="transition" href="${contextPath }/static/about"><strong
								class="large-font hover-underline">소개</strong></a> <a
								class="transition" href="${contextPath }/board/noticeList"><strong
								class="large-font hover-underline">공지사항</strong></a>
						</div></li>
					<li class="dropdown"><a class="transition" href="#"><strong
							class="xlarge-font hover-underline">보호소 및 후원</strong></a>
						<div class="dropdown-content">
							<a class="transition" href="#"><strong
								class="large-font hover-underline">후원 안내</strong></a> <a
								class="transition" href="${contextPath }/donation/form"><strong
								class="large-font hover-underline">후원하기</strong></a> <a
								class="transition" href="${contextPath }/donation/map"><strong
								class="large-font hover-underline">보호소 조회</strong></a> <a
								class="transition" href="${contextPath }/donation/campaign"><strong
								class="large-font hover-underline">캠페인 둘러보기</strong></a>
						</div></li>
					<li class="dropdown"><a class="transition" href="#"><strong
							class="xlarge-font hover-underline">입양</strong></a>
						<div class="dropdown-content">
							<a class="transition"
								href="${contextPath }/adoption/adoptionInfo"><strong
								class="large-font hover-underline">입양 안내</strong></a> <a
								class="transition" href="${contextPath }/adoption/list"><strong
								class="large-font hover-underline">입양하기</strong></a>
						</div></li>
					<%--<li class="dropdown"><a class="transition" href="#"><strong
							class="xlarge-font hover-underline">게시판</strong></a>
						<div class="dropdown-content">
							<a class="transition" href="${contextPath }/board/noticeList"><strong
								class="large-font hover-underline">공지사항</strong></a>  <a
								class="transition" href="${contextPath }/board/shareList"><strong
								class="large-font hover-underline">정보공유</strong></a> <a
								class="transition" href="#"><strong
								class="large-font hover-underline">보호소 이야기</strong></a>  
						</div></li>--%>
					<li><a class="transition"
						href="${contextPath }/board/contactWrite"><strong
							class="xlarge-font hover-underline">문의하기</strong></a></li>
					<li>
						<!-- 로그인 상태 확인 --> <c:choose>
							<c:when test="${empty userId}">
								<a class="transition" href="#"> <strong
									class="xlarge-font hover-underline open-pop"> 로그인 </strong>
								</a>
								<jsp:include page="${views }/user/login.jsp" flush="false"></jsp:include>
							</c:when>
							<c:otherwise>
								<div class="profile-area">
									<div class="profile" onclick="menuToggle();">
										<img src='${icons }/user-circle-white.png'
											alt="profile-badge-white">
										<%-- 					  		<c:choose>
					  			<c:when test="${fn:contains(pageContext.request.requestURI, '')}">
					  				<img src='${icons }/user-circle-rose-white.png' alt="profile-badge-rose-white">
					  				<!--<c:out value="<img src='./images/icons/user-circle-rose-white.png' width='42px'>" escapeXml="false"/>-->
					  			</c:when>
					  			<c:otherwise>
						  			<img src='${icons }/user-circle-bean-brown.png' alt="profile-badge-bean-brown">
						  			<!--<c:out value="<img src='./images/icons/user-circle-bean-brown.png' width='42px'>" escapeXml="false"/>-->
					  			</c:otherwise>
				  			</c:choose> --%>
									</div>
									<div class="profile-menu">
										<c:choose>
											<c:when test="${userType == '1' || userType == '2'}">
												<h3>${userName}<br> <span>${userId}</span>
												</h3>
												<ul>
													<li><img src="${icons }/user-detail.png" /><a
														href="javascript:openUpdatePop()">내 정보 조회</a></li>
													<%-- <c:if test="${userType == '2'}">
														<li><img src="${icons }/post.png" /><a
															href="${contextPath }/user/userWriteList">작성글 관리</a></li>
													</c:if> --%>
													<li><img src="${icons }/book-heart.png" /><a
														href="${contextPath }/user/userDonationList?id=${userId}">기부/입양
															관리</a></li>
													<li><img src="${icons }/post.png" /><a
														href="${contextPath }/user/userWriteList">문의내역</a></li>
													<li><img src="${icons }/logout.png" /><a
														href="${contextPath }/user/logout">로그아웃</a></li>
												</ul>
											</c:when>
											<c:when test="${userType == '3' }">
												<h3>${userName}<br> <span>${userId}</span>
												</h3>
												<ul>
													<li><img src="${icons }/adoption.png" /><a
														href="${contextPath }/admin/adminAdoptionList">입양내역</a></li>
													<li><img src="${icons }/donation.png" /><a
														href="${contextPath }/admin/donationList">기부내역</a></li>
													<li><img src="${icons }/book-heart.png" /><a
														href="${contextPath }/admin/userList">회원관리</a></li>
													<li><img src="${icons }/post.png" /><a
														href="${contextPath}/admin/userWriteList">문의내역</a></li>
													<li><img src="${icons }/logout.png" /><a
														href="${contextPath }/user/logout">로그아웃</a></li>
												</ul>
											</c:when>
										</c:choose>
									</div>
								</div>
								<jsp:include page="${views }/user/update.jsp" flush="false"></jsp:include>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<script src="${js }/header.js"></script>
</body>
</html>
