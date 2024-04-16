<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${css }/root.css" />
    <link rel="stylesheet" href="${css }/adoptionList.css" />
    <script>
    /* 회원 메뉴*/
    // 프로필 드롭 다운
   	function menuToggle() {
   		const toggleMenu = document.querySelector(".profile-menu");
   		toggleMenu.classList.toggle("active");
   	}

    </script>
  </head>
  <body>
  <jsp:include page="${views }/include/header.jsp" flush="false"/>
  	
    <div class="grid__container">
    <!-- <h1 class="adoption-list-header">입양 목록</h1> -->
    <div class="adoption-list-header">
    <img src="${icons }/breed.png">
    <h1>입양</h1>
    </div>
      <div class="card__container">
        <article class="card__article">
          <img
            src="https://www.animal.go.kr/files/shelter/2024/03/202404051304148_s.jpg"
            alt="image"
            class="card__img"
          />

          <div class="card__data">
            <span class="card__description">수원보호소</span>
            <h2 class="card__title">불쌍해</h2>
            <a href="dog-description.html" class="card__button">입양하기</a>
          </div>
        </article>
        <article class="card__article">
          <img
            src="${images}/dogs/dog1.jpg"
            alt="image"
            class="card__img dog1-small"
          />

          <div class="card__data">
            <span class="card__description">안산보호소</span>
            <h2 class="card__title">영철이</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog2.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">안산보호소</span>
            <h2 class="card__title">콩이</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog3.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">안산보호소</span>
            <h2 class="card__title">바둑이</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog4.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">일산보호소</span>
            <h2 class="card__title">인절미</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog5.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">일산보호소</span>
            <h2 class="card__title">와와</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog6.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">일산보호소</span>
            <h2 class="card__title">가을이</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog7.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">일산보호소</span>
            <h2 class="card__title">흰둥이</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog8.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">서울보호소</span>
            <h2 class="card__title">핫산이</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog9.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">평택보호소</span>
            <h2 class="card__title">쌀이</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog10.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">평택보호소</span>
            <h2 class="card__title">철수</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog11.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">평택보호소</span>
            <h2 class="card__title">영숙이</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog12.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">평택보호소</span>
            <h2 class="card__title">낼름</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog13.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">수원보호소</span>
            <h2 class="card__title">기명이</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog14.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">수원보호소</span>
            <h2 class="card__title">노네임</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>

        <article class="card__article">
          <img src="${images}/dogs/dog15.jpg" alt="image" class="card__img" />

          <div class="card__data">
            <span class="card__description">수원보호소</span>
            <h2 class="card__title">이름없음</h2>
            <a href="#" class="card__button">입양하기</a>
          </div>
        </article>
      </div>
    </div>
    <jsp:include page="${views }/include/pagination.jsp" flush="false"/>
    <jsp:include page="${views }/include/footer.jsp" flush="false"/>
  </body>
</html>
