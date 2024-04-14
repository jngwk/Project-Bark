<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/boardNoticeList.css">
<style>
.imgsize {
	padding : 5px;
	max-width : 150px;

}
.info {
	margin-left: auto; margin-right: auto;
	width:100%;
	text-align: center;
}
table, td, th { 
	padding : 10px;
	/* 둥글게 만들기 */
    border-top-left-radius: 15px; 
    border-top-right-radius: 15px;
    border-bottom-left-radius: 15px; 
    border-bottom-right-radius: 15px;
    vertical-align : bottom;

}
#desc {
    border-top-left-radius: 15px; 
    border-top-right-radius: 15px;
    border-bottom-left-radius: 15px; 
    border-bottom-right-radius: 15px;
	background-color:  rgb(195, 184, 175);
}
td {
    border : 1px solid black;
  	border-collapse : collapse;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h>입양</h>
			
			<div style="vertical-align : center; padding : 20px;">
				[입양 안내] 입양 희망 전 안내사항 숙지 부탁드려요.
			</div>
			<div class="notice_up">
				<form action="#" method="post" class="notice_searchform">
	        	    <input type="search" class="notice-search">
                    <input type="submit" class="notice-search-submit" value="검색">
                </form>
            </div>
        </div>
        <div>
		<table>
   			<tr>
    			<td><div class="info">
    				<a href="index.jsp?target=/include/adoptionDetail" class="info"><img class="imgsize" src="${contextPath }/images/dogs/dog1.jpg"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
        				</div>
	       				</a>
        			</div>
				</td>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/dogs/dog2.jpg"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
        				</div>
	       				</a>
        			</div>
				</td>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/dogs/dog3.jpg"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
        				</div>
	       				</a>
        			</div>
				</td>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/dogs/dog4.jpg"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
	       				</a>
        			</div>
				</td>
			</tr>
			<tr>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/dogs/dog5.jpg"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
	       				</a>
        			</div>
				</td>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/dogs/dog6.jpg"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
        				</div>
	       				</a>
        			</div>
				</td>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/dogs/dog7.jpg"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
	       				</a>
        			</div>
				</td>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/dogs/dog8.jpg"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
        				</div>
	       				</a>
        			</div>
				</td>
			</tr>
			<tr>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/dogs/dog9.jpg"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
        				</div>
	       				</a>
        			</div>
				</td>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/bark_logo-removebg.png"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
        				</div>
	       				</a>
        			</div>
				</td>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/bark_logo-removebg.png"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
        				</div>
	       				</a>
        			</div>
				</td>
    			<td><div class="info">
    				<a href="#" class="info"><img class="imgsize" src="${contextPath }/images/bark_logo-removebg.png"><br>
        				<div id="desc">강철이/남<br>
        				xx 보호소 / 서울
        				</div>
	       				</a>
        			</div>
				</td>
			</tr>
        </table>
        
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
<!-- 
	<div class="container">
		<div class="row">
			<h>입양</h>
			<div class="notice_up">
				<form action="#" method="post" class="notice_searchform">
	        	    <input type="search" class="notice-search">
                    <input type="submit" class="notice-search-submit" value="검색">
                </form>
            </div> 
            
            
            
            
	        <table class="noticetable" border="1" >
    	    	<thead>
        			<tr>
        				<td> aaaaaa
        			</tr>
        		</thead>
        	</table>




        			<table>
        				<tr>
        					<td>강철이</td>
        					<td>남</td>
        				</tr>
        				<tr>
        					<td>xx 보호소</td>
        					<td>서울</td>
	       				</tr>
        			</table>

-->