<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/donationList.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
    <!-- <script src="../js/popup.js"></script> -->

  </head>
  <body>
  <jsp:include page="${views }/include/header.jsp" flush="false" />
    <section class="notice">
      <p class="page-title">Donation</p>
      <p class="page-subtitle">[기부 내역]</p>

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
                  <option value="u.name">이름</option>
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
                <th scope="col" class="th-dogName">기부금액</th>
                <th scope="col" class="th-regDate">기부날짜</th>
                <th scope="col" class="th-exe">
                  <select class="userState">
                    <option>기부상태</option>
                    <option value="1">처리중</option>
                    <option value="2">처리완료</option>
                    <option value="0">처리실패</option>
                  </select>
                </th>
              </tr>
            </thead>
            <tbody class="donationList">
            <c:forEach var="dList" items="${dList}">
              <tr>
                <td>${dList.donationno}</td>	<!-- 테이블 컬럼명이랑 헷갈리지 않게 adoptionno로 수정했어요 -->
                <td>${dList.id}</td>
                <td>${dList.userName}</td>
                <td>${dList.shelterName}</td>
                <td>${dList.amount}</td>	<!-- 테이블 컬럼명이랑 헷갈리지 않게 adopt_date로 수정했어요 -->
                <td>${dList.paymentDate}</td>
                <td>${dList.state}</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </section>
    	<!-- 페이지넘버 -->
	<%-- <jsp:include page="${views }/include/donationPagination.jsp" flush="false" /> --%>
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
	
	<script>
	//검색
	$(".searchUserBtn").on("click",function(){
		getSearchDonation();
		console.log("click");
	})
	function getSearchDonation(){
		console.log($(".searchfilter").val());
		console.log($("#searchInput").val());
		$.ajax({
			type: 'POST',
			url : "/admin/getSearchDonation",
			data : {
					filter: $(".searchfilter").val(),
					input: $("#searchInput").val()
				},
			success : function(result){
				$('.donationList').empty();
				if(result.length>=1){
					result.forEach(function(dList){
						str=`
				            <tr>
			                <td>\${dList.donationno}</td>	<!-- 테이블 컬럼명이랑 헷갈리지 않게 adoptionno로 수정했어요 -->
			                <td>\${dList.id}</td>
			                <td>\${dList.userName}</td>
			                <td>\${dList.shelterName}</td>
			                <td>\${dList.amount}</td>	<!-- 테이블 컬럼명이랑 헷갈리지 않게 adopt_date로 수정했어요 -->
			                <td>\${dList.paymentDate}</td>
			                <td>\${dList.state}</td>
			              </tr>`
						$('.donationList').append(str);
        			}) 
				}
			},
			error:function(){
				alert("ajax 에러")
			}
		})
	}
	
	//state검색

	$(".userState").change(function(){
		getUserState();
	})


	function getUserState(){
		console.log($(".userState").val());
		$.ajax({
			type: 'POST',
			url : "/admin/getUserState",
			data : {
				filter: $(".searchfilter").val(),
				input: $("#searchInput").val(),
				state: $(".userState").val()},
			success : function(result){
				//테이블 초기화
				$('.donationList').empty();
				if(result.length>=1){
					result.forEach(function(dList){
						if(dList.state ==1){
							str=`
					            <tr>
				                <td>\${dList.donationno}</td>	<!-- 테이블 컬럼명이랑 헷갈리지 않게 adoptionno로 수정했어요 -->
				                <td>\${dList.id}</td>
				                <td>\${dList.userName}</td>
				                <td>\${dList.shelterName}</td>
				                <td>\${dList.amount}</td>	<!-- 테이블 컬럼명이랑 헷갈리지 않게 adopt_date로 수정했어요 -->
				                <td>\${dList.paymentDate}</td>
				                <td>\${dList.state}</td>
				              </tr>`
						}else if(dList.state ==2){
							str=`
					            <tr>
				                <td>\${dList.donationno}</td>	<!-- 테이블 컬럼명이랑 헷갈리지 않게 adoptionno로 수정했어요 -->
				                <td>\${dList.id}</td>
				                <td>\${dList.userName}</td>
				                <td>\${dList.shelterName}</td>
				                <td>\${dList.amount}</td>	<!-- 테이블 컬럼명이랑 헷갈리지 않게 adopt_date로 수정했어요 -->
				                <td>\${dList.paymentDate}</td>
				                <td>\${dList.state}</td>
				              </tr>`
						}

						$('.donationList').append(str);
	        		}) 
				}
			}
		})
	}

</script>
  </body>
</html>
