<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" scope="application"/>
    <c:set var="views" value="${contextPath }/WEB-INF/views" scope="application"/>
    <c:set var="css" value="${contextPath }/resources/css" scope="application"/>
    <c:set var="images" value="${contextPath }/resources/images" scope="application"/>
    <c:set var="icons" value="${images }/icons" scope="application"/>
    <c:set var="js" value="${contextPath }/resources/js" scope="application"/>
    <link rel="stylesheet" href="${css }/root.css" />
    <link rel="stylesheet" href="${css }/main.css" />
    <link rel="stylesheet" href="${css }/transition.css" />
    <!-- <script src="../js/main-vertical-slider.js"></script> -->
    <script
      src="https://code.jquery.com/jquery-3.7.1.js"
      integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
      crossorigin="anonymous"
    ></script>
    <!-- <script src="../js/transition.js"></script> -->
  </head>
  <body>
    <!-- header -->
    <jsp:include page="${views }/include/header.jsp" flush="false"></jsp:include>
    <!-- main -->
    <div class="slider-wrapper">
      <div class="slider">
        <div class="container fade active">
          <div class="hero-image bottom-to-top-animation">
            <img src="${images }/judy.jpg" alt="hero-image" />
          </div>
          <div class="container-inner slide">
            <div class="hero-title slide-animation">
              <strong class="xxlarge-font ">
                주디는 바크를 <br />통해 새로운 가족을<br />만났습니다
              </strong>
            </div>
            <div class="hero-content">
              <div class="hero-text slide-animation">
                <p>
                  이전 주인이 '주디'를 더 이상 돌 볼 수 없게 되어 바크를 통해 새로운 가족을 찾아야했습니다.
                  현재 주디는 새로운 가정에서 또 다시 행복한 견생을 살수 있게 됐습니다. 예비 견주님들도 주디의 친구들의 새로운 가족이
                  되어 주세요.
                </p>
              </div>
              <div class="call-to-action slide-animation">
              <a href="${contextPath }/adoption/list">
                <button class="bright-btn font-dark large-font">입양하기</button>
                </a>
                <div class="paw-icon">
                  <img src="${icons }/grey-paw.png" alt="pawprint" />
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container fade">
          <div class="hero-image bottom-to-top-animation">
            <img src="${images }/seok-gu3.jpg" alt="hero-image" />
          </div>
          <div class="container-inner slide">
            <div class="hero-title slide-animation">
              <strong class="xxlarge-font slide-animation">
                수많은 <br />강아지들이 집을 <br />찾고 있습니다
              </strong>
            </div>
            <div class="hero-content">
              <div class="hero-text slide-animation">
                <p>
                  어느 단체에 의해 구조된 이 강아지의 이름은 '석구'입니다.
                  석구에게는 소유자가 있었음에도 불구하고 이미 심장사상충,
                  자궁축농증 등 치료가 시급한 수많은 병이 진행되고 있었습니다.
                  석구는 유기견 보호소에 맡겨져 1년 째 주인을 찾고 있습니다.
                </p>
              </div>
              <div class="call-to-action slide-animation">
              <a href="${contextPath }/adoption/list">
                <button class="bright-btn font-dark large-font">입양하기</button>
                </a>
                <div class="paw-icon">
                  <img src="${icons }/grey-paw.png" alt="pawprint" />
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container fade">
          <div class="hero-image bottom-to-top-animation">
            <img src="${images }/kara.jpg" alt="hero-image" />
          </div>
          <div class="container-inner slide">
            <div class="hero-title slide-animation">
              <strong class="xxlarge-font slide-animation">
                보호소 아이들에게 <br />여러분의 마음을<br />전달해주세요
              </strong>
            </div>
            <div class="hero-content">
              <div class="hero-text slide-animation">
                <p>
                  보호소를 위한 기부금 대부분이 제대로 전달 되지 않는다는 사실을
                  알고 계셨나요? 바크 플랫폼을 통해 모금을 진행중인 보호소에
                  힘을 보태주세요. 여러분의 작은 도움이 아이들에게 큰 힘이
                  됩니다.
                </p>
              </div>
              <div class="call-to-action slide-animation">
              <a href="#">
                <button class="bright-btn font-dark large-font">후원하기</button>
                </a>
                <div class="paw-icon">
                  <img src="${icons }/pawprint.png" alt="pawprint" />
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </div>
      <div class="slider-btn">
        <img
          class="bounce"
          src="${icons }/chevrons-down-regular-84.png"
          alt="chevrons-down"
        />
      </div>
    </div>

    <!-- footer -->
	<jsp:include page="${views }/include/footer.jsp" flush="false"></jsp:include>
    <script type="text/javascript" src="./resources/js/main.js"></script>
  </body>
</html>
