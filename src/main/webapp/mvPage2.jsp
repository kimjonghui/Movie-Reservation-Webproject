<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="true"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>onepage scroll</title>

<style>
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



html, body {
	height: 100%;
	margin: 0;
	/* scroll-snap-type: y mandatory; */
	overflow: hidden;
}

.wrap {
	position: relative;
	width: 100%;
	height: 100%;
	transition: top 0.5s;
}

.container {
	display: flex;
	flex-wrap: wrap;
	width: 100%;
	height: 100%;
	align-items: flex-start;
	justify-content: center;
    
	/* scroll-snap-align: start; */

	/* overflow: hidden; */
}

.movie {
	width: 23%; /* 4개가 잘 맞도록 조정 */
	height: 800px; /* 원하는 높이로 설정 */
	margin: 1%;
	text-align: center;
	border: 2px solid #ddd; /* 테두리 설정 */
	border-radius: 10px; /* 테두리 둥글게 */
	padding: 15px; /* 내부 여백 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	background-color: #fff; /* 배경색 */
	cursor: pointer;
}

.movie img {
	width: 400px; /* 원하는 너비로 설정 */
	height: 550px; /* 원하는 높이로 설정 */
	object-fit: cover; /* 이미지 비율을 유지하면서 지정된 영역을 채우도록 설정 */
	border-radius: 10px;
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
.header-container{
        z-index: 1;
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

	<div class="wrap">
		<!-- 컨테이너가 여기에 삽입됩니다. -->
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

    fetchAndDisplayMovies();

    const wrap = document.getElementsByClassName('wrap')[0]; // 보일 영역
    const container = document.getElementsByClassName('container');
    let page = 0; // 영역 포지션 초기값
    const lastPage = 16; // 마지막 페이지

    window.addEventListener('wheel',(e)=>{
        e.preventDefault();
        if(e.deltaY > 0){
            page++;
        }else if(e.deltaY < 0){
            page--;
        } 
        if(page < 0){
            page = 0;
        }else if(page > lastPage){
            page = lastPage;
        }
        wrap.style.top = page * -100 + 'vh';
    }, {passive: false});

// document.addEventListener('DOMContentLoaded', fetchAndDisplayMovies());

function fetchAndDisplayMovies() {
    const wrap = document.querySelector('.wrap');
    let containerCount = 0;
    let movieCount = 0;
    let container;
    
    movieTitles.forEach((title, index) => {
        fetch(`/Movie?title=${encodeURIComponent(title)}`) // 백엔드 API 경로
            .then(response => response.json())
            .then(movie => {
                // 새로운 컨테이너를 생성하거나 기존 컨테이너를 사용
                if (movieCount % 3 === 0) {
                    container = document.createElement('div');
                    container.className = 'container';
                    wrap.appendChild(container);
                    containerCount++;
                }
                movieCount++;

                // 영화 포스터 div 생성
                const movieDiv = document.createElement('div');
                movieDiv.classList.add('movie');

                // 포스터 이미지 설정
                const img = document.createElement('img');
                img.src = movie.imageURL; // 실제 영화 포스터 이미지 URL
                img.alt = movie.title;
                movieDiv.appendChild(img);
                movieDiv.addEventListener('click', function() {
                        sendTitle(movie.title); // 클릭 시 sendTitle 함수 호출
                    });
                // 영화 제목 및 추가 정보 설정
                const infoDiv = document.createElement('div');
                infoDiv.innerHTML = `
                    <h3>${movie.title}</h3>
                    <p>감독: ${movie.director}</p>
                    <p>출연: ${movie.actor}</p>
                    <p>상영시간: ${movie.runtime}분</p>
                    <p>장르: ${movie.genre}</p>
                `;
                movieDiv.appendChild(infoDiv);

                // 생성된 영화 포스터 div를 현재 컨테이너에 추가
                container.appendChild(movieDiv);
            })
            .catch(error => console.error('영화 정보를 가져오는 데 실패했습니다:', error));
           
    });
}
// window.onload = function() {
//     fetchAndDisplayMovies();
// };
window.onload = function() {
        fetchAndDisplayMovies();
    };

    function sendTitle(title) {
        var queryString = window.location.search;

        var urlParams = new URLSearchParams(queryString);

        var theaterName = urlParams.get('theaterName');

    
        var url = "http://localhost:8080/mvPage1.jsp?title=" + encodeURIComponent(title);
        window.location.href = url;

    }
</script>
</html>