<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>findShelter</title>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" href="${contextPath }/css/findShelter.css">
</head>
<body>
	<div class="container">

			<div class="left">
				<div class="first-info">
					<table>
						<tr>
							<td><strong>00 보호소</strong></td>
							<td class="status1">모금중</td>
						</tr>
						<tr>
							<td>서울 중구 중립로 2길 13-10</td>
							<td class="status2">후원하기</td>
						</tr>
					</table>
				</div>
				<div class="second-info">
					<table>
					<tr>
						<td class="dog-image"><img src="./images/icons/user-circle-bean-brown.png"></td>
						<td><strong>보호중인 동물 1</td>
					</tr>
					<tr>
						<td class="dog-image"><img src="./images/icons/user-circle-bean-brown.png"></td>
						<td><strong>보호중인 동물 2</td>
					</tr>
					<tr>
						<td class="status3">캠페인 보기</td>
					</tr>
					</table>
				</div>
				<div class="shelter-info">
					<table>
						<tr>
							<td>XX 보호소</td>
						</tr>
						<tr>
							<td>서울 중구 신당동 840-4</td>
						</tr>
					</table>
				</div>
				<div class="shelter-info">
					<table>
						<tr>
							<td>XX 보호소</td>
						</tr>
						<tr>
							<td>서울 중구 신당동 840-4</td>
						</tr>
					</table>
				</div>
				<div class="shelter-info">
					<table>
						<tr>
							<td>XX 보호소</td>
						</tr>
						<tr>
							<td>서울 중구 신당동 840-4</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="right">
				<div class="map-box">
					<img src="./images/map.jpg">
				</div>
			</div>

	</div>
</body>
</html>