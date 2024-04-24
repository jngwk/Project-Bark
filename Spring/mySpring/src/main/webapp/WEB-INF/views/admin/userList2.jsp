<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userList.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
    <!-- <script src="../js/popup.js"></script> -->
<%--     <script src="resources/js/js/userList.js"></script> --%>
  </head>
  <body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" flush="false" />

    <section class="notice">
      <p class="page-title">User Account</p>
      <p class="page-subtitle">[회원 계정]</p>

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
                <a href="#" class="total-btn medium-btn btn-dark">전체회원</a>
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
                <th scope="col" class="th-username">이름</th>
                <th scope="col" class="th-regDate">가입일</th>
                <th scope="col" class="th-email">이메일</th>
                <th scope="col" class="th-exe">
                  <select class="userType" name="userType">
                    <option value="">회원구분</option>
                    <option value="1">개인회원</option>
                    <option value="2">보호소회원</option>
                  </select>
                </th>
                <th scope="col" class="th-exe"></th>
              </tr>
            </thead>
            <tbody class="userList">
           <c:set var="count" value="${uList.size()+1}" />
           <c:forEach var="List" items="${uList}">
           <c:set var="count" value="${count-1}" />
              <tr>
                <td>${count}</td>
                <td>${List.id }</td>
                <td>${List.name }</td>
                <td>${List.regDate }</td>
                <td>${List.email }</td>
                <td>${List.type }</td>
                <c:choose>
                	<c:when test = "${List.type== 2}">
                		<c:choose>
                			<c:when test="${List.available== 2}">
             		    		<td><a href="${contextPath}/admin/available?available=1&id=${List.id }" class="shelterReceive-btn brown-btn">승인</a></td>
             		    	</c:when>
             		    	<c:when test="${List.available== 1}">
			            		<td><a href="${contextPath}/admin/available?available=2&id=${List.id }" class="shelterRefuse-btn brown-btn">거절</a></td>
			            	</c:when>
			            	<c:otherwise>
			            		<td><a href="${contextPath}/admin/available?available=1&id=${List.id }" class="shelterReceive-btn brown-btn">승인</a>
			            		<a href="${contextPath}/admin/available?available=2&id=${List.id }" class="shelterRefuse-btn brown-btn">거절</a></td>
			            	</c:otherwise>
			            </c:choose>
              		</c:when>
              		<c:otherwise>
              			<td><td>
              		</c:otherwise>
              	</c:choose>
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
	//검색
		$(".searchUserBtn").on("click",function(){
			if($(".searchfilter").val() != "phone"){
				getSearchUser();
			}else{$("#searchInput").val()==null; getSearchUser();}
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
	
	</script>

  </body>
</html>

