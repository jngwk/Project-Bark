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
    
    <link rel="stylesheet" href="${contextPath }/css/home.css" />
  </head>
  <body>
  <div class="main-image">
        <!-- main cover -->
        <div class="main-cover"></div>
        <!-- end of main cover -->
        <div class="main-content">
          <!-- hero section -->
          <section class="hero-section">
            <!-- TODO 메뉴 추가 -->
            <div class="inner-hero">
              <div class="content">
                <div class="title">
                  <strong
                    >수많은 <br />강아지들이 집을 <br />찾고 있습니다</strong
                  >
                </div>
                <div class="description-container">
                  <div class="description">
                    <p>
                      어느 단체에 의해 구조된 이 강아지의 이름은 '석구'입니다.
                      석구에게는 소유자가 있었음에도 불구하고 이미 심장사상충,
                      자궁축농증 등 치료가 시급한 수많은 병이 진행되고
                      있었습니다. 석구는 유기견 보호소에 맡겨져 1년 째 주인을
                      찾고 있습니다.
                    </p>
                  </div>
                  <button class="call-to-action" onclick="location.href='${contextPath}/index.jsp?target=./include/userAdoptionFrm'">입양하기</button>
                </div>
                <!-- end of description container -->
              </div>
              <!-- end of content -->
            </div>
            <!-- end of inner hero -->
          </section>
        </div>
        </div>
  </body>
</html>
