<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String user = (String) session.getAttribute("authID");
if (user == null) {
	response.sendRedirect("Login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>결재 내역, 정보</title>
<style>
/* 기본 페이지 스타일 */
body {
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	min-height: 100vh; /* 전체 높이 설정 */
	font-family: 'Playfair Display', sans-serif;
	background-image: url('bodybackground.png');
	background-size: cover;
	background-position: center;
}

/* 사이드바 스타일 */
.sidebar {
	position: fixed;
	width: 200px;
	height: 250px; /* 사이드바 높이 내용에 맞게 자동 조절 */
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-top: 300px;
	left: 100px;
	margin-top: 300px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	padding: 20px;
	background-color: #fff;
	width: 200px;
}

/* 사이드바 항목 스타일 */
.sidebar-item {
	margin-bottom: 10px;
	cursor: pointer;
	padding: 10px;
	border-radius: 8px;
	color: #000;
	background-color: white; /* 사이드바 아이템 배경색 */
	text-align: center; /* 텍스트 왼쪽 정렬 */
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 기본 그림자 */
}

.sidebar-item:hover {
	transform: scale(1.05); /* 호버 시 약간 확대 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강조 */
}

.sidebar-item:last-child {
	margin-bottom: 0;
}

.ticket {
	display: flex;
	width: 800px;
	height: 200px;
	background-color: #f79685;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	overflow: hidden;
	position: relative;
	margin-top: 50px;
	margin-bottom: 10px;
	text-align: center;
}

.ticket-barcode {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #fff;
	padding: 20px;
	width: 300px;
}

.ticket-info {
	color: #333333;
	padding: 20px;
	width: 100%;
	font-family: 'Playfair Display', sans-serif;
}

.ticket-title {
	font-size: 24px;
	margin: 0;
	padding: 0;
	letter-spacing: 1px;
	color: #333333;
}

.ticket-details {
	margin: 10px 0;
	font-size: 16px;
}

.ticket-details span {
	margin-left: 20px;
	
}

.ticket::after {
	content: "";
	position: absolute;
	top: -10px;
	right: -10px;
	bottom: -10px;
	left: -10px;
	background: repeating-linear-gradient(-45deg, #ff4500, #ff4500 10px, #ffffff 10px,
		#ffffff 20px);
	z-index: -1;
	border-radius: 18px;
}

.content-section {
	flex-grow: 1;
	background-color: #fff;
	padding: 40px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.user-info {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
}

/* 비밀번호 변경 버튼 스타일 */
.Cancel {
	align-self: stretch;
	cursor: pointer;
	background-color: #000;
	color: white;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding: 15px;
	border-radius: 5px;
	transition: background-color 0.2s;
}

.Cancel:hover {
	background-color: #333;
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

span {
	font-weight: bold;
	font-family: 'Playfair Display', sans-serif;
	font-size: 24px;
}

p {
	font-weight: bold;
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
				<a href="MyPage.jsp">MyPage</a>
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
	<div class="sidebar">
		<div class="sidebar-item" id="myInfo">내 정보</div>
		<div class="sidebar-item" id="Change">정보 변경</div>
		<div class="sidebar-item" id="PaymentHistory">결제 내역</div>
		<div class="sidebar-item" id="change-Password">비밀번호 변경</div>
		<div class="sidebar-item" id="delete">회원 탈퇴</div>
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
	let myInfo = document.getElementById("myInfo");
	myInfo.addEventListener("click", function() {
		window.location.href = "MyPage.jsp";
	})

	let changePassword = document.getElementById("change-Password");
	changePassword.addEventListener("click", function() {
		window.location.href = "ChangePassword.jsp";
	})
	// 함수 호출부분
	var ticketCounter = 1;
	var footer = document.querySelector('.footer');
	var userID = '<%=userID%>';
	getSeatList(userID);
	// 해당 유저가 예매한 티켓 가져오는 함수
	function getSeatList(userID) {
		$.ajax({
			url: '/Seat',
			type: 'GET',
			dataType: 'json',
			data: { userID: userID },
			success: function (response) {
				response.forEach(function(ticket) {
					var title = getTitle(ticket.theaterName, ticket.screenNumber, function(title) {
						var theaterName = ticket.theaterName + " " + ticket.screenNumber + "관";
						var seat = ticket.row + "-" + ticket.column;
						var date = formatDate(ticket.time); // 날짜 형식 변환
						makeTicket(title, theaterName, seat, date);
					});
				});
			},
			error: function (xhr, status, error) {
				console.error(`Request failed: ${status}, ${error}`);
				reject('Failed to retrieve seat data from server.');
			}
		});
	}
	// 티켓 만드는 함수
	function makeTicket(title, theater, seat, date) {
		var ticketDiv = document.createElement("div");
		var ticketID = "ticket-" + ticketCounter++; // 고유한 ID 생성
		ticketDiv.id = ticketID; // 티켓에 ID 할당
		ticketDiv.classList.add("ticket");

		var barcodeDiv = document.createElement("div");
		barcodeDiv.classList.add("ticket-barcode");

		var button = document.createElement("button");
		button.classList.add("Cancel");
		button.textContent = "예매 취소";
		button.addEventListener("click", function() {
			deleteTicket(theater,seat,date,ticketID);
		})
		barcodeDiv.appendChild(button);

		var ticketInfoDiv = document.createElement("div");
		ticketInfoDiv.classList.add("ticket-info");

		var titleDiv = document.createElement("h1");
		titleDiv.classList.add("ticket-title");
		titleDiv.textContent = title;
		var detailsTheater = document.createElement("p");
		detailsTheater.classList.add("ticket-details");
		detailsTheater.textContent = "Theater : " + theater;
		var detailsSeat = document.createElement("p");
		detailsSeat.classList.add("ticket-details");
		detailsSeat.textContent = "Seat : " + seat;
		var detailsDate = document.createElement("p");
		detailsDate.classList.add("ticket-details");
		detailsDate.textContent = "Date : " + date;
		var detailsPrice = document.createElement("p");
		detailsPrice.classList.add("ticket-details");
		detailsPrice.textContent = "Price : 14000원";

		ticketInfoDiv.appendChild(titleDiv);
		ticketInfoDiv.appendChild(detailsTheater);
		ticketInfoDiv.appendChild(detailsSeat);
		ticketInfoDiv.appendChild(detailsDate);
		ticketInfoDiv.appendChild(detailsPrice);

		ticketDiv.appendChild(barcodeDiv);
		ticketDiv.appendChild(ticketInfoDiv);
		document.body.insertBefore(ticketDiv, footer);
	}
	// 특정 상영관 특정 관의 상영 영화 제목 가져오는 함수
	function getTitle(theaterName, screenNumber, callback) {
		$.ajax({
			url: '/ScreenInfo',
			type: 'GET',
			dataType: 'json',
			data: { theaterName: theaterName, screenNumber: screenNumber },
			success: function (screenInfo) {
				callback(screenInfo.title);
			},
			error: function (xhr, status, error) {
				console.error('서버로부터 screenInfo 데이터를 가져오는 데 실패했습니다.');
			}
		});
	}
	// 날짜 형식 변환 함수
	function formatDate(dateTimeString) {
		var dateTimeParts = dateTimeString.split(':');
		var date = dateTimeParts[0].replace(/(\d{4})(\d{2})(\d{2})/, '$1년$2월$3일');
		var timeHour = dateTimeParts[1]
		var timeMin = dateTimeParts[2]
		return date + ' ' + timeHour + ':' + timeMin;
	}
	// 날짜 형식 원래대로 재변환하는 함수
	function deformatDate(dateString) {
		var parts = dateString.split(' ');
		var date = parts[0].replace(/(\d{4})년(\d{2})월(\d{2})일/, '$1$2$3');
		var time = parts[1];
		return date + ':' + time;
	}
	// 예매 취소하는 함수
	function deleteTicket(theater,seat,date,ticketID) {
		isConfirm = confirm("예매를 취소하시겠습니까?");
		if (isConfirm) {
			alert("정상적으로 취소되었습니다.");
			deleteTicketBlock(ticketID);
			deleteSeat(theater,seat,date);
		}
	}
	// 티켓을 삭제하는 함수
	function deleteTicketBlock(ticketID) {
		var ticketDiv = document.getElementById(ticketID); // 티켓 ID로 티켓 요소 가져오기
		if (ticketDiv) {
			ticketDiv.remove(); // 티켓 삭제
		}
	}
	// DB에서 예약정보를 지우는 함수
	function deleteSeat(theater,seat,date) {
		var theaterName = theater.substring(0, theater.lastIndexOf(' '));
		var screenNumber = theater.substring(theater.lastIndexOf(' ') + 1, theater.length - 1);
		var row = seat.split('-')[0];
		var column = seat.split('-')[1];
		var time = deformatDate(date);

		fetch('/Seat', {
			method: 'DELETE',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({
				theaterName: theaterName,
				screenNumber: screenNumber,
				row: row,
				column: column,
				time: time
			})
		})
		.then(response => response.text()) // 응답을 텍스트로 변환
		.then(text => {
			if(text === "success"){
				console.log(text);
			}
		})
		.catch(error => console.error('Error:', error));
	}
</script>
</html>
