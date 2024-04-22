<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adoptionList.css" />
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
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" flush="false"/>
  	   <div class="adoption-list-header">
    <p class="page-title">Adoption</p><p class="page-subtitle">[입양 목록]</p>
    </div>
    <div class="grid__container">
    <!-- <h1 class="adoption-list-header">입양 목록</h1> -->
		<div class="card__container">
		<c:forEach var="dogList" items="${dogList}" >
			<article class="card__article">
				<img
					src="${dogList.imgUrl}"
					alt="image" class="card__img" />
				<div class="card__data">
					<span class="card__description">${dogList.shelterName}</span>
						<h2 class="card__title">
							<c:choose>
						        <c:when test="${not empty dogList.breed}">
						            ${dogList.breed}
						        </c:when>
						        <c:otherwise>
						            ${dogList.name}
						        </c:otherwise>
						    </c:choose>
					 	</h2>
					<a href="${contextPath }/adoption/detail?dogno=${dogList.dogno}" class="card__button">입양하기</a>
				</div>
			</article>
		</c:forEach> 
      </div>
    </div>	
	<jsp:include page="${views }/include/adoptPagination.jsp" flush="false"/>
    <jsp:include page="${views }/include/footer.jsp" flush="false"/>
  </body>
</html>
