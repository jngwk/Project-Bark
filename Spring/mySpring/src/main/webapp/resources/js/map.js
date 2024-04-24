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
	
	
	function shelterMap(shelterAddr){
		var geocoder = new kakao.maps.services.Geocoder();
	
		geocoder.addressSearch(shelterAddr, function(result, status) {
	      	// 정상적으로 검색이 완료됐으면 
	      	if(status === kakao.maps.services.Status.OK) {
	
	        	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        	map.setCenter(coords);
	        	marker.setPosition(coords);
    	 	 } 
		});
	}
	marker.setMap(map);
	
	  

	// 마커가 지도 위에 표시되도록 설정합니다
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);
	
	
	

	
		  //보호소 정보
  function expandList(e){
          let listContainer = e.closest(".shelter-ul");
          let shelterLists = listContainer.querySelectorAll("li");
        if(!e.classList.contains("liExpand")){        
            
            shelterLists.forEach((el) => {            
                el.classList.remove("liExpand");
            });
            e.classList.toggle("liExpand");         
        }
        else{                                            
          e.classList.toggle("liExpand");             
        }
  }; 
	
