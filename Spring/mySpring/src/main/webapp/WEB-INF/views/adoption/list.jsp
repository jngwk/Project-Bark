<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/root.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adoptionList.css" />
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
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp"
		flush="false" />
	<div class="adoption-list-header">
		<p class="page-title">Adoption</p>
		<p class="page-subtitle">[입양 목록]</p>

	</div>

	<div id="board-search">
		<div class="search-window">

				<div class="search-wrap">
					<select id="searchField" name="searchField">
						<option value=""
							<c:if test="${page.cri.searchField ==''}">${'selected'}</c:if>>선택</option>
						<option value="breed"
							<c:if test="${page.cri.searchField == 'dogName'}">${'selected'}</c:if>>견종</option>
						<option value="shelterAddr"
							<c:if test="${page.cri.searchField == 'addr'}">${'selected'}</c:if>>지역명</option>
						<option value="shelterName" 
							<c:if test="${page.cri.searchField == 'shelterName'}">${'selected'}</c:if>>보호소명</option>
					</select>
					<input id="searchWord" type="search" name="searchWord" placeholder="검색어를 입력해주세요." value="${page.cri.searchWord}" />
					<button type="button" class="listBtn btn-dark">검색</button>
				</div>
			
		</div>
	</div>

	<div class="grid__container">
		<!-- <h1 class="adoption-list-header">입양 목록</h1> -->
		<div class="card__container">
			<c:forEach var="dogList" items="${dogList}">
				<article class="card__article">
					<c:choose>
						<c:when test="${not empty dogList.imgUrl}">
							<img src="${dogList.imgUrl}" alt="image" class="card__img" />
						</c:when>
						<c:when test="${not empty dogList.filename}">
							<img src="${ServletContext.request.contextPath}/resources/images/dogs/${dogList.uuid}_${dogList.filename}" alt="image" class="card__img" />
						</c:when>
					</c:choose>
					<div class="card__data">
						<span class="card__description">${dogList.shelterName}</span>
						<h2 class="card__title">
							<c:choose>
								<c:when test="${not empty dogList.name}">
						            ${dogList.name}
						        </c:when>
								<c:otherwise>
						            ${dogList.breed }
						        </c:otherwise>
							</c:choose>
						</h2>
						<a href="${contextPath }/adoption/detail?dogno=${dogList.dogno}"
							class="card__button">입양하기</a>
					</div>
				</article>
			</c:forEach>
		</div>
		<div class="story-button">
			<c:if test="${userType == 2 }">
				<a class="large-btn brown-btn" href="${contextPath }/adoption/write">등록하기</a>
			</c:if>
		</div>
	</div>
	<jsp:include page="${views }/include/adoptPagination.jsp" flush="false" />

	<jsp:include page="${views }/include/footer.jsp" flush="false" />

<script>
	$(".listBtn").on("click",function(){
		dogListSearch();
	})
	
	function dogListSearch(){
		console.log($("#searchField").val());
		$.ajax({
			type: 'POST',
			url : "/adoption/dogListSearch",
			data : {
				filter: $("#searchField").val(),
				input: $("#searchWord").val(),
				},
			success : function(result){
				//테이블 초기화
				$('.card__container').empty();
				if(result.length>=1){
					result.forEach(function(dogList){
							str=`<article class="card__article">`
							
									if(dogList.imgUrl =="" || dogList.imgUrl ==null){
							str+= `			<img src="\${dogList.imgUrl}" alt="image" class="card__img" />`

									}else if(dogList.imgUrl =="" || dogList.imgUrl ==null){
							str+=`			<img src="${ServletContext.request.contextPath}/resources/images/dogs/\${dogList.uuid}_\${dogList.filename}" alt="image" class="card__img" />`
									}
							
							str+=`		<div class="card__data">
											<span class="card__description">\${dogList.shelterName}</span>
											<h2 class="card__title">`
											
									if(dogList.name =="" || dogList.name ==null){
													str += `\${dogList.breed }`
									}else{
													str += `\${dogList.name }`
									}
											
							str += `		</h2>
											<a href="${contextPath }/adoption/detail?dogno=\${dogList.dogno}" class="card__button">입양하기</a>
										</div>
								</article>`

						$('.card__container').append(str);
	        		}) 
				}
			}
				
		})
	}
	
</script>
</body>
</html>