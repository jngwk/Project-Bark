<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<% String target = request.getParameter("target") + ".jsp"; %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bark</title>
    <link rel="stylesheet" href="./css/main-style.css" />
  </head>
  <body>
  	<jsp:include page="./include/header-footer.jsp" flush="false"/>
    <jsp:include page="<%=target %>" flush="false"/>
  </body>
</html>	