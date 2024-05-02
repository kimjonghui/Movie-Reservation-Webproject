<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
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
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
        }

        .nav-links {
            display: flex;
            gap: 15px;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .navigation-item a, .auth-links a {
            padding: 5px;
            font-size: 14px;
            font-weight: bold;
            color: #737373;
            text-decoration: none;
        }

        .auth-links a {
            color: #23a6f0;
        }

        .auth-container {
            margin-left: auto;
            display: flex;
            gap: 10px;
        }
        .container {
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            float: left;
        }
        /* 시간표창 */
        .button-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }

        .button {
            padding: 20px 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #e0e0e0;
        }

        .button.active {
            background-color: #007bff;
            color: #fff;
        }

        .button.disabled {
            background-color: darkgray;
            cursor: not-allowed;
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

        /* modal-content 요소들을 보이도록 설정 */
        .modal-content {
            display: block;
        }

        .close {
            font-size: 24px;
            cursor: pointer;
        }
        .timeText {
            font-size: 40px;
            color: #000;
            margin-bottom: 10px;
        }
</style>
<body>
    
<div class="header-container">
    <div class="nav-links">
        <div class="navigation-item"><a href="#home">Home</a></div>
        <div class="navigation-item"><a href="#booking">예매</a></div>
        <div class="navigation-item"><a href="#movies">영화</a></div>
        <div class="navigation-item"><a href="#mypage">MyPage</a></div>
        <div class="navigation-item"><a href="#support">고객센터</a></div>
    </div>
    <div class="auth-container">
        <div class="auth-links">
            <a href="#login">Login</a> / <a href="#register">Register</a>
        </div>
    </div>
</div>
<div class="contentContainer">
    <!-- 시간표창 -->
    <div class="container"> 
        <input type="submit" value="예매하기" id="bookButton">
        <!-- 모달 -->
        <div id="myModal" class="modal">
            <div class="modal-content" id="modalContent">
                <span class="close">&times;</span>
                <div class="button-group" id="yearButtons"></div>
                <div class="button-group" id="monthAndLabel" style="display: none;">
                    <p>월 선택</p>
                    <div class="button-group" id="monthButtons"></div>
                </div>
                <p>날짜 선택</p>
                <div class="button-group" id="dayButtons"></div>
                <p>시간 선택</p>
                <div class="button-group" id="hourButtons"></div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    // 모달 스크립트
    var modal = document.getElementById("myModal");
    var modalContent = document.getElementById("modalContent");
    var yearButtons = document.getElementById("yearButtons");
    var monthButtons = document.getElementById("monthButtons");
    var dayButtons = document.getElementById("dayButtons");
    var hourButtons = document.getElementById("hourButtons");
    var closeButton = document.getElementsByClassName("close")[0];

    var currentDate = new Date();
    var currentYear = currentDate.getFullYear();
    var currentMonth = currentDate.getMonth() + 1; // JavaScript는 월을 0부터 시작
    var currentDay = currentDate.getDate();
    var currentHour = currentDate.getHours();

    selectedYear = currentYear;
    selectedMonth = currentMonth;
    selectedDay = currentDay;

    populateButtons(2024, 2025, "yearButtons");
    modal.style.display = "block";
    document.getElementById("monthAndLabel").style.display = "flex"; // 월 선택과 해당 버튼을 함께 보여줍니다.

    yearButtons.onclick = function () {
        populateButtons(1, 12, "monthButtons");
    }
    monthButtons.onclick = function () {
        populateButtons(1, 31, "dayButtons");
    }
    dayButtons.onclick = function () {
        populateButtons(1, 23, "hourButtons");
    }
    var selectedYear, selectedMonth, selectedDay;

    // 연도 버튼 클릭 이벤트 핸들러
    yearButtons.addEventListener("click", function (event) {
        var yearValue = event.target.dataset.value; // 클릭된 버튼의 데이터 값 가져오기
        if (yearValue) {
            selectedYear = parseInt(yearValue); // 선택된 연도 업데이트
            populateButtons(1, 12, "monthButtons"); // 월 버튼 다시 생성
        }
    });

    // 월 버튼 클릭 이벤트 핸들러
    monthButtons.addEventListener("click", function (event) {
        var monthValue = event.target.dataset.value; // 클릭된 버튼의 데이터 값 가져오기
        if (monthValue) {
            selectedMonth = parseInt(monthValue); // 선택된 월 업데이트
            populateButtons(1, 31, "dayButtons"); // 일 버튼 다시 생성, 마지막 일자는 populateButtons 내부에서 처리
        }
    });

    // 일 버튼 클릭 이벤트 핸들러
    dayButtons.addEventListener("click", function (event) {
        var dayValue = event.target.dataset.value; // 클릭된 버튼의 데이터 값 가져오기
        if (dayValue) {
            selectedDay = parseInt(dayValue); // 선택된 일 업데이트
            populateButtons(0, 23, "hourButtons"); // 시간 버튼 다시 생성
        }
    });

    // 모달 닫기
    closeButton.onclick = function () {
        var activeButtons = document.querySelectorAll('.button.active');
        activeButtons.forEach(function (button) {
            button.classList.remove('active');
        });
        monthButtons.style.display = "none";
        dayButtons.style.display = "none";
        hourButtons.style.display = "none";
    }

    // 선택 버튼 스타일 변경 및 이벤트 추가
    function setActive(buttonGroup, value) {
        var buttons = document.querySelectorAll("#" + buttonGroup + " .button");
        buttons.forEach(function (button) {
            button.classList.remove("active");
            if (button.dataset.value === value && !button.classList.contains('disabled')) {
                button.classList.add("active");
            }
        });
    }

    // 예매하기 버튼 클릭 시 선택 결과를 확인할 수 있도록 수정
    var bookButton = document.getElementById("bookButton");
    bookButton.addEventListener("click", function () {
        var selectedYear = document.querySelector("#yearButtons .button.active").dataset.value;
        var selectedMonth = document.querySelector("#monthButtons .button.active").dataset.value;
        var selectedDay = document.querySelector("#dayButtons .button.active").dataset.value;
        var selectedHour = document.querySelector("#hourButtons .button.active").dataset.value;

        var selectedDate = new Date(selectedYear, selectedMonth - 1, selectedDay, selectedHour);

        if (selectedDate < currentDate) {
            alert("선택된 날짜와 시간이 과거입니다. 예매가 불가능합니다.");
        } else {
            alert("선택된 날짜: " + selectedYear + "-" + selectedMonth + "-" + selectedDay + "\n선택된 상영 시간: " + (selectedHour < 12 ? "오전 " + selectedHour : "오후 " + (selectedHour - 12)) + ":00");
        }
    });

    // 선택 버튼 생성 함수
    function populateButtons(start, end, buttonGroup) {
        var buttonsHTML = "";
        var selectedYear = parseInt(document.querySelector("#yearButtons .button.active")?.dataset.value) || currentYear;
        var selectedMonth = parseInt(document.querySelector("#monthButtons .button.active")?.dataset.value) || currentMonth;

        for (var i = start; i <= end; i++) {
            var isPast = false;

            if (buttonGroup === "yearButtons") {
                isPast = i < currentYear;
            } else if (buttonGroup === "monthButtons") {
                isPast = selectedYear == currentYear && i < currentMonth;
            } else if (buttonGroup === "dayButtons") {
                isPast = selectedYear == currentYear && selectedMonth == currentMonth && i < currentDay;
                // 해당 월의 마지막 일을 확인하여 그 이상의 일수는 생성하지 않음
                var lastDayOfMonth = new Date(selectedYear, selectedMonth, 0).getDate();
                if (i > lastDayOfMonth) {
                    continue; // 이번 달의 마지막 날짜를 넘어서는 일은 버튼 생성에서 제외
                }
            } else if (buttonGroup === "hourButtons") {
                isPast = selectedYear == currentYear && selectedMonth == currentMonth && selectedDay == currentDay && i < currentHour;
            }

            if (isPast) {
                buttonsHTML += `<button class="button disabled" data-value="${i}" disabled>${i < 10 ? '0' + i : i}</button>`;
            } else {
                buttonsHTML += `<button class="button" data-value="${i}">${i < 10 ? '0' + i : i}</button>`;
            }
        }

        document.getElementById(buttonGroup).innerHTML = buttonsHTML;

        // 생성된 버튼에 클릭 이벤트 추가
        var buttons = document.querySelectorAll("#" + buttonGroup + " .button:not(.disabled)");
        buttons.forEach(function (button) {
            button.addEventListener("click", function () {
                setActive(buttonGroup, button.dataset.value);
                // 다음 단계 버튼 활성화 및 생성
                switch (buttonGroup) {
                    case "yearButtons":
                        monthButtons.style.display = "block";
                        populateButtons(1, 12, "monthButtons");
                        break;
                    case "monthButtons":
                        dayButtons.style.display = "block";
                        populateButtons(1, 31, "dayButtons"); // 마지막 일자는 dayButtons에서 처리
                        break;
                    case "dayButtons":
                        hourButtons.style.display = "block";
                        populateHourButtons(0, 23); // 시간 버튼 생성 함수 호출
                        break;
                }
            });
        });
    }

    // 시간 선택 버튼(hourButtons) 생성 함수
    function populateHourButtons(start, end) {
        var buttonsHTML = "";

        for (var i = start; i <= end; i++) {
            var hour = i < 10 ? "0" + i : i;
            var period = i < 12 ? "오전" : "오후"; // 시간이 12 미만이면 오전, 그렇지 않으면 오후로 설정
            var displayHour = i <= 12 ? i : i - 12; // 12 이상인 경우 12를 빼서 오후 표시를 위해 수정
            var time = period + " " + (displayHour < 10 ? "0" + displayHour : displayHour) + ":00";

            buttonsHTML += `<button class="button" data-value="${hour}">${time}</button>`;
        }

        document.getElementById("hourButtons").innerHTML = buttonsHTML;

        // 생성된 버튼에 클릭 이벤트 추가
        var buttons = document.querySelectorAll("#hourButtons .button");
        buttons.forEach(function (button) {
            button.addEventListener("click", function () {
                setActive("hourButtons", button.dataset.value);
            });
        });
    }
</script>
</html>
