<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>  
<link rel="stylesheet" href="${contextPath }/css/userEditProfileFrm.css"/>
</head>
<!--  이름 성별 아이디 이메일 회원구분 연락처 연락처2-->
<body>
<%
	UserDAO dao = new UserDAO(application);
	UserDTO user = dao.getUser((String)session.getAttribute("userId"));
	pageContext.setAttribute("user", user);
%>
<div class="container">
	<h1 id="info_header">회원 정보 변경</h1>
	<form class = "main_info" action="./userEditProfileProc.jsp" method="post">
		<ul class = "info-list">
			<li class="form-element">
			<span class="label-text">이름</span>
			<input class="profile-info" type="text" data-text-content="true" 
			value="${user.name }" readonly>
			</li>
			
			<li class="form-element">
			<span class="label-text">아이디</span>
			<input class="profile-info" type="text" data-text-content="true" 
			value="${user.id }" readonly>
			</li>
			
			<li class="form-element">
			<span class="label-text">연락처</span>
			<input class="profile-info" type="text" data-text-content="true" 
			value="${user.phone }" >
			</li>
			
			<li class="form-element">
			<span class="label-text">이메일</span>
			<input class="profile-info" type="text" data-text-content="true" 
			value="${user.email }" >
			</li>

			<li class="form-element">
			<span class="label-text">주소</span>
			<input class="profile-info" type="text" data-text-content="true" 
			value="${user.addr }" >
			</li>
			
			<li class="form-element">
			<span class="label-text">세부주소</span>
			<input class="profile-info" type="text" data-text-content="true" 
			value="${user.addrDetail }" >
			</li>
			
			<li class="form-element">
			<span class="label-text">우편번호</span>
			<input class="profile-info" type="text" data-text-content="true" 
			value="${user.postcode }" >
			</li>
			
			<li class="form-element">
			<span class="label-text">은행</span>
			<input class="profile-info" type="text" data-text-content="true" 
			value="${user.bank }" >
			</li>
			
			<li class="form-element">
			<span class="label-text">계좌번호</span>
			<input class="profile-info" type="text" data-text-content="true" 
			value="${user.bankAcc }" >
			</li>
			
			<c:choose>
				<c:when test="${user.type == 1 }">
					<c:set var="userType" value="개인"/>
				</c:when>
				<c:when test="${user.type == 2 }">
					<c:set var="userType" value="보호소"/>
				</c:when>
				<c:when test="${user.type == 3 }">
					<c:set var="userType" value="관리자"/>
				</c:when>
			</c:choose>
			<li class="form-element">
			<span class="label-text">회원구분</span>
			<input class="profile-info" type="text" data-text-content="true" 
			value="${userType }" readonly>
			</li>
			<li class="edit-btn-area">
			<button type="submit" class="edit-btn btn"><span>수정하기</span></button>
			</li>
		</ul>
	</form>
</div>
</body>
</html>