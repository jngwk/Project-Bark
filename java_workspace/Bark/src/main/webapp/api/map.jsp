<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Map</title>
</head>
<body>	
  	<div id="map" style="width:720px; height:750px;"> </div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0c070bd3d76946d731ea8fc0729d0f3"></script>
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.4962, 127.0284), //지도의 중심좌표(lat:y, lon:x) -강남기준
			level: 2 //지도의 레벨(확대, 축소 정도) - 숫자 작을수록 지도 커짐
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		var markerPosition = new kakao.maps.LatLng(37.4962, 127.0284); //마커가 뜰 지점

		
		// 마커를 생성
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 인포윈도우에 표출될 내용
		var iwContent = '<div style="padding:5px; text-align: center;"><a href="https://map.kakao.com/link/to/Hello World!,37.4962,127.0284" style="color:blue" target="_blank">길 찾기</a></div>', 
	    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시
		// 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시
		infowindow.open(map, marker); 
	</script>
</body>
</html>