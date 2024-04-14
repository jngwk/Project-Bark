<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>findId</title>
<link rel="stylesheet" href="./css/findIdPwdFrm.css">
</head>
<body id="findId">  
        <!-- findId -->
        <div class="find-form">
            <form action="findIdAf.jsp" method="post">
	            <h1>아이디 | 비밀번호 찾기</h1>
	            <div class="findIdPwd-select">
	            	<button type="button" class="btn checked">아이디 찾기</button>
	            	<button type="button" onclick="location.href='index.jsp?target=findIdFrm'" class="btn" id="findPwd-btn" >비밀번호 찾기</button>
	            </div>
                <div class="form-element findId-element">
                    <span>이메일</span>
                    <input type="email" class="findId-input" name="email" maxlength="20" required>
                </div>               
            <button type="submit" class="btn"><span>아이디 찾기</span></button>
            </form>
        </div>
</body>
</html>