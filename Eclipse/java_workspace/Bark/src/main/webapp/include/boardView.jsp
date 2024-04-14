<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import = "java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width" initial-scale="1">
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>      
<link rel="stylesheet" href="${contextPath}/css/boardView.css">
<title>게시판 보기</title>
</head>
<body>
    <div class="container">
        <div class="view-container">
            <table class="viewtable" width="1000">
                <thead>
                    <tr>
                        <th colspan="8">공지사항</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width:15%;">글제목</td>
                        <td colspan="2">제목입니다</td>
                        <td style="width:15%;">조회수</td>
                        <td colspan="2">0</td>
                        <td style="width:15%;">추천수</td>
                        <td colspan="2">0</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan="2">wlgus8846</td>
                        <td>작성일자</td>
                        <td colspan="4">2024-04-01</td>
                    </tr>
                    <tr>
                        <td>글내용</td>
                        <td colspan="8">내용입니다.</td>
                    </tr>
                </tbody>
            </table>
            <div class="view-button">
                <input type="button" onclick="history.back()" value="목록" class="cancle">
                <input type="button" onclick="" value="수정">
                <input type="button" onclick="return confirm('정말로 삭제하시겠습니까?')" value="삭제">
            </div>

        </div>
    </div>
</body>
</html>