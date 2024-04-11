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
		var container = document.getElementById('map'); //������ ���� ����
		var options = { //������ ������ �� �ʿ��� �⺻ �ɼ�
			center: new kakao.maps.LatLng(37.4962, 127.0284), //������ �߽���ǥ(lat:y, lon:x) -��������
			level: 2 //������ ����(Ȯ��, ��� ����) - ���� �������� ���� Ŀ��
		};
		var map = new kakao.maps.Map(container, options); //���� ���� �� ��ü ����
		
		var markerPosition = new kakao.maps.LatLng(37.4962, 127.0284); //��Ŀ�� �� ����

		
		// ��Ŀ�� ����
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
		marker.setMap(map);
		
		// ���������쿡 ǥ��� ����
		var iwContent = '<div style="padding:5px; text-align: center;"><a href="https://map.kakao.com/link/to/Hello World!,37.4962,127.0284" style="color:blue" target="_blank">�� ã��</a></div>', 
	    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //���������� ǥ�� ��ġ�Դϴ�

		// ���������츦 ����
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// ��Ŀ ���� ���������츦 ǥ��
		// �ι�° �Ķ������ marker�� �־����� ������ ���� ���� ǥ��
		infowindow.open(map, marker); 
	</script>
</body>
</html>