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
<title>MyPage</title>
<style>
body {
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	min-height: 100vh;
	background-image: url('bodybackground.png');
	background-size: cover; /* 배경 이미지가 body를 전체적으로 커버하도록 설정 */
	background-position: center; /* 배경 이미지가 body의 중앙에 오도록 설정 */
}

.main-container {
	display: flex;
	flex-direction: row; /* 사이드바와 콘텐츠 섹션을 가로로 배치 */
	justify-content: flex-start; /* 내용을 왼쪽 정렬 */
	align-items: flex-start; /* 상단에서부터 정렬 */
	width: 80%;
	max-width: 1200px;
	margin-top: 200px;
	gap: 20px; /* 사이드바와 프로필 섹션 사이 간격 */
	margin-bottom: 40px;
}

.sidebar {
	width: 20%; /* 사이드바 너비 */
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.sidebar-item {
	margin-bottom: 10px;
	cursor: pointer;
	padding: 10px;
	border-radius: 5px;
	color: #000;
	background-color: white; /* 사이드바 아이템 배경색 */
	text-align: center; /* 텍스트 왼쪽 정렬 */
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	/* 애니메이션 효과 적용 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 기본 그림자 */
}

.sidebar-item:hover {
	transform: scale(1.05); /* 호버 시 약간 확대 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강조 */
}

.content-section {
	flex-grow: 1; /* 남은 공간을 콘텐츠 섹션이 차지하도록 설정 */
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.profile-section {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
}

.profile-picture {
	border-radius: 50%;
	width: 100px;
	height: 100px;
	margin-bottom: 20px;
}

.welcome-message {
	font-size: 24px;
	color: #703f2f;
	margin-bottom: 20px;
}

.user-info p {
	color: #555;
	margin: 5px 0;
}

.footer {
	width: 100%;
	background-color: #f3e9d2;
	color: #8b572a;
	text-align: center;
	padding: 20px 0;
	position: absolute; /* footer를 화면 하단에 고정 */
	bottom: 0;
	left: 0;
	font-size: 16px;
	font-family: 'Playfair Display', sans-serif;
	box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1);
}

.footer-content {
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
				<%
				String userID = (session != null) ? (String) session.getAttribute("authID") : null;
				if (userID != null) {
				%>
				<span><%=userID%></span> /
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

	<div class="main-container">
		<div class="sidebar">
			<div class="sidebar-item" id="myInfo">내 정보</div>
			<div class="sidebar-item" id="Change">정보 변경</div>
			<div class="sidebar-item" id="PaymentHistory">결제 내역</div>
			<div class="sidebar-item" id="change-Password">비밀번호 변경</div>
			<div class="sidebar-item" id="delete">회원 탈퇴</div>
		</div>

		<div class="content-section">
			<div class="profile-section">
				<img src="profile.png" alt="프로필 이미지" class="profile-picture">
				<div class="welcome-message">
					안녕하세요,
					<%=userID%>님!
				</div>
				<div class="user-info">
					<p>
						ID:
						<%=userID%></p>
					<p>
						Email:
						<%
					String userEmail = (String) session.getAttribute("authEmail");
					%>
						<%=userEmail%></p>
					<p>
						Phone:
						<%
					String userPhoneNumber = (String) session.getAttribute("authPhoneNumber");
					%><%=userPhoneNumber%>
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

	let paymentHistory = document.getElementById("PaymentHistory");
	paymentHistory.addEventListener("click", function() {
		window.location.href = "PaymentHistory.jsp";
	})

	let deleteUser = document.getElementById("delete");

	deleteUser.addEventListener("click", function() {
		let isConfirmed = confirm("회원 탈퇴 시 복구는 불가능합니다. 정말 회원 탈퇴를 하시겠습니까?");
		if (isConfirmed) {
			window.location.href = "/UserDelete.jsp";
		}
	});

	let myPage = document.getElementById("Change");
	myPage.addEventListener("click", function() {
		window.location.href = "ProfileChange.jsp";
	})
</script>
</html>


