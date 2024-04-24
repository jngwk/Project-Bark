var mapContainer = document.getElementById("map"), // 지도를 표시할 div
  mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3,
    // 지도의 확대 레벨
  };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
function setMapByAddress(address) {
  // 주소로 좌표를 검색합니다
  geocoder.addressSearch(
    "서울시 강남구 도산대로 101길 29 103동 301호",
    function (result, status) {
      // 정상적으로 검색이 완료됐으면
      if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
          map: map,
          position: coords,
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
          content:
            '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>',
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
      }
    }
  );
}

// 마커가 표시될 위치입니다
var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
  position: markerPosition,
});

function shelterMap(lat, lng) {
  map.setCenter(new kakao.maps.LatLng(lat, lng));
  marker.setPosition(new kakao.maps.LatLng(lat, lng));
}
marker.setMap(map);

// 마커가 지도 위에 표시되도록 설정합니다
// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);

//보호소 정보
function expandList(e) {
  let listContainer = e.closest(".shelter-ul");
  let shelterLists = listContainer.querySelectorAll("li");
  if (!e.classList.contains("liExpand")) {
    shelterLists.forEach((el) => {
      el.classList.remove("liExpand");
    });
    e.classList.toggle("liExpand");
  } else {
    e.classList.toggle("liExpand");
  }
}
