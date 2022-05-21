/**
 * 
 */
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

var container = document.getElementById('map'); // 지도를 표시할 div

// 초기 중심좌표 : 이젠아카데미컴퓨터학원 상봉캠퍼스
var options = {
	center: new kakao.maps.LatLng(37.5972417071274, 127.087726673055),
	level: 3
};

// 지도를 생성한다
var map = new kakao.maps.Map(container, options);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();

var marker = new kakao.maps.Marker({
	map: map,
	position: new kakao.maps.LatLng(37.5972417071274, 127.087726673055),
});

var kwd;

var placeID;

// 학원 위치를 지도에 마커와 info를 표시한다
KeySearch('이젠아카데미 상봉캠퍼스');

// 키워드로 장소를 검색합니다
function KeySearch(keyword) {
	kwd = keyword;
	marker.setMap(null);
	infowindow.open(null, marker);
	ps.keywordSearch(keyword, placesSearchCB);
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB(data, status) {
	if (status === kakao.maps.services.Status.OK) {

		displayMarker(data[0]);

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setCenter(new kakao.maps.LatLng(data[0].y, data[0].x));
		map.setLevel(4);
	}
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {

	// 마커를 생성하고 지도에 표시합니다
	marker = new kakao.maps.Marker({
		map: map,
		position: new kakao.maps.LatLng(place.y, place.x)
	});

	infowindow.open(map, marker);
	infowindow.setContent('<div style="padding:7px;font-size:12px;"><a href="https://map.kakao.com/link/to/' + place.id + '" target="__blank">' + kwd + '</a></div>');

	placeID = place.id;

	// 마커를 클릭했을때 장소id를 이용하여 해당 위치를 Kakao 지도로 크게 볼 수 있다
	kakao.maps.event.addListener(marker, 'click', function() {
		var url = "https://map.kakao.com/link/map/" + place.id;
		window.open(url, "__blank");
	});
}

// 크게보기 버튼을 클릭시 Kakao 지도로 크게 볼 수 있다
function goMap() {
	var map_url = "https://map.kakao.com/link/map/" + placeID;
	window.open(map_url, "__blank");
}
// 길찾기 버튼을 클릭시 Kakao 길찾기로 이동한다
function goTo() {
	var to_url = "https://map.kakao.com/link/to/" + placeID;
	window.open(to_url, "__blank");
}