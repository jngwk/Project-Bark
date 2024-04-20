<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${css }/donationList.css" />
    <link rel="stylesheet" href="${css }/root.css" />
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
                <select>
                  <option>카테고리</option>
                  <option>아이디</option>
                  <option>이름</option>
                  <option>보호소</option>
                </select>
                <input
                  id="search"
                  type="search"
                  name=""
                  placeholder="검색어를 입력해주세요."
                  value=""
                />
                <button type="submit" class="btn btn-dark">검색</button>
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
                <th scope="col" class="th-regDate">입금일</th>
                <th scope="col" class="th-email">보호소</th>
                <th scope="col" class="th-email">보호소 연락처</th>
                <th scope="col" class="th-exe">
                  <select>
                    <option>기부상태</option>
                    <option>처리중</option>
                    <option>처리완료</option>
                    <option>처리실패</option>
                  </select>
                </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>wlgus8846</td>
                <td>김지현</td>
                <td>2024-04-20</td>
                <td>2조보호소</td>
                <td>02-0000-0000</td>
                <td>처리중</td>
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
