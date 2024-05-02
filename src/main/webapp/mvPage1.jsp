<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="true"%>
<html lang="ko">

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap"
	rel="stylesheet">>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Movie List Page</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

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

 

.main-content {
	width: 100%;
	height: 600px;
	display: flex;
	align-items: flex-start;
	justify-content: center;
	gap: 50px;
	padding: 20px;
}

.main-content .movie-poster {
	background-color: rgba(217, 217, 217, 0.5);
	width: 400px; /* 포스터 너비를 증가 */
	height: 600px; /* 포스터 높이를 증가 */
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 10px;
}

.main-content .movie-details {
	max-width: 600px;
	max-height: 600px;
}

.main-content .movie-details p {
	max-height: 4%;
	margin-bottom: 3%;
}

.main-content .movie-details h1 {
	margin-bottom: 5%;
	height: 8%;
	color: #252b42;
	font-size: 2em;
	display: inline;
}

.main-content .movie-details button {
	height: auto;
	display: flex;
	background-color: #23A6F0;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1em;
}

.synopsis {
	/* max-height: 430px; 예시 값입니다. 실제 레이아웃에 맞게 조정해야 할 수 있습니다. */
	flex: 1;
}

.synopsis-title {
	height: 10%;
	font-size: 24px;
	font-weight: bold;
	color: #252b42;
	margin-bottom: 5%;
}

.synopsis-content {
	max-height: 360px; /* 적절한 높이로 조정하세요 */
	overflow-y: auto; /* 내용이 최대 높이를 초과할 경우 스크롤 생성 */
	padding-right: 10px; /* 스크롤바와 내용 사이의 간격을 위해 */
	color: #737373;
}

/* 아래의 모든 코드는 영역::코드로 사용 */
.synopsis-content::-webkit-scrollbar {
	width: 10px; /* 스크롤바의 너비 */
}

.synopsis-content::-webkit-scrollbar-thumb {
	height: 30%; /* 스크롤바의 길이 */
	background: #00000096; /* 스크롤바의 색상 */
	border-radius: 10px;
}

.synopsis-content::-webkit-scrollbar-track {
	background: rgb(255, 255, 255); /*스크롤바 뒷 배경 색상*/
}

.synopsis-section {
	background-color: #fff;
	padding: 20px;
	width: 100%;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
}

.additional-posters {
	display: flex;
	gap: 20px;
	flex: 1;
	justify-content: space-between;
}

.additional-poster {
	flex-basis: calc(50% - 10px);
	height: 300px;
	background-color: rgba(217, 217, 217, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
}

.additional-poster span {
	color: #252b42;
	font-weight: bold;
}

.movie-gallery {
	position: relative;
	padding: 40px 0;
}

.gallery-title {
	text-align: center;
	font-size: 24px;
	color: #252b42;
	margin-bottom: 20px;
}

.movie-posters {
	display: flex;
	justify-content: center;
	gap: 30px;
}

.movie-poster {
	width: 400px; /* 포스터 너비를 증가 */
	height: 600px; /* 포스터 높이를 증가 */
	background-color: rgba(217, 217, 217, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
	transition: transform 0.2s ease; /* 부드러운 변환 효과 */
	cursor: pointer; /* 포인터 모양 변경 */
}

.main-content .movie-poster img {
	cursor: default; /* 기본 마우스 포인터로 설정 */
}

.arrow-buttons-container {
	position: absolute;
	bottom: 20px; /* 화면 아래에서 20px 떨어진 위치 */
	left: 50%; /* 왼쪽을 기준으로 가운데 정렬 */
	transform: translateX(-50%); /* 수평 방향으로 -50%만큼 이동하여 가운데 정렬 */
	display: flex;
}

.main-content .movie-poster img:hover {
	transform: none; /* 이전에 설정된 확대 효과 제거 */
}

.movie-gallery .movie-poster:hover img {
	transform: scale(1.05); /* 마우스 호버 시 이미지 확대 */
}

.arrow-button {
	background-color: #ffffff;
	color: rgb(0, 0, 0);
	border: none;
	padding: 20px 40px; /* 버튼 패딩을 증가 */
	height: 700px; /* 컨테이너 높이에 맞춤 */
	font-size: 48px; /* 화살표 아이콘 크기를 증가 */
	margin: 0 20px; /* 화살표 버튼의 좌우 마진을 추가하여 간격을 조정합니다. */
	cursor: pointer;
}

/* .movie-gallery 클래스의 CSS를 조정합니다. */
.movie-gallery {
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 40px 0;
}

.search-button, .cart-button {
	cursor: pointer;
	margin-left: 20px;
	border: none; /* 테두리 없음 */
}

.movie-poster img {
	width: 100%; /* 컨테이너 너비에 맞춤 */
	height: 100%; /* 컨테이너 높이에 맞춤 */
	object-fit: cover; /* 이미지 비율을 유지하면서 컨테이너를 가득 채움 */
	border-radius: 10px; /* 포스터의 모서리를 둥글게 */
}

.titleBar {
	display: flex;
	width: 100%;
	height: auto;
	align-items: center;
	flex-direction: row;
	justify-content: space-between;
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
				<a href="Movie-reservation-Main.jsp">예매</a>
			</div>
			<div class="navigation-item">
				<a href="mvPage2.jsp">영화</a>
			</div>
			<div class="navigation-item">
				<a href="MyPage.jsp" class="Mypage">MyPage</a>
			</div>
			<div class="navigation-item">
				<a href="board.jsp">고객센터</a>
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
	<div class="main-content">
		<div class="movie-poster">영화 포스터</div>
		<div class="movie-details">
			<div class="titleBar">
				<h1 id="movie-title">영화 제목</h1>
				<button id="bookButton">예매 하기</button>
			</div>
			<p id="movie-info1">감독 | 상영시간</p>
			<p id="movie-info2">관람등급 | 장르</p>
			<div class="synopsis">
				<div class="synopsis-title">줄거리</div>
				<div class="synopsis-content" id="movie-synopsis">여기에 영화 줄거리를
					입력하세요.</div>
			</div>
		</div>
	</div>
	<div class="synopsis-section">
		<!--  -->
	</div>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="movie-gallery">
				<!-- 왼쪽 화살표 버튼 -->
				<button class="arrow-button prev-button">&#60;</button>

				<!-- 영화 포스터 목록 -->
				<div class="movie-posters">
					<!-- JavaScript로 동적으로 생성될 부분 -->
				</div>


				<!-- 오른쪽 화살표 버튼 -->
				<button class="arrow-button next-button">&#62;</button>
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
	<script>


  



let currentPage = 0; // 현재 페이지
const postersPerPage = 3; // 페이지당 포스터 개수


const numberOfPosters = 52;
// 초기 포스터 세트를 표시

// 이전 버튼 클릭 이벤트
document.querySelector('.prev-button').addEventListener('click', () => {
    if (currentPage > 0) {
        currentPage -= 1;
        updatePosters(currentPage);
        updateArrowButtons(); // 화살표 버튼 상태 업데이트
    }
});

// 다음 버튼 클릭 이벤트
document.querySelector('.next-button').addEventListener('click', () => {
    const totalPages = Math.ceil(numberOfPosters / postersPerPage);
    if (currentPage < totalPages - 1) {
        currentPage += 1;
        updatePosters(currentPage);
        updateArrowButtons(); // 화살표 버튼 상태 업데이트
    }
});
function updatePosters(currentPage) {
    // 모든 포스터를 숨김
    const allPosters = document.querySelectorAll('.movie-gallery .movie-poster');
    allPosters.forEach(poster => poster.style.display = 'none');

    // 현재 페이지에 해당하는 포스터들을 표시
    const startIndex = currentPage * postersPerPage;
    const endIndex = Math.min(startIndex + postersPerPage, numberOfPosters);
    for (let i = startIndex; i < endIndex; i++) {
        allPosters[i].style.display = 'flex';

    }
}

function updateArrowButtons() {
    const totalPages = Math.ceil(numberOfPosters / postersPerPage);
    // 왼쪽 화살표 버튼
    const prevButton = document.querySelector('.prev-button');
    // 오른쪽 화살표 버튼
    const nextButton = document.querySelector('.next-button');

    // 현재 페이지가 첫 페이지인 경우, 왼쪽 화살표를 숨깁니다.
    if (currentPage === 0) {
        prevButton.style.visibility = 'hidden';
    } else {
        prevButton.style.visibility = 'visible';
    }

    // 현재 페이지가 마지막 페이지인 경우, 오른쪽 화살표를 숨깁니다.
    if (currentPage >= totalPages - 1) {
        nextButton.style.visibility = 'hidden';
    } else {
        nextButton.style.visibility = 'visible';
    }
}

document.addEventListener('DOMContentLoaded', () => {
    updateArrowButtons();
});

// URL에서 'title' 파라미터 값을 가져오는 함수
function getMovieTitle() {
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var title = urlParams.get('title');
    return title ? decodeURIComponent(title) : null;
}

// 서버로부터 영화 상세 정보를 불러와 페이지에 표시하는 함수
function fetchMovieDetails(title) {
    // 백엔드 엔드포인트와 영화 제목을 사용하여 상세 정보를 요청합니다.
    // 이 URL은 백엔드 API에 따라 변경될 수 있습니다.
    fetch(`/Movie?title=${encodeURIComponent(title)}`)
        .then(response => response.json())
        .then(data => {
        var titleBox = document.querySelector("#movie-title");
            if(data.title.length > 15) {
                titleBox.style.fontSize = '1.5em';
            } else {
                titleBox.style.fontSize = '2em';
            }
            document.getElementById('movie-title').textContent = data.title;
            document.getElementById('movie-info1').textContent = `감독: ${data.director} | 상영시간: ${data.runtime}분`;
            document.getElementById('movie-info2').textContent = `${data.rating} | ${data.genre}`;
            document.querySelector('.main-content .movie-poster').innerHTML = `<img src="${data.imageURL}" alt="${data.title} Poster">`;
            document.getElementById('movie-synopsis').textContent = data.story;
            // 이미지 URL이 제공된 경우 이미지를 설정합니다.
            // if(data.imageURL) {
            //     document.querySelector('.movie-poster img').src = data.imageURL;
            //     document.querySelector('.movie-poster img').alt = data.title;
            // }
        })
        .catch(error => console.error('Error fetching movie details:', error));
}

// 페이지 로딩 시 영화 제목을 추출하고 상세 정보를 불러오는 함수를 호출합니다.
document.addEventListener('DOMContentLoaded', () => {
    var title = getMovieTitle();
    if(title) {
        fetchMovieDetails(title);
    }
});


function fetchAndDisplayMovies(titles) {
    const postersContainer = document.querySelector('.movie-posters');
    postersContainer.innerHTML = ''; // 기존 포스터를 지웁니다.

    titles.forEach(title => {
        fetch(`/Movie?title=${encodeURIComponent(title)}`) // 영화 제목을 쿼리 파라미터로
            .then(response => response.json())
            .then(movie => {
                // 영화 포스터 추가
                const posterElement = document.createElement('div');
                posterElement.className = 'movie-poster';
                posterElement.innerHTML = `<img src="${movie.imageURL}" alt="영화 포스터 ${title}">`;
                postersContainer.appendChild(posterElement);

                // 바로 이 포스터에 클릭 이벤트 리스너를 추가합니다.
                posterElement.addEventListener('click', () => {
                    // 클릭 이벤트 리스너는 현재 영화의 상세 정보를 사용할 수 있습니다.
                    updateMainContent(movie);
                
                });
            }).then(() => {
                updatePosters(currentPage);
            })
            .catch(error => console.error('영화를 가져오는 데 실패했습니다:', error));
    });
}

function updateMainContent(movie) {
    var titleBox = document.querySelector("#movie-title");
    if(movie.title.length > 15) {
        titleBox.style.fontSize = '1.5em';
    } else {
        titleBox.style.fontSize = '2em';
    }
    document.getElementById('movie-title').textContent = movie.title;
    document.getElementById('movie-info1').textContent = `감독 : ${movie.director} | 상영시간 : ${movie.runtime}분`;
    document.getElementById('movie-info2').textContent = `연령 :  ${movie.rating} | ${movie.genre}`;
    document.querySelector('.main-content .movie-poster').innerHTML = `<img src="${movie.imageURL}" alt="${movie.title} Poster">`;
     document.getElementById('movie-synopsis').textContent = movie.story;

     const newUrl = `${window.location.pathname}?title=${encodeURIComponent(movie.title)}`;
    history.pushState({ path: newUrl }, '', newUrl);
}


var originalMovieTitles = [
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

    var movieTitles = shuffleArray(originalMovieTitles);


// 페이지가 로드될 때 함수를 호출합니다
document.addEventListener('DOMContentLoaded', () => {
    fetchAndDisplayMovies(movieTitles)})

    

    document.addEventListener('DOMContentLoaded', () => {
    var title = getMovieTitle(); // URL에서 영화 제목 가져오기

    // 영화 제목이 movieTitles 배열에 있는지 확인
    if (title && !movieTitles.includes(title) || !title || title.trim() === '' || !movieTitles.includes(title)) {
        // 영화 제목이 배열에 없으면 경고 메시지를 표시하고 리다이렉트
        alert('영화를 찾을 수 없습니다.');
        window.location.href = 'http://localhost:8080/mvPage2.jsp'; // 영화 리스트 페이지 URL로 변경해주세요.
    } else if (title) {
        // 영화 제목이 배열에 있으면, 영화 상세 정보를 불러와서 표시
        fetchMovieDetails(title);
    }

    // 페이지 로드 시 영화 목록을 표시하는 기존의 로직을 유지
    fetchAndDisplayMovies(movieTitles);
});



 



// 예매 페이지로 이동하는 함수
function gotoNext(title) {
    // 현재 페이지 URL에서 쿼리 문자열 가져오기
    var queryString = window.location.search;
    // URLSearchParams 객체 생성
    var urlParams = new URLSearchParams(queryString);
    // movieName 매개변수 값 가져오기
    var theaterName = urlParams.get('theaterName');
    var url;
    if(theaterName) {
        url = "one-movie-select-time-page.jsp?theaterName=" + theaterName + "&title=" + encodeURIComponent(title);
    } else {
        url = "Movie-reservation-Main.jsp?title=" + encodeURIComponent(title);
    }
    // 예매 페이지 URL 구성
    window.location.href = url;
}

var bookButton = document.getElementById('bookButton');
if (bookButton) {
    bookButton.addEventListener('click', function() {
        // 현재 URL에서 영화 제목을 다시 가져옵니다.
        var title = getMovieTitle(); // 이 함수는 URL에서 'title' 쿼리 파라미터의 값을 가져옵니다.
        if (title) {
            gotoNext(title);
        }
    });
}



// // 예매 버튼 클릭 시 실행되는 함수
// function onBookButtonClick() {
//     // 서버에 로그인 상태를 확인하는 요청을 보냅니다.
//     fetch('/checkLoginStatus')
//         .then(response => response.json())
//         .then(data => {
//             if (data.loggedIn) {
//                 // 로그인이 확인되면 예매 페이지로 리다이렉트합니다.
//                 const title = getMovieTitle();
//                 if (title) {
//                     window.location.href = `/Movie-reservation-Main.jsp?title=${encodeURIComponent(title)}`;
//                 }
//             } else {
//                 // 로그인이 되어 있지 않다면 로그인 페이지로 유도합니다.
//                 alert('로그인이 필요합니다.');
//                 window.location.href = '/loginPage.jsp'; // 로그인 페이지의 URL로 변경해야 합니다.
//             }
//         })
//         .catch(error => console.error('Error checking login status:', error));
// }

// // 예매 버튼에 클릭 이벤트 리스너를 추가합니다.
// document.getElementById('bookButton').addEventListener('click', onBookButtonClick)
    </script>
</body>
</html>
