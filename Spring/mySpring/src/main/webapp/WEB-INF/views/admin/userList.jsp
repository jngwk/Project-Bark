<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${css }/userList.css" />
    <link rel="stylesheet" href="${css }/root.css" />
    <!-- <script src="../js/popup.js"></script> -->
    <script src="${js }/js/userList.js"></script>
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
                  <select>
                    <option>회원구분</option>
                    <option>개인회원</option>
                    <option>보호소회원</option>
                    <option>임직원</option>
                  </select>
                </th>
                <th scope="col" class="th-grade">
                  <select>
                    <option>등급</option>
                    <option>일반</option>
                    <option>불량</option>
                  </select>
                </th>
                <th scope="col" class="th-exe"></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>wlgus8846</td>
                <td>김지현</td>
                <td>2024-04-20</td>
                <td>wlgus8846@daum.net</td>
                <td>개인회원</td>
                <td>일반</td>
                <td><a class="brown-btn" href="#">승인</a><a class="brown-btn" href="#">거절</a></td>
              </tr>
            </tbody>
            <tbody>
              <tr>
                <td>1</td>
                <td>wlgus8846</td>
                <td>김지현</td>
                <td>2024-04-20</td>
                <td>wlgus8846@daum.net</td>
                <td>개인회원</td>
                <td>일반</td>
                <td><a class="brown-btn" href="#">삭제</a></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>

    	<!-- 페이지넘버 -->
	<jsp:include page="${views }/include/pagination.jsp" flush="false" />
	<jsp:include page="${views }/include/footer.jsp" flush="false" />
  </body>
</html>
