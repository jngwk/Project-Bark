<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보호소 조회</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shelterMap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/root.css" />
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" flush="false"></jsp:include>

	<div class="map-container">

		<div class="shelter-side">
			<div class="shelter-tab">
				<ul class="tab">
					<li><a class="shelter-name">보호소 이름</a></li>
					<li><a class="shelter-area">보호소 위치</a></li>
				</ul>
			</div>
			<div class="shelter-search">
				<div class="name-search">
					<form name="searchName">
						<input class="search" name="name" type="search"
							placeholder="보호소 이름 검색">
						<input class="submit" id="nameSearchBtn"
						type="submit" value="검색">
					</form>
				</div>
				<div class="area-search">
					<form name="searchAddr">
						<select class="main-city">
							<option>지역</option>
							<option value="seoul">서울</option>
							<option value="gyeonggi">경기도</option>
						</select>
						<select class="sub-city" name="city" id="sub-city">
							<option value="">시/군/구</option>
						</select>
						<input class="submit" id="addrSearchBtn" type="submit" value="검색">
					</form>
				</div>
			</div>
			<div class="list-container">
				<div class="shelter-list">
					<ul class="shelter-ul">
						<c:forEach var="list" items="${sList}">
							<li onclick="shelterMap(${list.lat},${list.lng}); expandList(this)">
								<div class="shelter-detail">
									<p>${list.shelterName}</p>
									<span>${list.shelterAddr}</span>
									<p style="display: none;">${list.lat}</p>
									<p style="display: none;">${list.lng}</p>
								</div>
								<div class="shelter-buttons">
									<div class="detail-box">
										<a href="${contextPath }/donation/form?shelterno=${list.shelterno}" class="donate green-btn large-btn">후원하기</a> 
										<a href="${contextPath }/adoption/list?shelterno=${list.shelterno}&pageNum=&amount=" class="donate green-btn large-btn">유기견 목록</a> 
										<%-- <a href="#" class="shelter-story green-btn large-btn">보호소 이야기</a> 
										<a href="${contextPath }/donation/campaign" class="campaign green-btn large-btn">캠페인
											둘러보기</a> --%>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="map" id="map" style="width: 100%;"></div>
	</div>
	<jsp:include page="${views }/include/footer.jsp" flush="false"></jsp:include>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=312e4647a38431cd979b5ac0e76d0051"></script>
	<script src="${js }/shelterMap.js"></script>
	<script>
	//이름 ajax
	$("#nameSearchBtn").on("click",function(e){
		e.preventDefault();
		getSearchName();
		console.log("click");
	})
	function getSearchName(){
/* 		console.log( $("form[name=searchName]").serialize()); */
		$.ajax({
			type: 'GET',
			url : "/donation/shelterSearchName",
			data : $("form[name=searchName]").serialize(),
			success : function(result){
				console.log(result);
				//테이블 초기화
				$('.shelter-ul').empty();
				if(result.length>=1){
					result.forEach(function(item){
						str=`
						<li onclick="shelterMap(\${item.lat},\${item.lng}); expandList(this);">
							<div class="shelter-detail" >
						<p>\${item.shelterName}</p>
						<span>\${item.shelterAddr}</span>
							<p style="display: none;">\${item.lat}</p>
						<p style="display: none;">\${item.lng}</p>
					</div>
					<div class="shelter-buttons">
						<div class="detail-box">
							<a href="${contextPath }/donation/form?shelterno=${list.shelterno}" class="donate green-btn large-btn">후원하기</a>
							<a href="#" class="shelter-story green-btn large-btn">보호소 이야기</a>
							<a href="${contextPath }/donation/campaign" class="campaign green-btn large-btn">캠페인 둘러보기</a>
						</div>
					</div>
				</li>`
						$('.shelter-ul').append(str);
	        		}) 
				}else if(result.length == 0){
					str=`
					<div style="display:flex; align-items: center; justify-content: center; height: 100px;">
						<p>검색 내용과 일치하는 보호소가 없습니다.</p>
					</div>`
					$('.shelter-ul').append(str);
				}
			}
		})
	}
	

	//주소 ajax
	$("#addrSearchBtn").on("click",function(e){
		e.preventDefault();
		getSearchAddr();
		console.log("click");
	})
	function getSearchAddr(){
		console.log($(".sub-city").val());
		$.ajax({
			type: 'GET',
			url : "/donation/shelterSearchAddr",
			data : {addr: $(".sub-city").val()},
			success : function(result){
				console.log(result);
				//테이블 초기화
				$('.shelter-ul').empty();
				if(result.length>=1){
					result.forEach(function(item){
						str=`
						<li onclick="shelterMap(\${item.lat},\${item.lng}); expandList(this);">
							<div class="shelter-detail" >
						<p>\${item.shelterName}</p>
						<span>\${item.shelterAddr}</span>
							<p style="display: none;">\${item.lat}</p>
						<p style="display: none;">\${item.lng}</p>
					</div>
					<div class="shelter-buttons">
						<div class="detail-box">
							<a href="${contextPath }/donation/form?shelterno=${list.shelterno}" class="donate green-btn large-btn">후원하기</a> <a
								href="#" class="shelter-story green-btn large-btn">보호소	이야기</a>
								<a href="${contextPath }/donation/campaign" class="campaign green-btn large-btn">캠페인 둘러보기</a>
						</div>
					</div>
				</li>`
						$('.shelter-ul').append(str);
	        		}) 
				}else if(result.length == 0){
					str=`
						<div style="display:flex; align-items: center; justify-content: center; height: 100px;">
							<p>검색 내용과 일치하는 보호소가 없습니다.</p>
						</div>`
						$('.shelter-ul').append(str);
					}
			}
		})
	}
	</script>
	<script src="${js }/map.js"></script>
</body>
</html>