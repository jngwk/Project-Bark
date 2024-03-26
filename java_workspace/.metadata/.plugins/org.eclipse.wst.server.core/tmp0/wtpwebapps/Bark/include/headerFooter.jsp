<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <!-- header-footer -->
    <div class="header-footer-container">
      <!-- side -->
      <div class="side-container">
        <!-- side inner -->
        <div class="side-inner">
          <div class="logo-wrap">
            <a href="index.jsp?target=./include/home">
              <img
                src="./images/bark_logo-removebg.png"
                width="200px"
                height="auto"
              />
            </a>
          </div>
          <!-- end of logo -->
          <!-- footer -->
          <div class="footer-wrap">
            <div class="footer">
              <span>
                Copyright © Bark Co.,Ltd<br />
                All Rights Reserved</span
              >
            </div>
          </div>
          <!-- end of footer -->
        </div>
        <!-- end of side inner -->
      </div>
      <!-- end of side -->
      <!-- nav -->
      <div class="navigation-wrap">
        <!-- nav inner -->
        <div class="navigation-inner">
          <ul>
            <li class="nav-item">
              <a href="index.jsp?target=./include/home"><strong>소개</strong></a>
            </li>
            <li class="nav-item dropdown">
              <a href="index.jsp?target=./include/home"><strong>보호소 및 후원</strong></a>
              <div class="dropdown-content">
                <a href="index.jsp?target=./include/home"><strong>후원 안내</strong></a>
                <a href="index.jsp?target=./include/home"><strong>보호소 조회</strong></a>
                <a href="index.jsp?target=./include/home"><strong>보호소 이야기</strong></a>
              </div>
            </li>
            <li class="nav-item">
              <a href="index.jsp?target=./include/adoptionForm"><strong>입양</strong></a>
            </li>
            <li class="nav-item dropdown">
              <a href="#"><strong>게시판</strong></a>
              <div class="dropdown-content">
                <a href="index.jsp?target=./include/board"><strong>공지사항</strong></a>
                <a href="index.jsp?target=./include/home"><strong>정보공유</strong></a>
                <a href="index.jsp?target=./include/home"><strong>문의하기</strong></a>
              </div>
            </li>
            <li class="nav-item">
              <a href="index.jsp?target=./include/myPost"><strong>로그인</strong></a>
            </li>
          </ul>
        </div>
        <!-- end of nav inner -->
      </div>
      <!-- end of nav -->
    </div>
    <!-- end of header-footer -->
  </body>
</html>
