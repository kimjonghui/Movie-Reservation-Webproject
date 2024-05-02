<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="true"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>영화 예매 시스템</title>
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

.schedule-container {
    
	display: flex;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
	width: 60%;
	height: 80vh;
}

.date-column {
	background-color: #ffcc00;
	width: 20%;
	overflow-y: auto;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.date-column button {
	background: none;
	border: none;
	padding: 20px;
	width: 100%;
	text-align: left;
	font-size: 1.5em;
	color: black;
	cursor: pointer;
	border-bottom: 1px solid #fff;
}

.date-column button.active {
	background-color: #ffe680;
	font-weight: bold;
}

.schedule-column {
	width: 75%;
	overflow-y: auto;
}

.day-schedule {
	padding: 20px;
}

.day-schedule h3 {
	font-size: 1.5em;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.movie-session {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.movie-poster {
    width: 120px; /* 포스터의 너비를 설정하세요 */
    height: 180px; /* 포스터의 높이를 설정하세요 */
    margin-right: 20px;
    object-fit: cover; /* 이미지가 div를 가득 채우도록 합니다 */
}

.movie-info {
    flex-grow: 1;
}

.movie-title {
    margin: 0;
    font-size: 1.2em;
}

.theater-info, .seating-info, .showtime-info {
    margin: 5px 0;
}

.movie-time {
	background: #ffcc00;
	padding: 5px 10px;
	display: inline-block;
	margin: 5px;
	cursor: pointer;
}

.date-navigation button {
	background-color: #ffffff;
	border: none;
	padding: 10px;
	margin: 5px 0; /* 위아래 간격 조정 */
	width: 100%;    
	font-size: 1em;
	cursor: pointer;
}

.current-month-display {
	text-align: center;
	font-size: 1em; /* 글자 크기를 조정하여 내용이 잘 보이도록 함 */
	padding: 20px;
	width: 100%;
	background-color: #ffcc00; /* 날짜 버튼과 동일한 배경색 */
	color: black; /* 글자색 */
	border-bottom: 1px solid #000000; /* 하단 경계선 */
}
    
#time-selection {
	  width: 200px;
	padding: 10px;
	margin: 20px;
	background-color: #ffffff;
	border: 1px solid #ffcc00;
	font-size: 1em;
	cursor: pointer;
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
		<img src="Logo.png" alt="Logo" class="logo" /> <a class="title"
			href="MainPage.jsp">cinematch</a>
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
				<a href="board.jsp" class="board">고객센터</a>
			</div>
		</div>
		<div class="auth-container">
			<div class="auth-links">
				<span> <%
 String userID = (session != null) ? (String) session.getAttribute("authID") : null;
 if (userID != null) {
 %> <%=userID%></span> / <a href="Logout.jsp">Logout</a>
				<%
				} else {
				%>
				<a href="Login.jsp">Login</a> / <a href="SignUp.jsp">Sing Up</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
    <div class="schedule-container">
        <div class="date-column">
            <div class="date-buttons-container"></div> <!-- 날짜 버튼들을 여기에 넣습니다 -->
            
            <select id="time-selection">
                <!-- 시간 옵션들이 여기에 들어갑니다 -->
            </select>
        </div>
        <div class="schedule-column">
            <div class="movie-session">
				<img src="https://cdn.aitimes.com/news/photo/202208/146184_153838_2628.jpgL" alt="영화 포스터" class="movie-poster" />
				<div class="movie-info">
					<h4 class="movie-title">영화 제목</h4>
					<p class="theater-info">4DX 2D (LG) 4DX 2관 (108석)</p>
					<p class="seating-info">남은 좌석: 80석</p>
					<div class="movie-time">11:35</div>
					<!-- <p class="showtime-info">
						<span>상영 시작 시간: 11:35</span> -->
					</p>
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
	<script>


function getMovie(title) {
	$.ajax({
                url: '/Movie', // 서블릿의 URL
                type: 'GET',
                dataType: 'json', // 반환되는 데이터 형식
                success: function (title) {
                    // 데이터를 성공적으로 가져온 경우 실행되는 함수
                    var imageURL = document.getElementById("imageURL");
                    var genre = document.getElementById("genre");
                    var runtime = document.getElementById("runtime");
                    var director = document.getElementById("director");

					makeMovieDiv(title, imageURL, genre, runtime, director);
                },
                error: function (xhr, status, error) {
                    // 데이터를 가져오는 데 실패한 경우 실행되는 함수
                    console.error('서버로부터 screenInfo 데이터를 가져오는 데 실패했습니다.');
                    return false;
                }
            });
}
function makeMovieDiv(title, imageURL, genre, runtime, director, date, selectedHour) {
    const scheduleColumn = document.getElementById("scheduleColumn");
    scheduleColumn.innerHTML = ''; // 기존 스케줄 컬럼 내용을 초기화
	const day = date.slice(-2);  // 날짜에서 일자만 추출
    const hourlySchedules = schedules[day];
    const dayScheduleDiv = document.createElement('div');
    dayScheduleDiv.className = 'day-schedule';
    scheduleColumn.appendChild(dayScheduleDiv);

	const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
    const selectedMonthName = monthNames[currentDate.getMonth()];
    const selectedYear = currentDate.getFullYear();

    dayScheduleDiv.innerHTML = `<h3>영화</h3>`;

    const movieSession = document.createElement('div');
    movieSession.className = 'movie-session';
	if (hourlySchedules && hourlySchedules[selectedHour]) {
    movieSession.innerHTML = `
        <img src="${imageURL}" alt="${title} 포스터" class="movie-poster" />
        <div class="movie-info">
            <h4 class="movie-title">${title}</h4>
            <p class="theater-info">${genre}</p>
            <p class="seating-info">상영 시간: ${runtime}</p>
            <div class="movie-time">${selectedHour}</div>
            <p class="director-info">감독: ${director}</p>
        </div>
    `;
	} else {
        dayScheduleDiv.innerHTML += '<p>이 시간에는 일정이 없습니다.</p>';
    }
    scheduleColumn.appendChild(movieSession);
}

		document.addEventListener('DOMContentLoaded', function() {
    const dateContainer = document.querySelector('.date-column');
    const scheduleColumn = document.querySelector('.schedule-column');
    let currentDate = new Date();

	const schedules = {
    '12': {
        '13': [
            { title: '에일리언 1'},
            { title: '에일리언 2' ,},
            { title: '에일리언 4'}
        ],
        '15': [
            { title: '4DX 2D (LG) 4DX 2관 (108석)', seats: '90', runtime: '15:00'}
        ],
        '17': [
            { title: '4DX 2D (LG) 4DX 2관 (108석)', seats: '100', runtime: '17:25' }
        ]
    },
    '13': {
        '11': [
            { title: '4DX 2D (LG) 4DX 2관 (108석)', seats: '85', runtime: '11:35' }
        ]
    }
};

// function updateScheduleDisplay(date, selectedHour) {
//     const day = date.slice(-2);  // 날짜에서 일자만 추출
//     const hourlySchedules = schedules[day];
//     scheduleColumn.innerHTML = '';
//     const dayScheduleDiv = document.createElement('div');
//     dayScheduleDiv.className = 'day-schedule';
//     scheduleColumn.appendChild(dayScheduleDiv);

//     const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
//     const selectedMonthName = monthNames[currentDate.getMonth()];
//     const selectedYear = currentDate.getFullYear();

//     dayScheduleDiv.innerHTML = `<h3>영화</h3>`;
    
//     if (hourlySchedules && hourlySchedules[selectedHour]) {
//         hourlySchedules[selectedHour].forEach(session => {
//             const sessionDiv = document.createElement('div');
//             sessionDiv.className = 'movie-session';
//             sessionDiv.innerHTML = `<img src=${session.imageURL} alt="${session.title} 포스터" class="movie-poster">` +
//                                    `<h4>${session.title} - (상영시간: ${session.runtime}) (${session.seats}석)</h4>`;
//             dayScheduleDiv.appendChild(sessionDiv);
//         });
//     } else {
//         dayScheduleDiv.innerHTML += '<p>이 시간에는 일정이 없습니다.</p>';
//     }
// }

    function generateDateButtons() {
        const buttonsContainer = document.querySelector('.date-buttons-container');
        buttonsContainer.innerHTML = '';

        const today = new Date();
        today.setHours(0, 0, 0, 0);

        for (let i = -1; i <= 1; i++) {
            let newDate = new Date(currentDate);
            newDate.setDate(newDate.getDate() + i);
            const dateBtn = document.createElement('button');
            dateBtn.textContent = `4월 ${newDate.getDate()}일`;

            dateBtn.addEventListener('click', function() {
                if (newDate < today) {
                    alert("이전 날짜로 이동할 수 없습니다.");
                    return;
                }

			const maxDate = new Date(today);
            maxDate.setDate(today.getDate() + 7);
            if (newDate > maxDate) {
                alert("상영 스케줄이 없습니다.");
                return;
            }

                currentDate = new Date(newDate);
                generateDateButtons();
                updateScheduleDisplay(newDate.getDate().toString());
            });

            if (i === 0) {
                dateBtn.classList.add('active');
            }

            buttonsContainer.appendChild(dateBtn);
        }
    }

    generateDateButtons();
    updateScheduleDisplay(currentDate.getDate().toString());

    const timeSelection = document.getElementById('time-selection');
    const currentTime = new Date();
    const currentHour = currentTime.getHours();

    for (let hour = 0; hour < 24; hour++) {
        const option = document.createElement('option');
        option.value = hour;
        option.textContent = `${hour.toString().padStart(2, '0')}:00`;

        if (hour === currentHour) {
            option.selected = true;
        }

        timeSelection.appendChild(option);
    }

    timeSelection.addEventListener('change', function() {
        const selectedHour = parseInt(this.value);
        updateScheduleDisplay(currentDate.toISOString().split('T')[0], selectedHour);
    });

    // 초기 일정 표시
    updateScheduleDisplay(currentDate.toISOString().split('T')[0], currentHour);
});




	</script>
</body>
</html>
