<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <%@ page isELIgnored="true" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>영화 예매 시스템</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f4f4f4;
                    margin: 0;
                    padding: 0;
                    display: flex;
                    justify-content: center;
                    height: 100vh;
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
                    width: 120px;
                    /* 포스터의 너비를 설정하세요 */
                    height: 180px;
                    /* 포스터의 높이를 설정하세요 */
                    margin-right: 20px;
                    object-fit: cover;
                    /* 이미지가 div를 가득 채우도록 합니다 */
                }

                .movie-details {
                    display: flex;
                    flex-direction: column;
                    /* 이 부분이 수직 정렬을 합니다. */
                    flex-grow: 1;
                }

                .movie-info {
                    flex-grow: 1;
                }

                .movie-title {
                    margin: 0;
                    font-size: 1.2em;
                }

                .theater-info,
                .seating-info,
                .showtime-info {
                    margin: 5px 0;
                }

                .movie-time {
                    background: #ffcc00;
                    padding: 5px 10px;
                    width: 120px;
                    display: block;
                    /* 이 부분이 각 버튼을 줄바꿈하여 표시합니다. */
                    margin: 5px;
                    cursor: pointer;
                }

                .date-navigation button {
                    background-color: #ffffff;
                    border: none;
                    padding: 10px;
                    margin: 5px 0;
                    /* 위아래 간격 조정 */
                    width: 100%;
                    font-size: 1em;
                    cursor: pointer;
                }

                .current-month-display {
                    text-align: center;
                    font-size: 1em;
                    /* 글자 크기를 조정하여 내용이 잘 보이도록 함 */
                    padding: 20px;
                    width: 100%;
                    background-color: #ffcc00;
                    /* 날짜 버튼과 동일한 배경색 */
                    color: black;
                    /* 글자색 */
                    border-bottom: 1px solid #000000;
                    /* 하단 경계선 */
                }

                /* #time-selection {
                    width: 200px;
                    padding: 10px;
                    margin: 20px;
                    background-color: #ffffff;
                    border: 1px solid #ffcc00;
                    font-size: 1em;
                    cursor: pointer;
                } */
            </style>
        </head>

        <body>
            <div class="schedule-container">
                <div class="date-column">
                    <div class="date-buttons-container"></div> <!-- 날짜 버튼들을 여기에 넣습니다 -->

                    <!-- <select id="time-selection">
                        <시간 옵션들이 여기에 들어갑니다 
                    </select> -->
                </div>
                <div class="schedule-column">
                    <div class="day-schedule">
                        <h3>영화</h3> <!-- 여기로 옮겨졌습니다 -->
                        <div id="movie-sessions-container">
                            <!-- 여기에 영화 블럭 추가 -->
                        </div>
                    </div>
                </div>
        </body>

        <script>
            var currentDate = new Date();
            currentDate.setHours(0, 0, 0, 0); // 시간을 자정으로 설정합니다.

            document.addEventListener('DOMContentLoaded', function () {
                const dateContainer = document.querySelector('.date-column');
                const scheduleColumn = document.querySelector('.schedule-column');
                var queryString = window.location.search;
                var urlParams = new URLSearchParams(queryString);
                var theaterName = urlParams.get('theaterName');
                const sessionsContainer = document.getElementById('movie-sessions-container');
                getScreenInfo(theaterName);
                generateDateButtons();

                function getScreenInfo(theaterName) {
                    fetch(`/ScreenInfo?theaterName=${encodeURIComponent(theaterName)}`)
                        .then(response => response.json())
                        .then(data => {
                            // List 형식의 데이터 처리
                            for (let element of data) {
                                var title = element.title; // 각 요소에서 영화 제목 추출
                                var screenNumber = element.screenNumber;
                                if (screenNumber == 4) {
                                    break;
                                }
                                var time;
                                fetchMovieDetails(title); // 영화 제목을 사용해 추가 세부 정보 요청
                                for (let i = 1; i <= 5; i++) {
                                    switch (i) {
                                        case 1:
                                            time = "07:00";
                                            break;
                                        case 2:
                                            time = "11:30";
                                            break;
                                        case 3:
                                            time = "15:30";
                                            break;
                                        case 4:
                                            time = "19:00";
                                            break;
                                        case 5:
                                            time = "23:00";
                                            break;
                                    }
                                    // YYYYMMDD + time
                                    console.log(screenNumber);
                                    console.log(time);
                                    var totalSeats = element.size === 'big' ? 172 : 122;
                                    fetchMovieCinema(theaterName, screenNumber, time, totalSeats, title);
                                }
                            }
                        })
                        .catch(error => console.error('Error fetching initial movie data:', error)); // 에러 처리 추가
                }

                function fetchMovieDetails(title) {
                    fetch(`/Movie?title=${encodeURIComponent(title)}`)
                        .then(response => response.json())
                        .then(data => {
                            const sessionDiv = document.createElement('div');
                            sessionDiv.className = 'movie-session';
                            sessionDiv.innerHTML = `<img src="${data.imageURL}" alt="${data.title} 포스터" class="movie-poster">` +
                                `<div class="movie-info">${data.title} - (상영시간: ${data.runtime}) (장르: ${data.genre}) </div>`;



                            // sessionDiv.appendChild(timeButtonsDiv);
                            sessionsContainer.appendChild(sessionDiv);

                            // 영화 상세 정보를 가져온 후 fetchMovieCinema() 함수를 호출할 때 영화 제목을 전달합니다.
                        })
                        .catch(error => console.error('Error fetching movie details:', error));
                }


                function fetchMovieCinema(theaterName, screenNumber, time, totalSeats, title) {
                    console.log("셔터네임: " + theaterName);
                    console.log("스크린 넘버: " + screenNumber);
                    fetch(`/Seat?theaterName=${encodeURIComponent(theaterName)}&screenNumber=${encodeURIComponent(screenNumber)}&time=${encodeURIComponent(time)}`)
                        .then(response => response.json())
                        .then(data => {
                            var remainSeats = totalSeats - data.length;
                            const seatDiv = document.createElement('div');
                            seatDiv.className = 'movie-session';
                            // 좌석 정보 처리
                            const timeButtonsDiv = document.createElement('div');
                            const timeButton = document.createElement('button');
                            timeButton.className = 'movie-time';
                            timeButton.textContent = `${time} (${remainSeats}/${totalSeats})`;
                            timeButton.dataset.title = title;
                            timeButton.dataset.dateTime = new Date().toISOString(); // 현재의 년월일시간분 추가
                            timeButton.addEventListener('click', function (e) {
                                let title = e.target.dataset.title;
                                // console.log("제목 확인:", title)
                                const dateTime = e.target.dataset.dateTime; // 클릭된 버튼의 날짜와 시간 가져오기
                                gotoNext(dateTime, screenNumber, totalSeats, title);
                            });

                            timeButtonsDiv.appendChild(timeButton);
                            seatDiv.appendChild(timeButtonsDiv);
                            sessionsContainer.appendChild(seatDiv);
                        })
                        .catch(error => console.error('Error fetching movie details:', error));
                }

                function gotoNext(dateTime, screenNumber, totalSeats, title) {
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var theaterName = urlParams.get('theaterName');

    const selectedMonth = parseInt(this.value, 10);
    const currentDate = new Date(dateTime);
    const fulltime = formatDate(currentDate);
    console.log(fulltime);

    var seatSize = totalSeats == 172 ? "big" : "small";
    var url = `seat-${seatSize}.jsp?theaterName=${encodeURIComponent(theaterName)}&screenNumber=${encodeURIComponent(screenNumber)}&title=${encodeURIComponent(title)}&time=${encodeURIComponent(fulltime)}`;
    console.log(url);
    window.location.href = url;
}

function padZero(num) {
    return num < 10 ? '0' + num : num;
}

function formatDate(date) {
    const year = date.getFullYear();
    const month = padZero(date.getMonth() + 1); // 월은 0부터 시작하므로 1을 더해줌
    const day = padZero(date.getDate());
    const hours = padZero(date.getHours());
    const minutes = padZero(date.getMinutes());
    return `${year}${month}${day}:${hours}:${minutes}`;
}
            });





            function generateDateButtons() {
    const buttonsContainer = document.querySelector('.date-buttons-container');
    buttonsContainer.innerHTML = '';

    const today = new Date();
    today.setHours(0, 0, 0, 0);

    for (let i = -1; i <= 1; i++) {
        let newDate = new Date(currentDate);
        newDate.setDate(newDate.getDate() + i);
        const dateBtn = document.createElement('button');
        dateBtn.textContent = ` ${newDate.getMonth()+1}월 ${newDate.getDate()}일`;

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
            const formattedDate = formatCustomDate(currentDate);
            console.log(`${formattedDate}`);

            // fetchScreenAndMovieInfo(theaterName, formattedDate);
            generateDateButtons(); // Refresh date buttons to update 'active' status

        
        });

        if (i === 0) {
            dateBtn.classList.add('active');
        }

        buttonsContainer.appendChild(dateBtn);
    }
}
function formatCustomDate(date) {
    const year = date.getFullYear().toString().slice(2); // Get last two digits of the year
    const month = padZero(date.getMonth() + 1);
    const day = padZero(date.getDate());
    const hours = padZero(date.getHours());
    return `${year}${month}:${day}:${hours}`;
}

function padZero(num) {
    return num < 10 ? '0' + num : num;
}
    // 초기 일정 표시
//     function fetchScreenAndMovieInfo(theaterName, formattedDate) {
//     fetch(`/ScreenInfo?theaterName=${encodeURIComponent(theaterName)}&date=${encodeURIComponent(formattedDate)}`)
//         .then(response => response.json())
//         .then(data => {
//             // 화면에 표시할 정보 초기화
//             const sessionsContainer = document.getElementById('movie-sessions-container');
//             sessionsContainer.innerHTML = '';  // 기존 정보 클리어

//             // 서버로부터 받은 상영 정보를 화면에 동적으로 추가
//             data.forEach(movie => {
//                 const { title, screenNumber, time, totalSeats } = movie;
                
//                 // 영화 상세 정보와 상영 시간을 포함하는 세션 DIV 생성
//                 const sessionDiv = document.createElement('div');
//                 sessionDiv.className = 'movie-session';
//                 sessionDiv.innerHTML = `
//                     <div class="movie-info">
//                         <strong>${title}</strong> - Screen ${screenNumber} - ${time}
//                         <button onclick="fetchMovieCinema('${theaterName}', ${screenNumber}, '${time}', ${totalSeats}, '${title}')">Check Seats</button>
//                     </div>`;

//                 sessionsContainer.appendChild(sessionDiv);
//             });
//         })
//         .catch(error => {
//             console.error('Error fetching schedule:', error);
//             // 오류 발생시 사용자에게 피드백 제공
//             alert('Failed to fetch movie schedule. Please try again later.');
//         });
// }

        </script>

        </html>