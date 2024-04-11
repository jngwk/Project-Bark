<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="./css/adminManageDonationList.css" />
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="menu">
          <div class="sub-menu">
            <h><a href="#">내 정보</a></h>
            <h>기부금 관리</h>
            <h><a href="#">회원 관리</a></h>
          </div>
          <div class="main-menu">
            <h>기부금 관리</h>
          </div>
        </div>

        <div class="notice_up">
          <form action="#" method="post" class="notice_searchform">
            <select name="notice_Categori">
              <option>---전체---</option>
              <option value="1">회원ID</option>
              <option value="1">보호소명</option>
            </select>
            <input type="search" class="notice-search" />
            <input type="submit" class="notice-search-submit" value="검색" />
          </form>
        </div>

        <div class="table">
          <table class="noticetable">
            <thead>
              <tr>
                <th>No</th>
                <th>회원ID</th>
                <th>기부금액</th>
                <th>기부일</th>
                <th>보호소</th>
                <th>
                  <select>
                    <option>기부상태</option>
                    <option>처리완료</option>
                    <option>처리중</option>
                    <option>처리실패</option>
                  </select>
                </th>
                <th>보호소 연락처</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td><a href="#">wlgus8846</a></td>
                <td>1,000,000</td>
                <td>2024-03-24</td>
                <td>2조보호소</td>
                <td>처리중</td>
                <td>02-0000-0000</td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
            </tbody>
          </table>
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
