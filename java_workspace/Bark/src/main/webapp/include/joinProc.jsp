<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="user" class="dto.UserDTO"/>
<jsp:setProperty name="user" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- add shelter/gen confirmation -->
<%
	UserDAO dao = new UserDAO(application);
	pageContext.setAttribute("dao", dao);
%>
<c:set var="result" value="${dao.join(user) }"/>
<c:choose>
	<c:when test="${result == 1 }">
		<script>
			alert("회원가입이 완료됐습니다. 로그인 후 이용해주세요.");
			location.href = "../main.jsp";
		</script>
	</c:when>
	<c:when test="${result == 0 || result == -1}">
		<script>
			alert("데이터베이스에 접근하는데 오류가 발생했습니다. 관리자에게 문의해주세요.");
			location.href = "../main.jsp";
		</script>
	</c:when>
</c:choose>
</body>
</html>