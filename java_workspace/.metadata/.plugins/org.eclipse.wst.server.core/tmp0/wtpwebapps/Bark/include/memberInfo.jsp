<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="./css/memberInfo.css"/>
</head>
<!--  이름 성별 아이디 이메일 회원구분 연락처 연락처2-->
<body>
<div class="container">
	<h3 id="info_header" style="font-size: 30px;">회원 정보 변경</h3>
		<div class = "main_info">
			<ul class = "infolist">
				<li><span class="label-text">이름</span> : 
				<input class="profile" type="text" data-text-content="true" 
				value="홍길동" readonly></li>
				
				<li><span class="label-text">성별</span> : 
				<input class="profile" type="text" data-text-content="true" 
				value="남자" readonly></li>
				
				<li><span class="label-text">아이디</span> : 
				<input class="profile" type="text" data-text-content="true" 
				value="bark123" readonly></li>
	
				<li><span class="label-text">이메일</span> : 
				<input class="profile1" type="text" data-text-content="true" 
				value="bark@gmail.com" ></li>
				
				<li><span class="label-text">회원구분</span> : 
				<input class="profile" type="text" data-text-content="true" 
				value="일반" readonly></li>
				
				<li><span class="label-text">연락처</span> : 
				<input class="profile1" type="text" data-text-content="true" 
				value="010-1111-1111" ></li>
				<li class="align-right">
				<input type="submit" value="수정" style="margin-left: 150px">
				</li>
			</ul>
		</div>
		</div>
</body>
</html>