<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPost</title>
    <link rel="stylesheet" href="./css/myPost.css">
    
    <style>
    	#icon{
    		padding: 5px 5px 0 5px;
    	}
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
        
            <h2>작성글</h2>
            
            <div class="myPost_up">
            <form action="#" method="post" class="myPost_Category">
            
            <select name="myPost_Category">
                <option>카테고리</option>
                <option value="1">기부</option>
                <option value="2">입양</option>
                <option value="3">입소</option>
            </select>
	        </form>

            <div class="writeButton"><a href="#">글쓰기</a></div>
            </div>
            
            <div class="table">
            <table class="myPosttable">
                <thead>
                    <tr>
                        <th>No</th>
                        <th></th>
                        <th>Subject</th>
                        <th>Board</th>
                        <th>Category</th>
                        <th>Date</th>
                        <th>Views</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td id="icon"><img src="./images/icons/image.png"></td>
                        <td><a href="#"> 새로운 가족이 된 바크를 소개합니다!</a></td>
                        <td>자유게시판</td>
                        <td>입양</td>
                        <td>2024-03-24</td>
                        <td>123</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td id="icon"><img src="./images/icons/lock.png"></td>
                        <td><a href="#"> 입양 문의드립니다.(답변 완료)</a></td>
                        <td>문의하기</td>
                        <td>입양</td>
                        <td>2024-03-14</td>
                        <td>2</td>
                    </tr>
                </tbody>
            </table>
            <form action="#" method="post" class="myPost_Category" style="margin-top:10px;">
            <select name="myPost_Category">
                <option>작성자</option>
                <option value="1">제목</option>
                <option value="2">제목 + 내용</option>
                <option value="3">댓글</option>
            </select>
            <input type="search" class="myPost-search">
            <input type="submit" class="myPost-search-submit" value="검색">
            </form>
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