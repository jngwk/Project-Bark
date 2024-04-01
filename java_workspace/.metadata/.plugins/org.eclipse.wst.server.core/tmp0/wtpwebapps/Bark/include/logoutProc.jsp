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
	<%
	session.removeAttribute("userId");
	session.removeAttribute("userName");
	session.removeAttribute("userType");
	%>
	location.href = "../main.jsp";
</script>
</body>
</html>