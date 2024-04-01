<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import = "java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>      
<link rel="stylesheet" href="${contextPath}/css/boardWrite.css">
<title>게시판 작성</title>
</head>
<body>

<div class="container">
	<div class="row">
		<p class="title">공지사항</p>
		<form method="post" action="writeAction.jsp">
			<table class="writetable" width="1000">
				<thead>
					<tr >
						<th width="50">제목</th>
						<th width="500"><input type="text" name="bbsTitle" maxlength="50"></th>
					</tr>
				</thead>
				<tbody >
					<tr>
						<td colspan="2"><textarea placeholder="내용을 작성하세요." name="bbsContent" maxlength="2048"></textarea></td>
					</tr>
				</tbody>
			</table>
				<div class="imageUpload">
				<input type="file" accept="image/jpeg" multiple>
				</div>
				<div class="write-button">
					<input type="button" onclick="history.back()" value="취소" class="cancle">
					<input type="submit" value="작성 완료" class="result">
				</div>
		</form>
	</div>
</div>
</body>
</html>