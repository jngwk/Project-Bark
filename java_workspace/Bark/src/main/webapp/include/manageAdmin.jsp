<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>  
    <link rel="stylesheet" href="${contextPath }/css/manageAdmin.css" />
  </head>
  <body>
    <div class="container">
      <div class="row">
        <h2>관리자 계정</h2>

        <div class="table-top">
          <form action="#" class="table-search-form">
            <select name="notice_category">
              <option>---선택---</option>
              <option value="1">이름</option>
              <option value="1">아이디</option>
            </select>
            <input type="search" class="search-bar" />
            <input type="submit" class="search btn" value="검색" />
          </form>

          <div class="create-account btn"><a href="#">계정 생성</a></div>
        </div>

        <div class="table">
          <table class="admin-table">
            <thead>
              <tr>
                <th>No</th>
                <th>아이디</th>
                <th>이름</th>
                <th>생성일자</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td><a href="#">sample1234</a></td>
                <td>홍길동</td>
                <td>2024-03-24</td>
              </tr>
              <tr>
                <td>2</td>
                <td><a href="#">admin1234</a></td>
                <td>관리자</td>
                <td>2024-03-24</td>
              </tr>
              <tr>
                <td>3</td>
                <td><a href="#">conan1234</a></td>
                <td>코난</td>
                <td>2024-03-24</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="page-number">
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