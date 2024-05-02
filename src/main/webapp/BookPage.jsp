<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>BookPage</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
/* 전체페이지 스타일 */
body {
	overflow-x: hidden; /* 가로 스크롤 숨김 */
}

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

/* 지역, 영화사, 영화관리스트 */
.contentsContainer {
	position: relative;
	display: flex;
	flex-direction: row; /* 가로 방향으로 아이템을 배치합니다. */
	justify-content: space-between; /* 아이템을 양쪽 끝으로 정렬합니다. */
	align-items: center; /* 세로 방향으로 아이템을 가운데 정렬합니다. */
	width: 80%; /* 전체 너비의 80%를 차지합니다. */
	height: calc(80vh - 60px); /* 전체 높이의 80%를 차지하며, 상단바의 높이를 고려합니다. */
	margin-top: 60px; /* 상단바의 높이만큼 아래로 내립니다. */
	margin-bottom: 20px; /* 하단 여백을 추가합니다. */
	box-sizing: border-box;
}

.areaListContainer, .companyListContainer {
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

.theaterListContainer {
	height: 100%;
	width: 100%;
	background: #b0c4de;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 3%;
	border-radius: 2%;
	margin: 1% 1% 1% 1%;
}

.innerTheaterListContainer {
	height: 90%;
	width: 90%;
	background: #ffffff;
	display: flex;
	justify-content: center; /* 내부 내용을 가로로 가운데 정렬합니다. */
	align-items: center; /* 내부 내용을 세로로 가운데 정렬합니다. */
	padding: 3%;
	border-radius: 2%;
	margin: 1% 1% 1% 1%;
}

.innerAreaListContainer, .innerCompanyListContainer {
	height: 90%;
	width: 90%;
	background: #ffffff;
	display: flex;
	justify-content: center; /* 내부 내용을 가로로 가운데 정렬합니다. */
	align-items: center; /* 내부 내용을 세로로 가운데 정렬합니다. */
	padding: 3%;
	border-radius: 2%;
	margin: 1% 1% 1% 1%;
}

.cinemaListContainer {
	width: 600px;
	height: 600px;
	max-height: 100%;
	justify-content: center; /* 내부 내용을 가로로 가운데 정렬합니다. */
	align-items: center; /* 내부 내용을 세로로 가운데 정렬합니다. */
	overflow: auto; /* 내용이 넘칠 경우 스크롤을 표시합니다. */
	padding: 3%;
	border-radius: 2%;
	margin: 1% 1% 1% 1%;
	-ms-overflow-style: none; /* 인터넷 익스플로러 */
	scrollbar-width: none; /* 파이어폭스 */
}

.areaContainer, .companyContainer {
	width: 300px;
	height: 600px;
	max-height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center; /* 내부 내용을 가로로 가운데 정렬합니다. */
	align-items: center; /* 내부 내용을 세로로 가운데 정렬합니다. */
	padding: 3%;
	border-radius: 2%;
	margin: 1% 1% 1% 1%;
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

.areaBlock {
	width: 100%;
	height: 9%; /* 높이를 자동으로 조절합니다. */
	margin: 4%; /* 하단에 여백을 추가하여 블록들 사이의 간격을 조절합니다. */
	background: #ffffff;
	border-radius: 10px; /* 블록을 둥글게 만듭니다. */
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과를 추가합니다. */
	display: flex; /* 내부 요소를 행 또는 열로 배치하기 위해 Flexbox를 사용합니다. */
	flex-direction: column; /* 내부 요소를 세로로 배치합니다. */
	justify-content: center; /* 내부 내용을 수직 방향으로 가운데 정렬합니다. */
	align-items: center; /* 내부 내용을 수평 방향으로 가운데 정렬합니다. */
	text-align: center; /* 텍스트를 가운데 정렬합니다. */
	cursor: pointer;
}

.areaBlock p {
	margin: 5px 0; /* 단락들 간의 간격을 조절합니다. */
	font-size: 16px; /* 텍스트 크기를 조절합니다. */
	color: #333; /* 텍스트 색상을 설정합니다. */
}

.companyBlock {
	width: 100%;
	height: 9%; /* 높이를 자동으로 조절합니다. */
	margin: 4%; /* 하단에 여백을 추가하여 블록들 사이의 간격을 조절합니다. */
	background: #ffffff;
	border-radius: 10px; /* 블록을 둥글게 만듭니다. */
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과를 추가합니다. */
	display: flex; /* 내부 요소를 행 또는 열로 배치하기 위해 Flexbox를 사용합니다. */
	flex-direction: column; /* 내부 요소를 세로로 배치합니다. */
	justify-content: center; /* 내부 내용을 수직 방향으로 가운데 정렬합니다. */
	align-items: center; /* 내부 내용을 수평 방향으로 가운데 정렬합니다. */
	text-align: center; /* 텍스트를 가운데 정렬합니다. */
	cursor: pointer;
}

.companyBlock p {
	margin: 5px 0; /* 단락들 간의 간격을 조절합니다. */
	font-size: 16px; /* 텍스트 크기를 조절합니다. */
	color: #333; /* 텍스트 색상을 설정합니다. */
}
/* 클릭 시 배경색 변경 */
.areaContainer div:hover, .companyContainer div:hover {
	background-color: lightgray;
}
/* 선택된 요소 강조 */
.selected {
	background-color: lightblue;
}

.page1 {
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	background-color: rgba(255, 255, 255, 0.8);
	transform: translateX(0%);
}

.page2 {
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	background-color: rgba(255, 255, 255, 0.8);
	transform: translateX(100%);
	visibility: hidden;
}

.left-click-area, .right-click-area {
	position: absolute;
	top: 0;
	height: 100%;
	width: 10%;
	text-align: center;
	cursor: pointer;
	display: flex; /* 텍스트를 수평 및 수직 중앙으로 정렬하기 위해 Flexbox를 사용합니다. */
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
}

.left-click-area {
	left: -10%; /* 페이지 왼쪽에 배치 */
}

.right-click-area {
	right: -10%; /* 페이지 오른쪽에 배치 */
}

.hidden {
	/* blank */
	
}

.footer {
	width: 100%;
	background-color: #f3e9d2;
	color: #8b572a;
	text-align: center;
	padding: 20px 0;
	position: fixed; /* Fixed positioning */
	bottom: 0; /* Stick it to the bottom */
	left: 0;
	font-size: 16px;
	font-family: 'Cinzel', serif;
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
</style>
</head>

<body>
	<div class="header-container">
		<img src="Logo.png" alt="Logo" class="logo" />
		<a class="title" href="MainPage.jsp">cinematch</a>
		<div class="nav-links">
			<div class="navigation-item">
				<a href="MainPage.jsp">Home</a>
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
		<div class="left-click-area hidden" onclick="togglePages()" style="visibility: hidden; opacity: 0;">
			<!-- 클릭 이벤트 리스너 추가 -->
			<
		</div>
		<div class="page1">
			<!-- 지역 -->
			<div class="areaListContainer">
				<div class="innerAreaListContainer">
					<div class="areaContainer">
						<div class="areaBlock">서울</div>
						<div class="areaBlock">강원</div>
						<div class="areaBlock">대전</div>
						<div class="areaBlock">대구</div>
						<div class="areaBlock">부산</div>
						<div class="areaBlock">광주</div>
						<div class="areaBlock">제주</div>
					</div>
				</div>
			</div>
			<!-- 영화사 -->
			<div class="companyListContainer">
				<div class="innerCompanyListContainer">
					<div class="companyContainer">
						<div class="companyBlock">CGV</div>
						<div class="companyBlock">메가박스</div>
						<div class="companyBlock">롯데시네마</div>
						<div class="companyBlock">전체보기</div>
					</div>
				</div>
			</div>
		</div>
		<div class="page2">
			<!-- 영화관 리스트 -->
			<div class="theaterListContainer">
				<div class="innerTheaterListContainer">
					<div class="cinemaListContainer" id="cinemaListContainer">
						<!-- 여기에 영화관 블록이 추가됩니다. -->
					</div>
				</div>
			</div>
		</div>
		<div class="right-click-area hidden" onclick="togglePages()">
			<!-- 클릭 이벤트 리스너 추가 -->
			>
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
	// 지역 및 영화사 요소를 선택
	var areaItems = document.querySelectorAll('.areaContainer div');
	var companyItems = document.querySelectorAll('.companyContainer div');
	document.addEventListener('DOMContentLoaded', function() {
		// 지역 요소에 대한 클릭 이벤트를 추가
		areaItems.forEach(function(item) {
			item.addEventListener('click', function() {
				// 이전에 선택된 요소가 있다면 선택 해제
				var prevSelectedArea = document
						.querySelector('.areaContainer div.selected');
				if (prevSelectedArea) {
					prevSelectedArea.classList.remove('selected');
				}
				// 현재 클릭한 요소를 선택 상태로 변경
				this.classList.add('selected');
				// 선택된 지역과 영화사에 따라 영화관 리스트를 업데이트
				var selectedArea = document
						.querySelector('.areaContainer div.selected');
				var selectedCompany = document
						.querySelector('.companyContainer div.selected');
				if (selectedArea && selectedCompany) {
					createSelectedTheaterBlock(selectedArea.textContent,
							selectedCompany.textContent);
					togglePages();
				}
			});
		});
		// 영화사 요소에 대한 클릭 이벤트를 추가
		companyItems.forEach(function(item) {
			item.addEventListener('click', function() {
				// 이전에 선택된 요소가 있다면 선택 해제
				var prevSelectedCompany = document
						.querySelector('.companyContainer div.selected');
				if (prevSelectedCompany) {
					prevSelectedCompany.classList.remove('selected');
				}
				// 현재 클릭한 요소를 선택 상태로 변경
				this.classList.add('selected');
				// 선택된 지역과 영화사에 따라 영화관 리스트를 업데이트
				var selectedArea = document
						.querySelector('.areaContainer div.selected');
				var selectedCompany = document
						.querySelector('.companyContainer div.selected');
				if (selectedArea && selectedCompany) {
					createSelectedTheaterBlock(selectedArea.textContent,
							selectedCompany.textContent);
					togglePages();
				}
			});
		});
	});
	// 페이지 전환
	var page1 = document.querySelector('.page1');
	var page2 = document.querySelector('.page2');
	var leftClickArea = document.querySelector('.left-click-area');
	var rightClickArea = document.querySelector('.right-click-area');
	// 초기에는 page1만 표시
	page1.classList.remove('hidden'); // page1은 보이도록 설정
	page2.classList.add('hidden'); // page2는 숨김 처리
	// 페이지 전환 함수
	function togglePages() {
		if (page1.classList.contains('hidden')) {
			page2.classList.add('hidden');
			page2.style.transition = "transform 1s ease-in-out, opacity 1s ease-in-out, visibility 1s ease-in-out";
			page2.style.transform = 'translateX(100%)';
			page2.style.opacity = '0';
			page2.style.visibility = 'hidden';

			page1.classList.remove('hidden');
			page1.style.transition = "transform 1s ease-in-out, opacity 1s ease-in-out, visibility 1s ease-in-out";
			page1.style.transform = 'translateX(0)';
			page1.style.opacity = '1';
			page1.style.visibility = 'visible';
		} else {
			page1.classList.add('hidden');
			page1.style.transition = "transform 1s ease-in-out, opacity 1s ease-in-out, visibility 1s ease-in-out";
			page1.style.transform = 'translateX(-100%)';
			page1.style.opacity = '0';
			page1.style.visibility = 'hidden';

			page2.classList.remove('hidden');
			page2.style.transition = "transform 1s ease-in-out, opacity 1s ease-in-out, visibility 1s ease-in-out";
			page2.style.transform = 'translateX(0)';
			page2.style.opacity = '1';
			page2.style.visibility = 'visible';
		}
		if (leftClickArea.classList.contains('hidden')) {
			rightClickArea.classList.add('hidden');
			leftClickArea.classList.remove('hidden');
			// 좌측 clickarea를 활성화
			leftClickArea.style.transition = "opacity 2s, visibility 2s";
			leftClickArea.style.opacity = '1';
			leftClickArea.style.visibility = 'visible';
			leftClickArea.style.pointerEvents = 'auto';
			// 우측 clickarea를 비활성화
			rightClickArea.style.transition = "opacity 2s, visibility 2s";
			rightClickArea.style.opacity = '0';
			rightClickArea.style.visibility = 'hidden';
			rightClickArea.style.pointerEvents = 'none';
		} else {
			leftClickArea.classList.add('hidden');
			rightClickArea.classList.remove('hidden');
			// 우측 clickarea를 활성화
			rightClickArea.style.transition = "opacity 2s, visibility 2s";
			rightClickArea.style.opacity = '1';
			rightClickArea.style.visibility = 'visible';
			rightClickArea.style.pointerEvents = 'auto';

			// 좌측 clickarea를 비활성화
			leftClickArea.style.transition = "opacity 2s, visibility 2s";
			leftClickArea.style.opacity = '0';
			leftClickArea.style.visibility = 'hidden';
			leftClickArea.style.pointerEvents = 'none';
		}
	}
	// 조건에 맞는 영화관만 블록으로 추가하는 함수
	function createSelectedTheaterBlock(selectedArea, selectedCompany) {
		$.ajax({
			url : '/Theater', // 서블릿의 URL
			type : 'GET',
			dataType : 'json', // 반환되는 데이터 형식
			success : function(theaterList) {
				// 데이터를 성공적으로 가져온 경우 실행되는 함수
				var cinemaListContainer = document
						.getElementById("cinemaListContainer");
				cinemaListContainer.innerHTML = ''; // 초기화

				theaterList
						.forEach(function(theater) {
							if (selectedCompany === "전체보기"
									&& theater.address.includes(selectedArea)) {
								// 여기에서 영화관 정보를 HTML에 추가하는 함수 호출
								appendTheaterBlock(theater.address,
										theater.theaterName);
							} else {
								// select된 지역과 영화사의 정보에 따라 조건에 부합하는 theater만 처리
								if (theater.theaterName
										.includes(selectedCompany)
										&& theater.address
												.includes(selectedArea)) {
									// 여기에서 영화관 정보를 HTML에 추가하는 함수 호출
									appendTheaterBlock(theater.address,
											theater.theaterName);
								}
							}
						});
			},
			error : function(xhr, status, error) {
				// 데이터를 가져오는 데 실패한 경우 실행되는 함수
				console.error('서버로부터 theater 데이터를 가져오는 데 실패했습니다.');
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

		var cinemaListContainer = document
				.getElementById("cinemaListContainer");
		cinemaListContainer.appendChild(div);

		div.addEventListener('click', function() {
			gotoNext(theaterName);
		});
	}

	function gotoNext(theaterName) {
		// 현재 페이지 URL에서 쿼리 문자열 가져오기
		var queryString = window.location.search;
		// URLSearchParams 객체 생성
		var urlParams = new URLSearchParams(queryString);
		// movieName 매개변수 값 가져오기
		var title = urlParams.get('title');
		var url;
		// title이 존재하는지 확인하여 쿼리 문자열을 다르게 생성합니다.
		if (title) {
			url = "choice.jsp?theaterName=" + encodeURIComponent(theaterName)
					+ "&title=" + encodeURIComponent(title);
		} else {
			url = "frist-Just-reservation.jsp?theaterName="
					+ encodeURIComponent(theaterName);
		}
		// 생성한 URL로 페이지를 이동합니다.
		window.location.href = url;
	}
</script>
</html>
