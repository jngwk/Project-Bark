<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<% String target = request.getParameter("target") + ".jsp"; %>
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
  	<div class="content-container">
    <jsp:include page="<%=target %>" flush="false"/>
    </div>
  </body>
</html>	