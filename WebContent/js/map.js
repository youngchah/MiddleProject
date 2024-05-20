
let landAddr = document.getElementById("landAddr").value;

function initialize() {

	var mapOptions = {
		zoom: 16, // 지도를 띄웠을 때의 줌 크기
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};


	var map = new google.maps.Map(document.getElementById("map-canvas"), // div의 id과 값이 같아야 함. "map-canvas"
		mapOptions);

	var size_x = 40; // 마커로 사용할 이미지의 가로 크기
	var size_y = 40; // 마커로 사용할 이미지의 세로 크기


	const svgMarker = {
		path: "M-1.547 12l6.563-6.609-1.406-1.406-5.156 5.203-2.063-2.109-1.406 1.406zM0 0q2.906 0 4.945 2.039t2.039 4.945q0 1.453-0.727 3.328t-1.758 3.516-2.039 3.070-1.711 2.273l-0.75 0.797q-0.281-0.328-0.75-0.867t-1.688-2.156-2.133-3.141-1.664-3.445-0.75-3.375q0-2.906 2.039-4.945t4.945-2.039z",
		fillColor: "#FD4666",
		fillOpacity: 1,
		strokeWeight: 0,
		rotation: 0,
		scale: 2,
		anchor: new google.maps.Point(0, 20),
	};


	// 마커로 사용할 이미지 주소
	//         var image = new google.maps.MarkerImage( '주소 여기에 기입!',
	//                                                     new google.maps.Size(size_x, size_y),
	//                                                     '',
	//                                                     '',
	//                                                     new google.maps.Size(size_x, size_y));

	// Geocoding *****************************************************
	var address = landAddr; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
	var marker = null;
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({ 'address': address }, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			map.setCenter(results[0].geometry.location);
			marker = new google.maps.Marker({
				map: map,
				icon: svgMarker, // 마커로 사용할 이미지(변수)
				title: '서울시립미술관', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
				position: results[0].geometry.location
			});

			var content = "한밭도서관<br/><br/>Tel: 042-580-4114"; // 말풍선 안에 들어갈 내용

			// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
			var infowindow = new google.maps.InfoWindow({ content: content });
			google.maps.event.addListener(marker, "click", function() { infowindow.open(map, marker); });
		} else {
			alert("Geocode was not successful for the following reason: " + status);
		}
	});
	// Geocoding // *****************************************************

}
google.maps.event.addDomListener(window, 'load', initialize);
