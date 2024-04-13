<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="main">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bark</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <script type="text/javascript" src="${contextPath }/js/common.js"></script>
    <link rel="stylesheet" href="${contextPath }/css/root.css" />
    <link rel="stylesheet" href="${contextPath }/css/headerFooter.css" />
    <link rel="shortcut icon" href="${contextPath }/images/bark_logo_removebg.png">
  </head>
  <body>
    <jsp:include page="./include/headerFooter.jsp" flush="false"/>
    <!-- width 1600인 틀 안에서 작업 -->
    <div class="content-container">
    <jsp:include page="./include/home.jsp" flush="false"/>
    </div>
  </body>
</html>