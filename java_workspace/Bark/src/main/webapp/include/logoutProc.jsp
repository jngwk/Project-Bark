<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
session.setAttribute("member", null); 
session.setAttribute("memberType", null);
response.sendRedirect(request.getContextPath()+"/main.jsp");
%>
</body>
</html>