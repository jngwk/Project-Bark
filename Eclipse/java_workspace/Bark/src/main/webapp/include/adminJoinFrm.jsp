<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JoinUser</title>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath }/js/joinFrm.js"></script>
<link rel="stylesheet" href="${contextPath }/css/joinFrm.css">
</head>
<body id="join">
<script>
</script>
        <!-- join -->
        <div class="join-form">
            <h1>관리자 계정 생성</h1>
            <form action="${contextPath }/include/joinProc.jsp" method="post">
	                  
	            <input class="user-type" type="hidden" name="type" value="3"/>
            	<div>
            		<p id="required"><span class="red-star">*</span>필수입력사항</p>
            	</div>
            	
                <div class="form-element">
                    <span>아이디</span><span class="red-star">*</span>
                    <input type="text" class="join-input" name="id" maxlength="20" required>
                    <p class="check-message" id="checkId"></p>
                </div>
                
                <div class="form-element">
                    <span>비밀번호</span><span class="red-star">*</span>
                    <input type="password" class="join-input" name="pwd" maxlength="20" required>
                </div>
                <div class="form-element">
                    <span>비밀번호 확인</span><span class="red-star">*</span>
                    <input type="password" class="join-input" name="pwdCheck" onkeyup="checkPwd()" maxlength="20" required>
                    <br><br>
                    <!-- onkeyup : 키를 눌렀다가 땠을 때 이벤트 -->
                    <p class="check-message" id="checkPwd"></p>    
                </div>
                <div class="form-element">
                    <span>이름</span><span class="red-star">*</span>
                    <input type="text" class="join-input" name="name" maxlength="20" required>
                </div>
                
                <div class="form-element">
                    <span>연락처</span>
                    <input type="tel" class="join-input" name="phone" maxlength="20">
                </div>
                
                <div class="form-element">
                    <span>이메일</span><span class="red-star">*</span>
                    <input type="email" class="join-input" name="email" maxlength="20">
                </div>   

            <button type="submit" class="join-btn btn"><span>가입하기</span></button>
            </form>
        </div>
</body>
</html>