<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/boardNoticeList.css">
<link rel="stylesheet" href="./css/adoptionFrm.css">
</head>
<style>
.imgsize {
	top:5px;
	width : 600px;

}
.table1 td {
	border-bottom:1px solid #52442a;  color: #52442a; text-align: center; height: 30px; font-size: 16px;
}
.table1 td:nth-child(odd){     
    width: 250px;
    font-weight: bold; background-color:  rgb(195, 184, 175);    
}
.table1 td:nth-child(even){    
    width: 350px;
    font-weight: nomal;     
}
.button{
    display: flex; justify-content: center; align-items: center; margin-top:10px;
}
.button>input{
    width: 80px; height: 30px; font-size: 16px; font-weight: bold; margin: 5px; border-radius: 5px; border: 0px; color: #52442a; 
    }
.button>input:hover{
    background-color: rgb(195, 184, 175);
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div >
			<div class="adoption-title"><h1>입양</h1></div>
			
			<div class="adoption-form">
			<div>
				<td><img class="imgsize" src="${contextPath }/images/dogs/dog1.jpg"></td>
			</div>
			<br>
			<div class="table1" width="600px">
			<table>
				<tr>
					<td>이름(성별)</td>
					<td>강철이(남)</td>
				</tr>
				<tr>
					<td>나이</td>
					<td>2개월</td>
				</tr>
				<tr>
					<td>보호장소</td>
					<td>XX 보호소/서울</td>
				</tr>
				<tr>
					<td>특징</td>
					<td> 사람을 좋아함, 활발,<br>
						배변훈련중
					</td>
				</tr>
				<tr>
					<td>중성화</td>
					<td>X</td>
				</tr>
				<tr>
					<td>입양</td>
					<td>X</td>
				</tr>
			</table>
			<!-- TODO form 으로 변경하기 -->
			<div class="button">
                <a href="index.jsp?target=include/adoptionFrm">입양 신청</a> 
        	</div>
			</div>
			<div class="button">
                <a href="index.jsp?target=include/adoptionList">입양 목록</a>  
        	</div>
			</div>
			</div>
        </div>
    </div>
</body>
</html>