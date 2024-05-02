<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
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
	background-image: url('bodybackground.png');
	background-size: cover;
	background-position: center;
}

/* 타이틀바 */
.titleContainer {
	height: 10vh;
	width: auto;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center; /* 가운데 정렬 */
	flex-direction: column; /* 세로 중앙 정렬을 위해 컨테이너의 방향을 세로로 변경 */
}

.titleP {
	display: flex;
	position: relative;
	width: 100%; /* 제목 요소의 너비 */
	height: 15%;
	text-align: center; /* 제목을 가운데 정렬 */
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
}

.movie-title {
	font-size: 30px; /* 원하는 크기로 설정하세요 */
}
/* 포스터 */
.contentsContainer {
	height: 80vh;
	width: 80vw;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: flex;
	align-items: center;
	justify-content: center; /* 가운데 정렬 */
	flex-direction: column; /* 세로 중앙 정렬을 위해 컨테이너의 방향을 세로로 변경 */
}

.posters {
	display: flex;
	justify-content: space-around;
	white-space: nowrap;
	overflow-x: hidden;
}

.posterBlock {
	position: relative;
	width: 350px; /* 절대 가로 크기 지정 */
	height: 600px; /* 절대 세로 크기 지정 */
	margin: 20px; /* 포스터 블록 간의 간격 조정 */
	border: 1px solid #ccc; /* 포스터 블록 테두리 */
	padding: 10px; /* 포스터 블록 내부 여백 */
	display: inline-block; /* 포스터 블록을 가로로 배열 */
	vertical-align: top; /* 포스터 블록을 위쪽 정렬 */
	box-sizing: border-box; /* 테두리와 여백을 포함한 크기 지정 */
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
	border-radius: 10px; /* 모서리를 둥글게 만듦 */
	transition: 1s ease;
	text-align: center;
	background-color: white;
}

.posterBlock:hover .poster {
	filter: brightness(0.6);
	/* Apply brightness filter only to the poster image */
}

.poster {
	display: flex;
	position: relative;
	width: 100%; /* 포스터 이미지의 너비 */
	height: 85%; /* 포스터 이미지의 높이 */
	object-fit: cover; /* 이미지가 잘리지 않고 화면에 꽉 차도록 */
}

.left-click-area, .right-click-area {
	position: absolute;
	top: 0;
	height: 100%;
	width: 10%;
	text-align: center;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	cursor: pointer;
	display: flex; /* 텍스트를 수평 및 수직 중앙으로 정렬하기 위해 Flexbox를 사용합니다. */
}

.left-click-area {
	left: -10%; /* 페이지 왼쪽에 배치 */
}

.right-click-area {
	right: -10%; /* 페이지 오른쪽에 배치 */
}

.hoverButtons {
	display: flex;
	position: absolute; /* 절대적 위치 지정 */
	top: 50%; /* 상위 요소의 중앙에 위치 */
	left: 50%; /* 상위 요소의 중앙에 위치 */
	z-index: 1; /* 다른 요소들 위에 표시 */
	transform: translate(-50%, -50%); /* 가운데 정렬 */
	flex-direction: column; /* 내부 요소들 세로로 배치 */
}

.btn1, .btn2 {
	position: relative; /* 절대적 위치 지정 */
	width: 100px;
	height: 60px;
	margin: 40px;
	background-color: white;
	border-radius: 5px;
	border: 1px solid #ccc;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	cursor: pointer;
}

.movie-title {
	font-family: 'Playfair Display', sans-serif;
	font-weight: bold;
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
			<a href="#support">고객센터</a>
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
	<!-- 영화 포스터 -->
	<div class="contentsContainer">
		<div class="titleContainer">
			<p class="movie-title">추천 영화</p>
		</div>
		<div class="posterContainer">
			<div class="left-click-area hidden" onclick="togglePages('left')" style="visibility: hidden;">
				<!-- 클릭 이벤트 리스너 추가 -->
				<
			</div>
			<div class="posters">
				<!-- 여기에 포스터 블록 추가됨 -->
			</div>
			<div class="right-click-area hidden" onclick="togglePages('right')">
				<!-- 클릭 이벤트 리스너 추가 -->
				>
			</div>
		</div>
	</div>
</body>
<script>
var movies = [
    "에이리언 4",
    "타이타닉",
    "이웃집 토토로",
    "촉산전",
    "엑스맨 2",
    // "주온",
    "캐리비안의 해적 : 블랙펄의 저주",
    "터미네이터 3",
    "패스트   퓨리어스 도쿄 드리프트",
    "해리 포터와 불의 잔",
    "데스노트",
    "다이하드 4.0 : 죽어도 산다",
    "아이언 맨",
    "다크 나이트",
    "아바타",
    "파라노말 액티비티",
    "레지던트 이블 4: 끝나지 않은 전쟁",
    "어메이징 스파이더맨",
    "미션 임파서블: 고스트 프로토콜",
    "헝거게임: 판엠의 불꽃",
    "어벤져스",
    "나우 유 씨 미 : 마술사기단",
    "겨울왕국",
    "인터스텔라",
    "킹스맨: 시크릿 에이전트",
    "존 윅",
    "이미테이션 게임",
    "매드 맥스: 분노의 도로",
    "빅쇼트",
    "라라랜드",
    "너의 이름은.",
    // "미녀와 야수",
    "위대한 쇼맨",
    "날씨의 아이",
    "탑건: 매버릭",
    "오펜하이머",
    "실미도",
    "타짜",
    "전우치",
    "포화 속으로",
    "부당거래",
    "고지전",
    "도둑들",
    "신세계",
    "명량",
    "베테랑",
    "내부자들",
    "부산행",
    "공조",
    "범죄도시",
    "극한직업",
    "서울의 봄"
];
var posters = document.querySelector('.posters');
var leftClickArea = document.querySelector('.left-click-area');
var rightClickArea = document.querySelector('.right-click-area');

var currentPage = 1; // 현재 페이지 번호
var itemsPerPage = 4; // 페이지당 포스터 수
var totalPages = Math.ceil(Object.keys(movies).length / itemsPerPage); // 전체 페이지 수
var isAnimating = false;

function togglePages(direction) {
    if (isAnimating) return; // 애니메이션이 진행 중이라면 함수를 더 이상 진행하지 않음

    isAnimating = true; // 애니메이션 시작

    if (direction === 'left' && currentPage > 1) {
        currentPage--;
    } else if (direction === 'right' && currentPage < totalPages) {
        currentPage++;
    }

    updateButtonsVisibility(); // 버튼의 가시성 업데이트
    renderPosters(); // 포스터 렌더링

    setTimeout(function() {
        isAnimating = false; // 1초 후 애니메이션 종료
    }, 1000); // 애니메이션 지속 시간과 일치해야 함
}
function updateButtonsVisibility() {
    leftClickArea.style.visibility = currentPage > 1 ? 'visible' : 'hidden';
    rightClickArea.style.visibility = currentPage < totalPages ? 'visible' : 'hidden';
}

function createPoster(title) {
    $.ajax({
            url: '/Movie?title=' + encodeURIComponent(title), // 서블릿의 URL
            type: 'GET',
            dataType: 'json', // 반환되는 데이터 형식
            success: function (data) {
                // 데이터를 성공적으로 가져온 경우 실행되는 함수
                var imageURL = data.imageURL;
                
                var posterBlock = document.createElement('div');
                posterBlock.classList.add('posterBlock');
                
                var poster = document.createElement('img');
                poster.src = imageURL;
                poster.classList.add('poster');
                

                var titleP = document.createElement('div');
                var innerP = document.createElement('p');
                innerP.textContent = title;
                titleP.classList.add('titleP');
                titleP.appendChild(innerP);

                posterBlock.appendChild(poster);
                posterBlock.appendChild(titleP);

                posterBlock.addEventListener('mouseenter', function () {
                    // 호버되었을 때 hoverButton을 생성하고 표시
                    var hoverButtons = createHoverButtons(title);
                    posterBlock.appendChild(hoverButtons);
                    posterBlock.classList.add('hovered');
                });
                posterBlock.addEventListener('mouseleave', function () {
                    // 호버가 해제되면 hoverButton을 제거
                    var hoverButtons = posterBlock.querySelector('.hoverButtons');
                    if (hoverButtons) {
                        posterBlock.removeChild(hoverButtons);
                    }
                    posterBlock.classList.remove('hovered');    
                });
                
                posters.appendChild(posterBlock);
            },
            error: function (xhr, status, error) {
                // 데이터를 가져오는 데 실패한 경우 실행되는 함수
                console.error('서버로부터 theater 데이터를 가져오는 데 실패했습니다.');
            }
        });
}
function renderPosters(direction) {
    var activePosters = document.querySelectorAll('.posterBlock');
    // 이전 포스터 direction방향으로 이동시킴(left = -100X , right = +100X)
    for (var i = 0; i < activePosters.length; i++) {
    activePosters[i].style.transition = "transform 1s ease-in-out, opacity 1s ease-in-out, visibility 1s ease-in-out";
    activePosters[i].style.opacity = '0';
    // activePosters[i].style.visibility = 'hidden';
        if (direction === 'left') {
            activePosters[i].style.transform = 'translateX(100%)';
        }
        else if (direction === 'right') {
            activePosters[i].style.transform = 'translateX(-100%)';
        }
    }
    // 1초 대기 후 포스터 제거
    setTimeout(function() {
        for (var i = 0; i < activePosters.length; i++) {
            activePosters[i].remove();
        }
        var start = (currentPage - 1) * itemsPerPage;
        var end = start + itemsPerPage;
        for (var i = start; i < end; i++) {
            if (i < movies.length) {
                createPoster(movies[i]);
            }
        }
    }, 1000);
}
function createHoverButtons(title) {
    var hoverButtons = document.createElement('div');
    hoverButtons.classList.add('hoverButtons');

    // 첫 번째 버튼 추가
    var button1 = document.createElement('div');
    button1.classList.add('btn1');

    var innerP1 = document.createElement('p');
    innerP1.textContent = '상세정보';
    button1.appendChild(innerP1);

    button1.addEventListener('click', function () {
        gotoInfo(title);
    });
    hoverButtons.appendChild(button1);
    
    // 두 번째 버튼 추가
    var button2 = document.createElement('div');
    button2.classList.add('btn2');

    var innerP2 = document.createElement('p');
    innerP2.textContent = '예매하기';
    button2.appendChild(innerP2);

    button2.addEventListener('click', function () {
        gotoNext(title);
    });
    hoverButtons.appendChild(button2);

    return hoverButtons;
}
function gotoNext(title) {
    // 현재 페이지 URL에서 쿼리 문자열 가져오기
    var queryString = window.location.search;
    // URLSearchParams 객체 생성
    var urlParams = new URLSearchParams(queryString);
    // movieName 매개변수 값 가져오기
    var theaterName = urlParams.get('theaterName');
    var url = "choice.jsp?theaterName=" + encodeURIComponent(theaterName) + "&title=" + encodeURIComponent(title);
    // 생성한 URL로 페이지를 이동합니다.
    window.location.href = url;
}
function gotoInfo(title) {
    // 현재 페이지 URL에서 쿼리 문자열 가져오기
    var queryString = window.location.search;
    // URLSearchParams 객체 생성
    var urlParams = new URLSearchParams(queryString);
    // movieName 매개변수 값 가져오기
    var theaterName = urlParams.get('theaterName');
    var url = "mvPage1.jsp?theaterName=" + encodeURIComponent(theaterName) + "&title=" + encodeURIComponent(title);
    // 생성한 URL로 페이지를 이동합니다.
    window.location.href = url;
}
function startSetting() {
    var start = (currentPage - 1) * itemsPerPage;
    var end = start + itemsPerPage;
    var shuffledMovies = shuffleArray(movies);
    movies = shuffledMovies;
    for (var i = start; i < end; i++) {
        if (i < movies.length) {
            createPoster(movies[i]);
        }
    }
}
// Fisher-Yates 셔플 알고리즘 함수 정의
function shuffleArray(array) {
    for (var i = array.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
    return array;
}
startSetting();
</script>
</html>
