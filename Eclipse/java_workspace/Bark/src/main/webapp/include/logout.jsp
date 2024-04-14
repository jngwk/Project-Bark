<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="logout"></div>
<script>
	let input = confirm("로그아웃 하시겠습니까?");
	console.log(input);
	
	if(input){
		alert("로그아웃 되었습니다.");
		location.href = "./logoutProc.jsp";
    } else {
    	alert("로그아웃이 취소되었습니다.");
    	history.back();
    }
</script>
</body>
</html>