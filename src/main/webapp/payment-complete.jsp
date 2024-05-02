<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link
    href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap"
    rel="stylesheet">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Insert title here</title>
<style>
body {
    margin: 0;
    padding: 0;
    flex-direction: column;
    align-items: center;
    width: 100%;
    height: 100%;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    overflow: hidden; /* 스크롤 없이 내용을 모두 표시합니다. */
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

.payment-info {
    font-size: 24px;
    font-weight: bold;
    text-align: center;
    color: #000;
    margin-top: 50px; /* 조정된 여백 */
}

.infobox {
    width: 335px;
    background: #ffffff;
    border: 2px solid #000000;
    padding: 20px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    margin-top: 20px; /* 조정된 여백 */
}

.infobox img {
    max-width: 100px;
    margin-bottom: 20px;
}

.infobox div {
    font-size: 20px;
    margin-bottom: 20px;
}

.infobox span {
    font-weight: bold;
}

.infobox .thank-you {
    font-size: 14px;
    color: #999999;
    margin-bottom: 20px;
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
    <p class="payment-info">결제 완료 정보</p>
    <div
        style="display: flex; justify-content: center; align-items: center; flex-grow: 1;">
        <div class="infobox">
            <div style="text-align: center;">
                <img src="Logo.png">
            </div>
            <div>
                <span class="userIDBlock"></span>
                <br /> <br />
                <span class = "titleBlock"></span>
                <br />
                <span class = "theaterNameBlock"></span>
                <br />
                <span class = "timeBlock"></span>
                <br />
                <span class ="seatBlock"></span>
                <br />
                <span class = "priceBlock"></span>
                <br />
            </div>
            <div class="thank-you">
                <span>We are Cinematch</span>
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
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    const userIDElement = document.querySelector(".userIDBlock");
    const titleElement = document.querySelector(".titleBlock");
    const theaterNameElement = document.querySelector(".theaterNameBlock");
    const timeElement = document.querySelector(".timeBlock");
    const seatElement = document.querySelector(".seatBlock");
    const priceElement = document.querySelector(".priceBlock");

    var userID = '<%=userID%>';
    const title = urlParams.get("title");
    const theaterName = urlParams.get("theaterName");
    const time = urlParams.get("time");
    var formattedTime = formatDate(time);

    const seatInfo = urlParams.get("seatInfo");
    const seats = seatInfo.split(" "); // 좌석 정보를 공백으로 분할하여 배열로 변환
    const seatCount = seats.length; // 좌석 수 계산

    const price = 14000 * seatCount + "원"; // 가격 계산
    console.log(title);
    userIDElement.textContent = userID + "님";
    titleElement.textContent = "영화 제목 : " + title;
    theaterNameElement.textContent = "영화관 : " + theaterName;
    timeElement.textContent = "예매 시간 : " + formattedTime;
    seatElement.textContent = "예약한 좌석 : " + seatInfo; // 좌석 정보 전체 표시
    priceElement.textContent = "총 가격 : " + price;

    function formatDate(dateString) {
        const year = dateString.substring(0, 4);
        const month = dateString.substring(4, 6);
        const day = dateString.substring(6, 8);
        const hours = dateString.substring(9, 11);
        const minutes = dateString.substring(12, 14);
        
        // YYYY/MM/DD HH:MM 형식으로 반환
        return year + '/' + month + '/' + day + ' ' + hours + ':' + minutes;
    }
</script>

</html>
