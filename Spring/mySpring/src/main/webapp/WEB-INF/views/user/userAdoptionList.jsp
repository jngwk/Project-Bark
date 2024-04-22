<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userAdoptionList.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
    <!-- <script src="../js/popup.js"></script> -->

  </head>
  <body>
  <jsp:include page="${views }/include/header.jsp" flush="false" />
    <section class="notice">
      <div class="page-title">
      	<a href="${contextPath }/user/userDonationList?id=${userId}">Donation[기부 내역]</a>
      	<p class="slash">/</p>
      	<p>Adoption</p>
      	<p class="page-subtitle">[입양 내역]</p>
      </div>

      <!-- board list area -->
      <div id="board-list">
        <div class="container">
          <table class="board-table">
            <thead>
              <tr>
                <th scope="col" class="th-num">번호</th>
                <th scope="col" class="th-shelterName">보호소</th>
                <th scope="col" class="th-dogName">강아지명</th>
                <th scope="col" class="th-regDate">입양일</th>
                <th scope="col" class="th-exe">
                  <select class="userState">
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
                <td>${aList.shelterName}</td>
                <c:choose>
                	<c:when test="${aList.dogName== null || aList.dogName ==''}">
                		<td>이름없음</td>
                	</c:when>
                	<c:otherwise>
                		<td>${aList.dogName}</td>
                	</c:otherwise>
                </c:choose>
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
				                <td>\${aList.no}</td>
				                <td>\${aList.id}</td>
				                <td>\${aList.userName}</td>
				                <td>\${aList.shelterName}</td>`
				                
				        if(aList.dogName == null || aList.dogName == ""){
					        str += `<td>이름없음</td>`
				        }else{
				        	str +=`<td>\${aList.dogName}</td>`
				        }

				        	str +=`<td>\${aList.date}</td>
				                	<td>\${aList.state}</td>
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
				$('.adoptionList').empty();
				if(result.length>=1){
					result.forEach(function(aList){
						if(aList.state ==1){
							str=`
					            <tr>
				                <td>\${aList.no}</td>
				                <td>\${aList.id}</td>
				                <td>\${aList.userName}</td>
				                <td>\${aList.shelterName}</td>
				                <td>\${aList.dogName}</td>
				                <td>\${aList.date}</td>
				                <td>\${aList.state}</td>
				              </tr>`
						}else if(aList.state ==2){
							str=`
					            <tr>
				                <td>\${aList.no}</td>
				                <td>\${aList.id}</td>
				                <td>\${aList.userName}</td>
				                <td>\${aList.shelterName}</td>
				                <td>\${aList.dogName}</td>
				                <td>\${aList.date}</td>
				                <td>\${aList.state}</td>
				              </tr>`
						}

						$('.adoptionList').append(str);
	        		}) 
				}
			}
		})
	}

</script>
  </body>
</html>
