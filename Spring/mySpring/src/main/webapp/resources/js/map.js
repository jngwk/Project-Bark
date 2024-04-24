var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.5033532547808, 127.049875769645), // 지도의 중심좌표
		level : 2
	// 지도의 확대 레벨
	};

	 
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var imageSrc = `/resources/images/icons/dog-marker.png`; //마커이미지의 주소 
    var imageSize = new kakao.maps.Size(100, 100) //마커이미지의 크기
    var imageOption = {offset: new kakao.maps.Point(27.5033532547808, 117.049875769645)};	// 마커이미지의 옵션, 마커의 좌표와 일치시킬 이미지 안에서의 좌표(-10)
    
    // 마커의 이미지정보를 가지고 있는 마커이미지
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(37.5033532547808, 127.049875769645);	// 마커가 표시될 위치입니다 
    

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition,
		image: markerImage
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
	
