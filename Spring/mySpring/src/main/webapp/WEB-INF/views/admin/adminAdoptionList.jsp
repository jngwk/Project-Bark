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
                  <option value="">카테고리</option>
                  <option value="id">아이디</option>
                  <option value="userName">이름</option>
                  <option value="shelterName">보호소</option>
                </select>
                <input
                  id="searchInput"
                  type="search"
                  name="searchInput"
                  placeholder="검색어를 입력해주세요."
                />
                <button type="submit" class="searchUserBtn btn-dark">검색</button>
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
                    <option>처리중</option>
                    <option>처리완료</option>
                    <option>처리실패</option>
                  </select>
                </th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="aList" items="${aList}">
              <tr>
                <td>${aList.no}</td>
                <td>${aList.id}</td>
                <td>${aList.name}</td>
                <td>${aList.shelterName}</td>
                <td>${aList.dogName}</td>
                <td>${aList.adopt_date}</td>
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
		if($(".searchfilter").val() != ""){
			getSearchUser();
		}else{$("#searchInput").val()==null;
			getSearchUser();}
			console.log("click");
		})
	function getSearchUser(){
		console.log($(".searchfilter").val());
		console.log($("#searchInput").val());
		$.ajax({
		type: 'POST',
		url : "/admin/getSearchUser",
		data : {
					filter: $(".searchfilter").val(),
					input: $("#searchInput").val()
				},
		success : function(result){
			$('.userList').empty();
			if(result.length>=1){
				let count=result.length+1;
				result.forEach(function(uList){
					count--;
					if(uList.type ==2){
						if(uList.available ==2){
							str=`
						         <tr>
					               <td>\${count}</td>
					               <td>\${uList.id }</td>
					               <td>\${uList.name }</td>
					               <td>\${uList.regDate }</td>
					               <td>\${uList.email }</td>
					               <td>\${uList.type }</td>
			            	 	   <td><a href="${contextPath}/admin/available?available=1&id=\${uList.id }" class="shelterReceive-btn brown-btn">승인</a>
						           </td>
				              	</tr>`
						}else if(uList.available ==1){
							str=`
						         <tr>
					               <td>\${count}</td>
					               <td>\${uList.id }</td>
					               <td>\${uList.name }</td>
					               <td>\${uList.regDate }</td>
					               <td>\${uList.email }</td>
					               <td>\${uList.type }</td>
			            	 	   <td><a href="${contextPath}/admin/available?available=2&id=\${uList.id }" class="shelterRefuse-btn brown-btn">거절</a></td>
						           </td>
				              	</tr>`
						}
						else{
							str=`
						         <tr>
					               <td>\${count}</td>
					               <td>\${uList.id }</td>
					               <td>\${uList.name }</td>
					               <td>\${uList.regDate }</td>
					               <td>\${uList.email }</td>
					               <td>\${uList.type }</td>
					               <td><a href="${contextPath}/admin/available?available=1&id=\${uList.id }" class="shelterReceive-btn brown-btn">승인</a>
						            <a href="${contextPath}/admin/available?available=2&id=\${uList.id }" class="shelterRefuse-btn brown-btn">거절</a></td>
						           </td>
				              	</tr>`
						}
						
					}else if(uList.type ==1){
						str=`
					          <tr>
				                <td>\${count}</td>
				                <td>\${uList.id }</td>
				                <td>\${uList.name }</td>
				                <td>\${uList.regDate }</td>
				                <td>\${uList.email }</td>
				                <td>\${uList.type }</td>
			              		<td><td>
			              	</tr>`
					}
					$('.userList').append(str);
        		}) 
			}
		}
	})
}
	
	//type검색

 		$(".userType").change(function(){
			if(this.value==1 || this.value==2){
 			getUserType();
			}else{
				getSearchUser();
			}
			
	})


	function getUserType(){
		console.log($(".userType").val());
 		$.ajax({
			type: 'POST',
			url : "/admin/getUserType",
			data : {
				filter: $(".searchfilter").val(),
				input: $("#searchInput").val(),
				type: $(".userType").val()},
			success : function(result){
				//테이블 초기화
				$('.userList').empty();
				if(result.length>=1){
					let count=result.length+1;
					result.forEach(function(uList){
						count--;
						if(uList.type ==2){
							if(uList.available ==2){
								str=`
							         <tr>
						               <td>\${count}</td>
						               <td>\${uList.id }</td>
						               <td>\${uList.name }</td>
						               <td>\${uList.regDate }</td>
						               <td>\${uList.email }</td>
						               <td>\${uList.type }</td>
				            	 	   <td><a href="${contextPath}/admin/available?available=1&id=\${uList.id }" class="shelterReceive-btn brown-btn">승인</a>
							           </td>
					              	</tr>`
							}else if(uList.available ==1){
								str=`
							         <tr>
						               <td>\${count}</td>
						               <td>\${uList.id }</td>
						               <td>\${uList.name }</td>
						               <td>\${uList.regDate }</td>
						               <td>\${uList.email }</td>
						               <td>\${uList.type }</td>
				            	 	   <td><a href="${contextPath}/admin/available?available=2&id=\${uList.id }" class="shelterRefuse-btn brown-btn">거절</a></td>
							           </td>
					              	</tr>`
							}
							else{
								str=`
							         <tr>
						               <td>\${count}</td>
						               <td>\${uList.id }</td>
						               <td>\${uList.name }</td>
						               <td>\${uList.regDate }</td>
						               <td>\${uList.email }</td>
						               <td>\${uList.type }</td>
						               <td><a href="${contextPath}/admin/available?available=1&id=\${uList.id }" class="shelterReceive-btn brown-btn">승인</a>
							            <a href="${contextPath}/admin/available?available=2&id=\${uList.id }" class="shelterRefuse-btn brown-btn">거절</a></td>
							           </td>
					              	</tr>`
							}
							
						}else if(uList.type ==1){
							str=`
						          <tr>
					                <td>\${count}</td>
					                <td>\${uList.id }</td>
					                <td>\${uList.name }</td>
					                <td>\${uList.regDate }</td>
					                <td>\${uList.email }</td>
					                <td>\${uList.type }</td>
				              		<td><td>
				              	</tr>`
						}

						$('.userList').append(str);
	        		}) 
				}
			}
		})
	}

	
	</script>

	</script>
  </body>
</html>
