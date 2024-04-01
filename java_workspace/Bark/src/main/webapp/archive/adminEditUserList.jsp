<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bark</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>      
    <link rel="stylesheet" href="${contextPath }/css/userAdoptionFrm.css">
    <style type="text/css">
    #buttom1 {
    	height: 10px;
    }
    #buttom2 {
    	height: 10px;
    }
    .adoption-form>div>table>tbody>tr>td>select{ 
    	 width: 200px;
    	
	}
	.readonly {
		background-color:#eeeeee;
	}
    </style>
  </head>
  <body>

	<div class="container">
	<div class="adoption-title"><h1>회원 정보 변경</h1></div>
	<div class="adoption">
    <form method="post" action="#" class="adoption-form">

    	<div class="firstform">
		<table> 
			<tr>
				<td>아이디</td>
				<td><input class="readonly" name="id" value="${param.id}" readonly>aaaa</td>
			</tr>
		</table>
		</div>
		<br>
    	<div class="firstform">
		<table> 
			<tr>
				<td>이름</td>
				<td><input class="readonly" name="name" value="${param.name}" readonly>aaaa</td>
			</tr>
		</table>
		</div>
		<br>
    	<div class="firstform">
		<table> 
			<tr>
				<td>이메일</td>
				<td><input class="readonly" name="email" value="${param.email}" readonly>aaaa</td>
			</tr>
		</table>
		</div>
		<br>
    	<div class="firstform">
		<table> 
			<tr>
				<td>연락처</td>
				<td><input class="readonly" name="phone" value="${param.phone}" readonly>aaaa</td>
			</tr>
		</table>
		</div>
		<br>
    	<div class="firstform">
		<table> 
			<tr>
				<td>회원구분</td>
				<td><select  name="gubun" >
						<option id="gubun1" value="1" selected disabled>개인회원</option>
						<option id="gubun2" value="2" disabled>보호소회원</option>
						<option id="gubun3" value="3" disabled>직원</option>
					</select>
				</td>
			</tr>
		</table>
		</div>
		<br>
    	<div class="firstform">
		<table> 
			<tr>
				<td>회원등급</td>
				<td><select name="grade" >
						<option id="grade1" value="1">우수</option>
						<option id="grade2" value="2">일반</option>
						<option id="grade3" value="3">불량</option>
					</select>
				</td>
			</tr>
		</table>
		</div>		
		
		
		
		
		<div class="adoption-button" id="buttom1">
        	보호소회원 처리 : <input name="button1" type="submit" value="가입승인"> 
                		  <input name="button2" type="submit" value="가입거절">
        </div>
        <div class="adoption-button" id="buttom2">
                <input name="button3" type="submit" value="수정"> 
                <input name="button4" type="submit" value="삭제">
        </div>
	</form>
	</div>
</div>
  </body>
</html>
