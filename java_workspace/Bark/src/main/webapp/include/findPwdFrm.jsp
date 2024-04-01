<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>findPwd</title>
<link rel="stylesheet" href="./css/findIdPwdFrm.css">
</head>
<body id="findPwd">         
        <!-- findPwd -->
        <div class="find-form">
            <form action="findIdAf.jsp" method="post">
	            <h1>아이디 | 비밀번호 찾기</h1>
	            <div class="findIdPwd-select">
	            	<button type="button" onclick="location.href='index.jsp?target=findIdFrm'" class="btn">아이디 찾기</button>
	            	<button type="button" class="btn checked">비밀번호 찾기</button>
	            </div>
            	<div class="form-element findPwd-element">
                    <span>아이디 </span><br>
                    <input type="text" class="findPwd-input" name="id" maxlength="20" required><br>
                </div>
                <div class="form-element findPwd-element">
                    <span>이메일</span>
                    <input type="email" class="findPwd-input" name="email" maxlength="20" required>
                </div>
            <!-- 비밀번호 찾기인지 변경인지? -->               
            <button type="submit" class="btn"><span>비밀번호 찾기</span></button>
            </form>
        </div>
        <script>
        
        </script>
</body>
</html>