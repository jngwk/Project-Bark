<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">>
<title>Login</title>
<link rel="stylesheet" href="./css/login.css">
</head>
<body id="login">
<!-- main cover -->
        <div class="main-cover"></div>
        <!-- end of main cover -->
        <div class="main-content">
         
           <!-- log in -->
        <div class="login-form">
            <h1>로그인</h1>
            <form action="loginAction.jsp" method="post">
                <div class="form-element">
                    <span>아이디 </span><br>
                    <input type="text" class="login-input" name="mem_id" maxlength="20" required><br>
                </div>
                <div class="form-element">
                    <span>비밀번호</span><br>
                    <input type="password" class="login-input" name="pwd" maxlength="20" required><br>
                </div>
                <div class="find-id-pwd">
                    <ul>
                        <li><a href="index.jsp?target=findId"><span>아이디 </span></a></li>
                        <div class="divider"></div>
                        <li><a href="index.jsp?target=findPwd"><span> 비밀번호 찾기</span></a></li>
                    </ul>
                </div>
            <button type="submit" class="login-btn btn"><span>로그인</span></button>
            <a class="join-btn btn" href="index.jsp?target=joinUser"><span>회원가입</span></a>
            </form>
        </div>
    </div>
</body>
</html>