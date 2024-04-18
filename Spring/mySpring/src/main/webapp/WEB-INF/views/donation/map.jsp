<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보호소 조회</title>
<link rel="stylesheet" href="${css }/shelterMap.css" />
<link rel="stylesheet" href="${css }/root.css" />
</head>
<body>
	<jsp:include page="${views }/include/header.jsp" flush="false"></jsp:include>

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
					<form>
						<input class="search" type="search" placeholder="보호소 이름 검색">
						<input class="submit" type="submit" value="검색">
					</form>
				</div>
				<div class="area-search">
					<form>
						<select class="main-city">
							<option>지역</option>
							<option value="seoul">서울</option>
							<option value="gyeonggi">경기도</option>
						</select> <select class="sub-city" id="sub-city">
							<option>시/군/구</option>
						</select> <input class="submit" type="submit" value="검색">
					</form>
				</div>
			</div>
			<div class="list-container">
				<div class="shelter-list">
					<ul class="shelter-ul">
						<c:forEach var="list" items="${sList}">
							<li onclick="shelterMap(${list.lat},${list.lng})">
								<div class="shelter-detail" >
									<p>${list.shelterName}</p>
									<span>${list.shelterAddr}</span>
  									<p style="display: none;">${list.lat}</p>
									<p style="display: none;">${list.lng}</p>
								</div>
								<div class="shelter-buttons">
									<div class="detail-box">
										<a href="#" class="donate green-btn large-btn">후원하기</a> <a
											href="#" class="shelter-story green-btn large-btn">보호소
											이야기</a> <a href="#" class="campaign green-btn large-btn">캠페인
											둘러보기</a>
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
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});
	
	  function shelterMap(lat,lng){
		    map.setCenter(new kakao.maps.LatLng(lat,lng));
		    marker.setPosition(new kakao.maps.LatLng(lat,lng));    
		}
	  marker.setMap(map);

	// 마커가 지도 위에 표시되도록 설정합니다
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);
	
	  //보호소 정보
  let listContainer = document.querySelector(".shelter-ul");
  let shelterLists = listContainer.querySelectorAll("li");
  

  console.log(listContainer);
  console.log(shelterLists);
  shelterLists.forEach((list) => { list.querySelector(".shelter-detail").onclick = function (e) {
	  
	    if(!list.classList.contains("liExpand")){        
	    	
	    	shelterLists.forEach((el) => {            
	    		el.classList.remove("liExpand");
	    	});
	    	list.classList.toggle("liExpand");         
	    }
	    else{                                            
	      list.classList.toggle("liExpand");             
	    }
    }; 
  });


	  
	  
	</script>
</body>
</html>