<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/boardNoticeList.css">

<style type="text/css">
.table{
	min-height: 200px;
}
.writeButton{ 
	margin-right : 20px;
}
.noticetable>thead>tr>th:nth-child(2){
    width: 130px;
}
.noticetable>thead>tr>th:nth-child(3){
    width: 130px;
}
.noticetable>thead>tr>th:nth-child(4){
    width: 190px;
}
.noticetable>thead>tr>th:nth-child(5){
    width: 250px;
}
.noticetable>thead>tr>th:nth-child(6){
    width: 100px;
}
.noticetable>thead>tr>th:nth-child(7){
    width: 80px;
}
.noticetable>thead>tr>th:nth-child(8){
    width: 120px;
}
.noticetable>tbody>tr>td{
	background: #fcf1e7; color: #52442a; text-align: center; border-bottom: 1px solid rgb(195, 184, 175);
    padding: 5px;
}


.adoption-form>div>table{    
    border-spacing: 0;  display: flex; justify-content: center;
}
.adoption-form tbody{    
    border:1px solid #52442a;  border-bottom:0px;
}
.adoption-form td{
    border-bottom:1px solid #52442a;  color: #52442a; text-align: center; height: 30px; font-size: 16px;
}
.adoption-form td:nth-child(odd){   
    font-weight: bold; background-color:  rgb(195, 184, 175);
}
.adoption-form td:nth-child(even){   
    font-weight: nomal; 
}

.thirdform td:nth-child(odd){     
    width: 100px;    
}
.thirdform td:nth-child(even){    
    width: 100px;    
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h>회원 조회</h>
			<div class="notice_up">
            <form action="#" method="post" class="notice_searchform">
            <select name="notice_Categori">
                <option>---선택---</option>
                <option value="1">이름</option>
                <option value="1">공지2</option>
                <option value="1">공지3</option>
            </select>
	        	    <input type="search" class="notice-search">
                    <input type="submit" class="notice-search-submit" value="검색">
	        
            </form>	        
            </div>
            
            
			<div class="table">
			<table class="noticetable">
				<thead>
					<tr>
						<th>NO.</th>
						<th>회원ID</th>
						<th>회원명</th>
						<th>가입일</th>
						<th>이메일</th>
						<th>회원구분</th>
						<th>등급</th>
						<th>가입승인</th>
					</tr>
				</thead>
				<tbody>
					<tr>	
						<td>1</td>
						<td><a href="${contextPath }/index.jsp?target=include/adminEditUser&id=shelter">shelter</a></td>
						<td>김보호</td>
						<td>2024-03-24</td>
						<td>shelter@bark.com</td>
						<td>보호소</td>
						<td>우수</td>
						<td><input type="submit" class="notice-search-submit" value="승인">
						    <input type="submit" class="notice-search-submit" value="거절"></td>
						<td style="visibility: hidden;">1</td>
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
		<div class="adoption-form">
		<div class="thirdform">
            <table >
                        <tbody>
                            <tr>
                                <td>전체 회원</td>
                                <td><input value="1234"></td>
                                <td>우수 회원</td>
                                <td><input value="1234"></td>
                                <td>일반 회원</td>
                                <td><input value="1234"></td>
                            </tr>
                            <tr>
                                <td>여성 회원</td>
                                <td><input value="1234"></td>
                                <td>일반 회원</td>
                                <td><input value="1234"></td>
                                <td>보호소회원</td>
                                <td><input value="1234"></td>
                            </tr>
                            <tr>
                                <td>남성 회원</td>
                                <td><input value="1234"></td>
                                <td>불량 회원</td>
                                <td><input value="1234"></td>
                                <td>직 원</td>
                                <td><input value="1234"></td>
                            </tr>
                        </tbody>
                    </table>
         </div>
	</div>
	</div>
</body>
</html>