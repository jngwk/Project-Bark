<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${css }/userList.css" />
    <link rel="stylesheet" href="${css }/root.css" />
    <!-- <script src="../js/popup.js"></script> -->
<%--     <script src="${js }/js/userList.js"></script> --%>
  </head>
  <body>
<jsp:include page="${views }/include/header.jsp" flush="false" />

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
                <select>
                  <option>카테고리</option>
                  <option>아이디</option>
                  <option>이름</option>
                </select>
                <input
                  id="search"
                  type="search"
                  name=""
                  placeholder="검색어를 입력해주세요."
                  value=""
                />
                <button type="submit" class="btn medium-btn btn-dark">검색</button>
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
                    <option valuer="">회원구분</option>
                    <option value="1">개인회원</option>
                    <option value="2">보호소회원</option>
                  </select>
                </th>
                <th scope="col" class="th-exe"></th>
              </tr>
            </thead>
            <tbody class="userList">
           <c:forEach var="uList" items="${uList}">
              <tr>
                <td>1</td>
                <td>${uList.id }</td>
                <td>${uList.name }</td>
                <td>${uList.regDate }</td>
                <td>${uList.email }</td>
                <td>${uList.type }</td>
                <td><a class="brown-btn" href="${contextPath}/admin/available?available=1">승인</a><a class="brown-btn" href="${contextPath}/admin/available?available=2">거절</a></td>
              </tr>
              </c:forEach>
              <tr>
                <td>1</td>
                <td>wlgus8846</td>
                <td>김지현</td>
                <td>2024-04-20</td>
                <td>wlgus8846@daum.net</td>
                <td>개인회원</td>
                <td><a class="brown-btn" href="${contextPath}/admin/available?available=0">삭제</a></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>

    	<!-- 페이지넘버 -->
	<jsp:include page="${views }/include/pagination.jsp" flush="false" />
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
	
	
	<script>
	$(".userType").change(function(){
		
		if(this.value == 1 || this.value == 2 ){
			getUserType();
		}
	})
	function getUserType(){
		console.log($(".userType").val());
 		$.ajax({
			type: 'POST',
			url : "/admin/getUserType",
			data : {type: $(".userType").val()},
			success : function(result){
				//테이블 초기화
				$('.userList').empty();
				if(result.length>=1){
					result.forEach(function(uList){
						str=`
				          <tr>
			                <td>1</td>
			                <td>\${uList.id }</td>
			                <td>\${uList.name }</td>
			                <td>\${uList.regDate }</td>
			                <td>\${uList.email }</td>
			                <td>\${uList.type }</td>
			                <td><a class="brown-btn" href="${contextPath}/admin/available?available=1">승인</a><a class="brown-btn" href="${contextPath}/admin/available?available=2">거절</a></td>
			              </tr>`
						$('.userList').append(str);
	        		}) 
				}
			}
		})
	}
	
	</script>

  </body>
</html>
