<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bark</title>
    <link rel="stylesheet" href="./css/root.css" />
    <link rel="stylesheet" href="./css/headerFooter.css" />
  </head>
  <body>
    <jsp:include page="./include/headerFooter.jsp" flush="false"/>
    <!-- width 1600인 틀 안에서 작업 -->
    <div class="content-container">
    <jsp:include page="./include/home.jsp" flush="false"/>
    </div>
  </body>
</html>