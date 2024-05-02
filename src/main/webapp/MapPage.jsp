<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>MapPage</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05d3752be0980b9d717d40c6f48967da&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>

<style>
/* 전체페이지 스타일 */
.page-container {
	height: 80vh;
	width: 80vw;
	display: flex;
	flex-direction: column; /* 세로로 아이템을 배열합니다. */
	align-items: center; /* 가운데 정렬을 위해 추가합니다. */
}
/* 상단바 */
body {
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	height: 100%;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

/* 맵,영화관리스트 */
.contentsContainer {
	display: flex;
	flex-direction: row; /* 가로 방향으로 아이템을 배치합니다. */
	justify-content: center; /* 아이템을 양쪽 끝으로 정렬합니다. */
	align-items: center; /* 세로 방향으로 아이템을 가운데 정렬합니다. */
	width: 100%; /* 전체 너비의 80%를 차지합니다. */
	height: 80%; /* 전체 높이의 80%를 차지합니다. */
	margin: 1% auto; /* 수평 가운데 정렬을 적용합니다. */
	box-sizing: border-box;
	margin-top: 80px; /* 상단바의 높이만큼 아래로 내립니다. */
}

.mapContainer, .theaterListContainer {
	height: 100%;
	width: 50%;
	background: #b0c4de;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 3%;
	border-radius: 2%;
	margin: 1% 1% 1% 1%;
}

.innerMapContainer, .innerTheaterListContainer {
	height: 100%;
	width: 100%;
	background: #ffffff;
	display: flex;
	justify-content: center; /* 내부 내용을 가로로 가운데 정렬합니다. */
	align-items: center; /* 내부 내용을 세로로 가운데 정렬합니다. */
	overflow: auto; /* 내용이 넘칠 경우 스크롤을 표시합니다. */
	padding: 3%;
	border-radius: 2%;
}

.kakaoMapContainer, .cinemaListContainer {
	width: 600px;
	height: 600px;
}

.cinemaBlock {
	height: auto; /* 높이를 자동으로 조절합니다. */
	padding: 20px; /* 내부 여백을 추가합니다. */
	margin-bottom: 20px; /* 하단에 여백을 추가하여 블록들 사이의 간격을 조절합니다. */
	background: #86d8e5;
	border-radius: 10px; /* 블록을 둥글게 만듭니다. */
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과를 추가합니다. */
	display: flex; /* 내부 요소를 행 또는 열로 배치하기 위해 Flexbox를 사용합니다. */
	flex-direction: column; /* 내부 요소를 세로로 배치합니다. */
	justify-content: center; /* 내부 내용을 수직 방향으로 가운데 정렬합니다. */
	align-items: center; /* 내부 내용을 수평 방향으로 가운데 정렬합니다. */
	text-align: center; /* 텍스트를 가운데 정렬합니다. */
	cursor: pointer;
}

.cinemaBlock p {
	margin: 5px 0; /* 단락들 간의 간격을 조절합니다. */
	font-size: 16px; /* 텍스트 크기를 조절합니다. */
	color: #333; /* 텍스트 색상을 설정합니다. */
}

.footer {
	width: 100%;
	background-color: #f3e9d2;
	color: #8b572a;
	text-align: center;
	padding: 20px 0;
	position: relative;
	bottom: 0;
	left: 0;
	font-size: 16px;
	font-family: 'Playfair Display', sans-serif;
	font-weight: bold;
	box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1);
}

.footer-content {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 40px;
}

.footer-content a, .footer-content p {
	color: inherit;
	text-decoration: none;
	padding: 5px;
	display: inline-block;
	transition: all 0.3s ease;
}

.footer-content a:hover, .footer-content p:hover {
	background-color: #e7d7c1;
	border-radius: 5px;
	color: #805b36;
}

@media ( max-width : 768px) {
	.footer-content {
		flex-direction: column;
		gap: 10px;
	}
}
</style>

<body>
	<div class="header-container">
		<img src="Logo.png" alt="Logo" class="logo" />
		<a class="title" href="MainPage.jsp">cinematch</a>
		<div class="nav-links">
			<div class="navigation-item">
				<a href="MainPage.jsp">Home</a>
			</div>
		</div>
		<div class="navigation-item">
			<a href="Moive-reservation-Main.jsp" class="Reservation">예매</a>
		</div>
		<div class="navigation-item">
			<a href="mvPage2.jsp">영화</a>
		</div>
		<div class="navigation-item">
			<a href="MyPage.jsp" class="Mypage">MyPage</a>
		</div>
		<div class="navigation-item">
			<a href="board.jsp" class="board">고객센터</a>
		</div>
	</div>
	<div class="auth-container">
		<div class="auth-links">
			<span> <%
 String userID = (session != null) ? (String) session.getAttribute("authID") : null;
 if (userID != null) {
 %> <%=userID%></span> /
			<a href="Logout.jsp">Logout</a>
			<%
			} else {
			%>
			<a href="Login.jsp">Login</a>
			/
			<a href="SignUp.jsp">Sing Up</a>
			<%
			}
			%>
		</div>
	</div>
	</div>
	<div class="contentsContainer">
		<!-- 지도맵 -->
		<div class="mapContainer">
			<div class="innerMapContainer">
				<div id="map" class="kakaoMapContainer"></div>
			</div>
		</div>
		<!-- 영화관 리스트 -->
		<div class="theaterListContainer">
			<div class="innerTheaterListContainer">
				<div class="cinemaListContainer" id="cinemaListContainer">
					<!-- 영화관 리스트 생성함수 작동 -->
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="footer">
		<div class="footer-content">
			<a href="https://github.com/RESET-LJW/movieProject" target="_blank">
				<i class="fab fa-github"></i>GitHub
			</a>
			<p>
				<i class="fas fa-envelope"></i> 문의 이메일 : example@email.com
			</p>
			<p>
				<i class="fas fa-phone"></i> 문의 번호 : 02-1234-5678
			</p>
		</div>
	</div>
</body>

<script>
    // 동작정리
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	// 지도 생성
	var map = new kakao.maps.Map(mapContainer, mapOption);
	// 영화관 마커들 띄우기
	displayTheater();
	// 현재 위치 찾기
	findPosition();
    // 함수 정리
	var baseMarker = null; // 기준 마커 변수 선언
	var addressMarkers = []; // 주소 마커 배열 선언
	// HTML5의 geolocation으로 현재위치 탐색
	function findPosition() {
		if (navigator.geolocation) {
			navigator.geolocation
					.getCurrentPosition(function(position) {
						var lat = position.coords.latitude, // 위도
						    lon = position.coords.longitude; // 경도
						var locPosition = new kakao.maps.LatLng(lat, lon), message = '<div style="padding:10px;">현재 위치</div>';
						displayLocPositionMarker(locPosition, message);
					});
		} else { // HTML5의 GeoLocation을 사용할 수 없을때
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = '위치정보를 찾을 수 없습니다.'
			displayLocPositionMarker(locPosition, message);
		}
	}
	// 영화관 마커를 전부 표시하는 메소드
	function displayTheater() {
		$.ajax({
			url : '/Theater', // 서블릿의 URL
			type : 'GET',
			dataType : 'json', // 반환되는 데이터 형식
			success : function(theaterList) {
				// 데이터를 성공적으로 가져온 경우 실행되는 함수
				theaterList.forEach(function(theater) {
					// 여기에서 영화관 마커를 생성하고 표시하는 코드를 작성
					displayAddressMarker(theater.address, theater.theaterName);
				});
			},
			error : function(xhr, status, error) {
				// 데이터를 가져오는 데 실패한 경우 실행되는 함수
				console.error('서버로부터 theater 데이터를 가져오는 데 실패했습니다.');
			}
		});
	}
	// 지도에 마커와 인포윈도우를 표시하는 함수
	function displayLocPositionMarker(locPosition, message) {
		// 마커를 생성
		baseMarker = new kakao.maps.Marker({
			map : map,
			position : locPosition
		});
		var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;
		// 인포윈도우를 생성
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});
		// 인포윈도우를 마커위에 표시 
		infowindow.open(map, baseMarker);
		// 지도 중심좌표를 접속위치로 변경
		map.setCenter(locPosition);
	}
	// 지도에 주소기반 마커를 표시하는 함수
	function displayAddressMarker(address, theaterName) {
        // 주소-좌표 변환 객체를 생성
        var geocoder = new kakao.maps.services.Geocoder();
        // 주소로 좌표를 검색
        geocoder.addressSearch(address, function(result, status) {
            // 정상적으로 검색을 완료한 경우
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var imageSrc = 'https://cdn.icon-icons.com/icons2/317/PNG/512/map-marker-icon_34392.png'; // 마커이미지의 주소
                var imageSize = new kakao.maps.Size(48, 48); // 마커이미지의 크기
                var imageOption = {
                    offset: new kakao.maps.Point(24, 24)
                }; // 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정

                // 마커의 이미지정보를 가지고 있는 마커이미지를 생성
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
                // 결과값으로 받은 위치를 마커로 표시
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords,
                    // 마커이미지 설정 
                    image: markerImage,
                    // 좌표값 추가
                    lat: result[0].y,
                    lon: result[0].x
                });
				addressMarkers.push({ address: address, marker: marker });
                // 인포윈도우로 장소에 대한 설명을 표시
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:5px 0;">' + theaterName + '</div>'
                });
                // 마커에 마우스오버 이벤트를 등록
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시
                    infowindow.open(map, marker);
                });
                // 마커에 마우스아웃 이벤트를 등록
                kakao.maps.event.addListener(marker, 'mouseout', function() {
					// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거
                    infowindow.close();
                });

				appendTheaterBlock(address, theaterName);
            }
        });
    }
	// 영화관 정보를 HTML에 추가하는 함수
	function appendTheaterBlock(theaterAddress, theaterName) {
		// 새로운 div 요소 생성
		var div = document.createElement('div');
		div.classList.add('cinemaBlock');

		// 영화관 정보를 p 요소에 추가하여 div에 삽입
		var theaterNameParagraph = document.createElement('p');
		theaterNameParagraph.textContent = theaterName;
		div.appendChild(theaterNameParagraph);

		var addressParagraph = document.createElement('p');
		addressParagraph.textContent = theaterAddress;
		div.appendChild(addressParagraph);

		// 거리를 표시할 요소를 생성하고 초기화
		var distanceParagraph = document.createElement('p');
		div.appendChild(distanceParagraph); // 거리 요소를 먼저 추가

		div.addEventListener('click', function() {
            gotoNext(theaterName);
        });

		// theater의 주소로 마커를 찾기
		var theaterMarker = findMarkerByAddress(theaterAddress);
		if (theaterMarker) {
			var distance = calculateDistance(baseMarker, theaterMarker.marker);
			// 거리가 1km 이상인 경우
			if (distance >= 1) {
				distanceParagraph.textContent = distance.toFixed(2) + ' km'; // 소수점 2자리까지 표시
			} else {
				// 거리가 1km 미만인 경우
				var distanceInMeter = (distance * 1000).toFixed(); // 미터 단위로 변환하여 소수점 없이 표시
				distanceParagraph.textContent = distanceInMeter + ' m';
			}

			// 거리를 기준으로 정렬하여 삽입
			var distance = calculateDistance(baseMarker, theaterMarker.marker);
			// 거리가 10km 이상인 경우는 블록을 추가하지 않음
			if (distance <= 10) {
				var inserted = false; // 삽입 여부를 추적하는 변수 초기화
				var cinemaListContainer = document.getElementById("cinemaListContainer");
				var blocks = cinemaListContainer.getElementsByClassName('cinemaBlock');
				for (var i = 0; i < blocks.length; i++) {
					var currentBlockDistance = calculateDistance(baseMarker, findMarkerByAddress(blocks[i].getElementsByTagName('p')[1].textContent).marker);
					if (distance < currentBlockDistance) {
						cinemaListContainer.insertBefore(div, blocks[i]);
						inserted = true;
						break;
					}
				}
				if (!inserted) {
					cinemaListContainer.appendChild(div);
				}
			}
		} else {
			distanceParagraph.textContent = 'Unknown distance';
			var cinemaListContainer = document.getElementById("cinemaListContainer");
			cinemaListContainer.appendChild(div);
		}
	}
	// addressMarkers 배열에서 주소에 해당하는 마커를 찾는 함수
	function findMarkerByAddress(address) {
		console.log(address);
		for (var i = 0; i < addressMarkers.length; i++) {
			console.log(addressMarkers[i]);
			if (addressMarkers[i].address === address) {
				return addressMarkers[i];
			}
		}
		return null; // 주소에 해당하는 마커를 찾지 못한 경우
	}
    // 두 마커 간의 거리를 계산하는 함수 (단위: km)
    function calculateDistance(marker1, marker2) {
		if (!marker1 || !marker2) {
			console.error('Markers not provided');
			return;
		}
		var lat1 = marker1.getPosition().getLat(); // 마커1의 위도
		var lon1 = marker1.getPosition().getLng(); // 마커1의 경도
		var lat2 = marker2.getPosition().getLat(); // 마커2의 위도
		var lon2 = marker2.getPosition().getLng(); // 마커2의 경도
        
        var R = 6371; // 지구의 반지름 (단위: km)
        var dLat = deg2rad(lat2 - lat1);
        var dLon = deg2rad(lon2 - lon1); 
        var a = 
		Math.sin(dLat / 2) * Math.sin(dLat / 2) +
		Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
		Math.sin(dLon / 2) * Math.sin(dLon / 2); 
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)); 
        var distance = R * c; // 거리 (단위: km)
        return distance;
    }
    // 각도를 라디안으로 변환하는 함수
    function deg2rad(deg) {
        return deg * (Math.PI / 180);
    }
	
    function gotoNext(theaterName) {
        // 현재 페이지 URL에서 쿼리 문자열 가져오기
        var queryString = window.location.search;
        // URLSearchParams 객체 생성
        var urlParams = new URLSearchParams(queryString);
        // movieName 매개변수 값 가져오기
        var title = urlParams.get('title');
        var url;
        // movieName이 존재하는지 확인하여 쿼리 문자열을 다르게 생성합니다.
        if (title) {
            url = "one-movie-select-time-page.jsp?theaterName=" + encodeURIComponent(theaterName) + "&title=" + encodeURIComponent(title);
        } else {
            url = "QuickReservation.jsp?theaterName=" + encodeURIComponent(theaterName);
        }
        // 생성한 URL로 페이지를 이동합니다.
        window.location.href = url;
    }
</script>

</html>