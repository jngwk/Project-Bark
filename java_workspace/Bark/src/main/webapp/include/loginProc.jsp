<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- for testing -->
<%
session.setAttribute("member", 1); 
session.setAttribute("memberType", "user");
response.sendRedirect(request.getContextPath()+"/main.jsp");
%>
</body>
</html>