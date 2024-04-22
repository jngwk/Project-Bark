<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${css }/adminAdoptionList.css" />
    <link rel="stylesheet" href="${css }/root.css" />
    <!-- <script src="../js/popup.js"></script> -->

  </head>
  <body>
  <jsp:include page="${views }/include/header.jsp" flush="false" />
    <section class="notice">
      <p class="page-title">Adoption</p>
      <p class="page-subtitle">[입양 내역]</p>

      <!-- board seach area -->
      <div id="board-search">
        <div class="container">
          <div class="search-window">
            <form action="#" method="post">
              <div class="search-wrap">
                <label for="search" class="blind">공지사항 내용 검색</label>
                <select class="searchfilter">
                  <option value="phone">카테고리</option>
                  <option value="id">아이디</option>
                  <option value="name">이름</option>
                </select>
                <input
                  id="searchInput"
                  type="search"
                  name="searchInput"
                  placeholder="검색어를 입력해주세요."
                />
                <button type="button" class="searchUserBtn medium-btn btn-dark">검색</button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <!-- board list area -->
      <div id="board-list">
        <div class="container">
          <table class="board-table">
            <thead>
              <tr>
                <th scope="col" class="th-num">번호</th>
                <th scope="col" class="th-userId">아이디</th>
                <th scope="col" class="th-userName">이름</th>
                <th scope="col" class="th-shelterName">보호소</th>
                <th scope="col" class="th-dogName">강아지명</th>
                <th scope="col" class="th-regDate">입양일</th>
                <th scope="col" class="th-exe">
                  <select>
                    <option>입양상태</option>
                    <option value="1">처리중</option>
                    <option value="2">처리완료</option>
                    <option value="0">처리실패</option>
                  </select>
                </th>
              </tr>
            </thead>
            <tbody class="adoptionList">
            <c:forEach var="aList" items="${aList}">
              <tr>
                <td>${aList.no}</td>
                <td>${aList.id}</td>
                <td>${aList.name}</td>
                <td>${aList.shelterName}</td>
                <td>${aList.dogName}</td>
                <td>${aList.date}</td>
                <td>${aList.state}</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </section>

    	<!-- 페이지넘버 -->
	<jsp:include page="${views }/include/pagination.jsp" flush="false" />
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
	
	<script>
	//검색
	$(".searchUserBtn").on("click",function(){
		getSearchAdoption();
		console.log("click");
	})
	function getSearchAdoption(){
		console.log($(".searchfilter").val());
		console.log($("#searchInput").val());
		$.ajax({
			type: 'POST',
			url : "/admin/getSearchAdoption",
			data : {
					filter: $(".searchfilter").val(),
					input: $("#searchInput").val()
				},
			success : function(result){
				$('.adoptionList').empty();
				if(result.length>=1){
					result.forEach(function(aList){
						str=`
				            <tr>
				                <td>${aList.no}</td>
				                <td>${aList.id}</td>
				                <td>${aList.name}</td>
				                <td>${aList.shelterName}</td>
					            <td>${aList.dogName}</td>
								<td>${aList.date}</td>
				                <td>${aList.state}</td>
				            </tr>`
						$('.adoptionList').append(str);
        			}) 
				}
			},
			error:function(){
				alert("ajax 에러")
			}
		})
	}

</script>
  </body>
</html>
