<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="true"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>영화 예매 시스템</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
/* 공통 스타일 */
body {
	font-family: Arial, sans-serif;
	background-color: beige;
	margin: 0;
	padding: 0 0 50px; /* 페이지 하단에 footer 높이만큼의 padding 추가 */
}

.container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0);
}

label {
	font-weight: bold;
	margin-bottom: 5px;
	display: block;
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

.wrapper {
	display: flex;
	flex-direction: row;
	/* 수정 */
	align-items: flex-start;
	justify-content: center;
	/* 수정 */
	gap: 80px;
	margin-top: 50px;
}

.poster-container {
	width: auto;
}

.container {
	position: relative;
	width: 35vw;
	flex-grow: 1;
	flex-shrink: 1;
}

.poster {
	width: 557px;
	height: 399px;
	position: relative;
	border-radius: 6px;
	background: rgba(217, 217, 217, 0.5);
}

.movieinfo {
	width: 300px;
	font-size: 28px;
	font-weight: 600;
	text-align: left;
	color: #000;
}

.timeBox {
	width: 729px;
	height: 782px;
	background: #d9d9d9;
	margin-top: 100px;
}

.timeText {
	font-size: 40px;
	color: #000;
	margin-bottom: 10px;
}

/* 월 선택 버튼 스타일 */
.month-buttons {
	display: flex;
}

.month-button {
	background-color: brown;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.month-button:hover {
	background-color: brown;
}

.month-button.selected {
	background-color: coral;
}

/* 날짜 선택 스타일 */
.date-buttons, .time-buttons {
	position: relative;
	display: flex;
	width: 100%;
	height: 100%;
	flex-wrap: wrap;
	justify-content: flex-start; /* 버튼들을 컨테이너의 시작 부분에 정렬합니다. */
	align-items: flex-start; /* 버튼들을 컨테이너의 상단에 정렬합니다. */
	gap: 3px;
}

.month-button, .date-button {
	position: relative;
	width: 9%;
	height: 5%;
	flex-direction: row;
	padding: 8px 16px;
	background-color: brown;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 5px;
	margin-bottom: 5px;
	text-align: center;
	justify-content: center; /* 수평 중앙 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	text-align: center; /* 텍스트를 수평 중앙 정렬 */
	margin: 0.5%;
}

.month-button {
	width: 10%;
}

.date-button:hover, .time-button:hover {
	background-color: brown;
}

.date-button.disabled, .time-button.disabled {
	background-color: #ccc;
	cursor: not-allowed;
}

.date-button.selected, .time-button.selected {
	background-color: coral;
}

.time-button {
	display: block;
	/* 세로로 표시되도록 설정 */
	padding: 8px 16px;
	background-color: brown;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 5px;
	/* 버튼 사이의 간격을 조절합니다. */
}

/* 영화 정보 스타일 */
.movie-info {
	margin-top: 20px;
	margin-bottom: 10px;
	/* 버튼 사이의 간격을 조절합니다. */
}

.movie-info p {
	margin: 5px 0;
}

.m1 {
	width: 90%;
	height: 100%;
	position: relative;
	flex-direction: column;
	border-radius: 5px;
}
/* 선택 초기화 버튼 스타일 */
#resetButton {
	margin-left: 200px; /* 왼쪽 여백 추가하여 '5월' 버튼과 간격 생성 */
	padding: 8px 16px; /* 패딩으로 크기 조절 */
	background-color: brown;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#resetButton:hover {
	background-color: #854a19;
}

.dateContainer {
	flex-direction: column;
}

#nextButton {
	padding: 8px 16px;
	background-color: brown;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
	align-self: flex-end;
}

#nextButton:hover {
	background-color: #854a19;
}

.footer {
	width: 100%;
	background-color: #f3e9d2;
	color: #8b572a;
	text-align: center;
	padding: 20px 0;
	position: fixed;
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
</head>

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

	<div class="wrapper">
		<div class="poster-container">
			<div class="poster">
				<p style="position: absolute; left: 207px; top: 178px; font-size: 24px; font-weight: 200; text-align: left; color: #000;">영화 포스터</p>
			</div>
			<div class="movieinfo">
				<span>영화 제목</span><br /> <br /> <span>| 개봉일자</span><br /> <span>| 상영시간</span><br /> <span>| 관람등급</span><br /> <span>| 누적 관객</span>
			</div>
		</div>
		<div class="dateContainer">
			<div class="container" style="flex-direction: column;">
				<div class="month-buttons" style="display: flex;">
					<div class="m1">
						<button class="month-button selected" value="4">4월</button>
						<button class="month-button" value="5">5월</button>
						<button id="resetButton">초기화</button>
					</div>
					<!-- 선택된 버튼을 초기화하는 버튼 추가 -->
				</div>
				<div class="date-buttons" id="dateButtons">
					<!-- 선택된 월의 날짜 버튼이 여기에 추가됩니다. -->
				</div>

			</div>
			<div class="container" id="movieInfoContainer" style="display: none;">
				<div class="movie-info" id="movieInfo"></div>
				<button id="nextButton" onclick="gotoNext()">다음</button>
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
var movieInfoDisplay;
var selectedTime;
var selectedDate;
var selectedScreenNumber; // 전역 변수로 선언

document.addEventListener('DOMContentLoaded', function () {
    const dateButtonsContainer = document.getElementById('dateButtons');
    const movieInfoContainer = document.getElementById('movieInfoContainer');
    movieInfoDisplay = document.getElementById('movieInfo'); // movieInfoDisplay를 정의합니다.
    const monthButtons = document.querySelectorAll('.month-button');

    monthButtons.forEach(button => {
        button.addEventListener('click', function () {
            monthButtons.forEach(btn => btn.classList.remove('selected'));
            this.classList.add('selected');
            const selectedMonth = parseInt(this.value, 10);
            const currentDate = new Date();
            const currentYear = currentDate.getFullYear();
            const daysInSelectedMonth = new Date(currentYear, selectedMonth, 0).getDate();
            dateButtonsContainer.innerHTML = '';
            for (let i = 1; i <= daysInSelectedMonth; i++) {
                const button = document.createElement('button');
                button.textContent = i + '일';
                button.setAttribute('value', i);
                button.classList.add('date-button');
                if (selectedMonth === currentDate.getMonth() + 1 && i < currentDate.getDate()) {
                    button.classList.add('disabled');
                    button.setAttribute('disabled', true);
                } else {
                    button.addEventListener('click', function () {
                        dateButtonsContainer.querySelectorAll('.date-button').forEach(btn => btn.classList.remove('selected'));
                        this.classList.add('selected');
                        selectedDate = `${currentYear}${selectedMonth.toString().padStart(2, '0')}${i.toString().padStart(2, '0')}`; // YYMMDD format
                        updateMovieInfo();
                    });
                }
                dateButtonsContainer.appendChild(button);
            }
        });
    });

    // 초기 화면 로드시 4월 버튼을 선택 상태로 설정하고 해당 월의 날짜 버튼을 생성합니다.
    document.querySelector('.month-button[value="4"]').click();

    // 선택 초기화 버튼에 클릭 이벤트 추가
    const resetButton = document.getElementById('resetButton');
    resetButton.addEventListener('click', function () {
        const buttons = dateButtonsContainer.querySelectorAll('.date-button');
        buttons.forEach(btn => btn.classList.remove('selected')); // 선택된 버튼의 색상을 초기화합니다.
        // 영화 정보 창을 숨깁니다.
        movieInfoContainer.style.display = 'none';
        // 선택된 상영 정보를 삭제합니다.
        movieInfoDisplay.innerHTML = '';
    });

    // "다음" 버튼에 클릭 이벤트 추가
    const nextButton = document.getElementById('nextButton');
    nextButton.addEventListener('click', function () {
        gotoNext();
    });

});

function updateMovieInfo() {
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var theaterName = urlParams.get('theaterName');
    var queryTitle = urlParams.get('title');
    
    getTheaterInfo(theaterName, function (theaterSize) {
        for (var i = 1; i <= theaterSize; i++) {
            getScreenInfo(theaterName, i, function (screenInfo) {
                setTimeout(function() {
                    if (queryTitle === screenInfo.title) {
                        selectedScreenNumber = screenInfo.screenNumber; // 상영관 번호 저장
                        
                        var seatSize = screenInfo.size;
                        var totalSeats = seatSize === 'big' ? 172 : 122;
        
                        console.log(theaterName);
                        console.log(selectedScreenNumber);
                        console.log(totalSeats);
                        getSeatList(theaterName, selectedScreenNumber)
                        .then(seatList => {
                            if (!seatList.length) {
                                generateRandomMovieInfo(theaterName, selectedScreenNumber, totalSeats);
                            } else {
                                generateExistMovieInfo(theaterName, selectedScreenNumber, totalSeats);
                            }
                        })
                        .catch(error => {
                            // 에러가 발생한 경우에 대한 처리
                            console.error("Error occurred:", error);
                        });
                    }
                }, 100);
            });
        }
    });
}

// 상영관 정보를 가져오는 함수
function getTheaterInfo(theaterName, callback) {
    $.ajax({
        url: '/Theater', // theaterList 엔드포인트로 요청을 보냅니다.
        type: 'GET',
        dataType: 'json',
        success: function (theaterList) {
            var theaterSize;
            for (var i = 0; i < theaterList.length; i++) {
                if (decodeURIComponent(theaterList[i].theaterName) === theaterName) { // theaterName을 디코딩하여 비교합니다.
                    theaterSize = theaterList[i].size; // theaterList에서 theaterName이 일치하는 theater의 size를 가져옵니다.
                    break;
                }
            }
            if (theaterSize !== undefined) {
                callback(theaterSize); // theaterSize 값이 유효한 경우에만 콜백 함수를 호출하여 theaterSize 값을 전달합니다.
            } else {
                console.error('해당하는 상영관이 없습니다.');
            }
        },
        error: function (xhr, status, error) {
            console.error('서버로부터 theater 데이터를 가져오는 데 실패했습니다.');
        }
    });
}

// 특정 상영관의 정보를 가져오는 함수
function getScreenInfo(theaterName, screenNumber, callback) {
    $.ajax({
        url: '/ScreenInfo',
        type: 'GET',
        dataType: 'json',
        data: { theaterName: theaterName, screenNumber: screenNumber },
        success: function (screenInfo) {
            selectedScreenNumber = screenNumber; // 전역 변수에 상영관 번호 저장
            callback(screenInfo); // 콜백 함수를 호출하여 screenInfo 값을 전달
        },
        error: function (xhr, status, error) {
            console.error('서버로부터 screenInfo 데이터를 가져오는 데 실패했습니다.');
        }
    });
}

function generateRandomMovieInfo(theaterName, screenNumber, totalSeats) {
    const times = ['07:00', '11:30', '15:30', '19:00', '23:00'];
    let movieInfoHTML = '<p>상영 정보:</p>';
    const numTimes = Math.floor(Math.random() * 2) + 4; // 랜덤으로 시간 개수 선택 (3~5)

    times.slice(0, numTimes).forEach(selectedTime => {
        getSeatListWithAdditionalInfo(theaterName, screenNumber, `${selectedDate}:${selectedTime}`, totalSeats, function(availableSeats) {
            const seatStatus = availableSeats > 0 ? `(${availableSeats}석)` : '(매진)';
            const timeButtonHTML = `<button class="time-button" data-time="${selectedTime}">${selectedTime} ${seatStatus}</button>`;
            movieInfoHTML += timeButtonHTML;
            movieInfoDisplay.innerHTML = movieInfoHTML;
        });
    });

    movieInfoContainer.style.display = 'block';
    // 이벤트 리스너 설정을 HTML 업데이트 이후로 이동
    setTimeout(function() {
        document.querySelectorAll('.time-button').forEach(button => {
            button.addEventListener('click', function () {
                document.querySelectorAll('.time-button').forEach(btn => btn.classList.remove('selected'));
                this.classList.add('selected');
                selectedTime = this.dataset.time; // 선택된 시간 업데이트
                updateSelectedTimeDisplay(selectedTime);
            });
        });
    }, 100); // 동적으로 생성된 요소에 이벤트 리스너를 바인딩하기 위한 충분한 시간 제공
}

function generateExistMovieInfo(theaterName, screenNumber, totalSeats) {
    var times = {};
    getSeatList(theaterName, screenNumber)
        .then(seatList => {
            // seatList는 array형식, seatList에서 time값을 가져와 times에 저장하기.
            seatList.forEach(seat => {
                if (!times.hasOwnProperty(seat.time)) {
                    times[seat.time] = true;
                }
            });
        })
        .then(() => {
            // times에 해당하는 timebutton을 만들기
            let movieInfoHTML = '<p>상영 정보:</p>';
            Object.keys(times).forEach(selectedTime => {
                const timeButtonHTML = `<button class="time-button" data-time="${selectedTime}">${selectedTime}</button>`;
                movieInfoHTML += timeButtonHTML;
            });
            movieInfoDisplay.innerHTML = movieInfoHTML;
            movieInfoContainer.style.display = 'block';

            // 이벤트 리스너 설정을 HTML 업데이트 이후로 이동
            setTimeout(function() {
                document.querySelectorAll('.time-button').forEach(button => {
                    button.addEventListener('click', function () {
                        document.querySelectorAll('.time-button').forEach(btn => btn.classList.remove('selected'));
                        this.classList.add('selected');
                        selectedTime = this.dataset.time; // 선택된 시간 업데이트
                        updateSelectedTimeDisplay(selectedTime);
                    });
                });
            }, 100); // 동적으로 생성된 요소에 이벤트 리스너를 바인딩하기 위한 충분한 시간 제공
        });
}


function updateSelectedTimeDisplay(selectedTime) {
    const selectedTimeDisplay = document.createElement('p');
    selectedTimeDisplay.textContent = `선택한 상영 시간: ${selectedTime}`;
    const oldSelectedTimeDisplay = movieInfoContainer.querySelector('.selected-time-info');
    if (oldSelectedTimeDisplay) {
        movieInfoContainer.removeChild(oldSelectedTimeDisplay);
    }
    selectedTimeDisplay.classList.add('selected-time-info');
    movieInfoContainer.appendChild(selectedTimeDisplay);
}

function getSeatList(theaterName, screenNumber, time) {
    if (!time) {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/Seat',
                type: 'GET',
                dataType: 'json',
                data: { theaterName: theaterName, screenNumber: screenNumber, time: "Alltime" },
                success: function (response) {
                    // 서버 응답이 배열인 경우 바로 resolve
                    if (Array.isArray(response)) {
                        resolve(response);
                    } else {
                        console.error('예상치 못한 응답 형식:', response);
                        reject('Seat 데이터를 가져오지 못했습니다.');
                    }
                },
                error: function (xhr, status, error) {
                    console.error(`요청 실패: ${status}, ${error}`);
                    reject('서버로부터 Seat 데이터를 가져오는 데 실패했습니다.');
                }
            });
        });
    } else {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/Seat',
                type: 'GET',
                dataType: 'json',
                data: { theaterName: theaterName, screenNumber: screenNumber, time: time },
                success: function (response) {
                    // 서버 응답이 배열인 경우 바로 resolve
                    if (Array.isArray(response)) {
                        resolve(response);
                    } else {
                        console.error('예상치 못한 응답 형식:', response);
                        reject('Seat 데이터를 가져오지 못했습니다.');
                    }
                },
                error: function (xhr, status, error) {
                    console.error(`요청 실패: ${status}, ${error}`);
                    reject('서버로부터 Seat 데이터를 가져오는 데 실패했습니다.');
                }
            });
        });
    }
}

function getSeatListWithAdditionalInfo(theaterName, screenNumber, time, totalSeats, callback) {
    getSeatList(theaterName, screenNumber, time)
        .then(seatList => {
            const currentBookedSeat = seatList.length; // 현재 예약된 좌석 수
            const availableSeats = totalSeats - currentBookedSeat; // 사용 가능한 좌석 수
            callback(availableSeats); // 콜백 함수 호출
        })
        .catch(error => {
            console.error(error); // 오류 처리
        });
}

function gotoNext() {
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var theaterName = urlParams.get('theaterName');
    var title = urlParams.get('title');

    var fullTime;
    if (selectedTime.length === 5) {
        fullTime = `${selectedDate}:${selectedTime}`; // YYMMDD:HH:MM 형식
    } else {
        fullTime = selectedTime; // 이미 YYMMDD:HH:MM 형식인 경우
    }

    // getScreenInfo 함수를 호출하여 screenInfo를 가져온 후, 콜백 함수 내에서 URL 구성
    getScreenInfo(theaterName, selectedScreenNumber, function(screenInfo) {
        var seatSize = screenInfo.size; // 'big' 또는 'small' 값 사용
        var url = `seat-${seatSize === "big" ? "big" : "small"}.jsp?theaterName=${encodeURIComponent(theaterName)}&screenNumber=${encodeURIComponent(selectedScreenNumber)}&title=${encodeURIComponent(title)}&time=${encodeURIComponent(fullTime)}`;
        window.location.href = url; // URL로 리디렉션
    });
}

</script>
</html>