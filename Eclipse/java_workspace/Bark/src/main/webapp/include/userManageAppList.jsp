<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>  
    <link rel="stylesheet" href="${contextPath }/css/userManageAppList.css">
</head>
<body>
    <div class="container">
        <div class="row">
        
            <h>기부/입양/입소 관리</h>
            
            <div class="table">
            <table class="writeManage">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>기부/입양/입소</th>
                        <th>보호소</th>
                        <th>상태</th>
                        <th>신청일<th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td><a href="#"> 기부</a></td>
                        <td>바크 보호소</td>
                        <!-- 상태창 -->
                        <td><div class="status1">진행중</div></td>
                        <td>2024-03-18</td>
                        <td>
                        	<!-- 취소하기 버튼 -->
                        	<button type="button" class="minus-button">ㅡ</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="#"> 입양</a></td>
                        <td>바크 보호소</td>
                        <td><div class="status2">처리완료</div></td>
                        <td>2024-03-17</td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><a href="#"> 기부</a></td>
                        <td>바크 보호소</td>
                        <td><div class="status2">처리완료</div></td>
                        <td>2024-03-14</td>
                        <td>	
                        </td>
                    </tr>
                </tbody>
            </table>
			</div>
			
			<div class="pageNumber">
	            <a href="#"><</a>
	            <a href="#">1</a>
	            <a href="#">2</a>
	            <a href="#">3</a>
	            <a href="#">></a>
	        </div>
    	</div>
    </div>
</body>
</html>