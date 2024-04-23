<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userDonationList.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
    <!-- <script src="../js/popup.js"></script> -->

  </head>
  <body>
  <jsp:include page="${views }/include/header.jsp" flush="false" />
    <section class="notice">
      <div class="page-title">
      	<p>Donation</p>
      	<p class="page-lefttitle">[기부 내역]</p>
      	<p class="slash">/</p>
      	<a href="${contextPath }/user/userAdoptionList?id=${userId}">Adoption</a>
      	<p class="page-righttitle">[입양 내역]</p>
      </div>

      <!-- board list area -->
      <div id="board-list">
        <div class="container">
          <table class="board-table">
            <thead>
              <tr>
                <th scope="col" class="th-num">번호</th>
                <th scope="col" class="th-shelterName">보호소</th>
                <th scope="col" class="th-dogName">기부금액</th>
                <th scope="col" class="th-regDate">기부날짜</th>
                <th scope="col" class="th-exe">
                  <select class="userState">
                    <option>입양상태</option>
                    <option value="0">처리중</option>
                    <option value="1">처리완료</option>
                    <option value="2">처리실패</option>
                  </select>
                </th>
              </tr>
            </thead>
            <tbody class="donationList">
            <c:forEach var="dList" items="${dList}">
              <tr>
                <td>${dList.no}</td>
                <td>${dList.shelterName}</td>
                <td>${dList.amount}</td>
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
	<jsp:include page="${views }/include/pagination.jsp" flush="false" />
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
	
	<script>
	//state검색

	$(".userState").change(function(){
		getDState();
	})
	function getDState(){
		console.log($(".userState").val());
		$.ajax({
			type: 'POST',
			url : "/user/getDState",
			data : {
				id: "${userId}",
				state: $(".userState").val()},
			success : function(result){
				//테이블 초기화
				$('.donationList').empty();
				if(result.length>=1){
					result.forEach(function(dList){
							str=`
							<tr>
				                <td>\${dList.no}</td>
				                <td>\${dList.shelterName}</td>
				                <td>\${dList.amount}</td>
				                <td>\${dList.paymentDate}</td>`
				             if(dList.state==0){
				            	 str+= `<td>처리중</td>
						                </tr>`
				             }else if(dList.state==0=1){
				            	 str+= `<td>처리완료</td>
						                </tr>`
				             }else{
				            	 str+= `<td>처리실패</td>
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
