<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Combined Page</title>
<style>
body, html {
	height: 100%;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px 50px 60px; /* 조정된 padding */
	gap: 60px;
	overflow: hidden;
	max-width: 1200px; /* 가로 사이즈 조정 */
	margin: 0 auto; /* 수평 가운데 정렬 */
	margin-top: 200px; /* container를 아래로 이동 */
}

.section {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	flex-grow: 1;
	max-width: 50%;
	height: 500px;
	overflow: hidden;
	gap: 12px;
}

.section-inner {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	padding: 12px;
	border-radius: 8px;
	background-color: #c8b8b8;
	cursor: pointer;
}

.section-content {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
}

.section-text {
	font-size: 48px;
	font-weight: 500;
	text-align: center;
	color: #fff;
	margin: 0;
}

.divider-svg {
	width: 100%;
	flex-shrink: 0;
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
	font-weight: bold;
	box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.1);
	font-weight: bold;
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

	<div class="container">
		<div class="section" onclick="gotoNext(this)">
			<!-- 페이지로 이동 -->
			<div class="section-inner">
				<div class="section-content">
					<p class="section-text">일반예매</p>
				</div>
			</div>
		</div>
		<div class="section" onclick="gotoNext(this)">
			<div class="section-inner">
				<div class="section-content">
					<p class="section-text">주변예매</p>
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
	function gotoNext(element) {
		// 요소 내부의 p값을 가져오기
		var sectionText = element.querySelector('.section-text').textContent;
		// 현재 페이지 URL에서 쿼리 문자열 가져오기
		var queryString = window.location.search;
		// URLSearchParams 객체 생성
		var urlParams = new URLSearchParams(queryString);
		// movieName 매개변수 값 가져오기
		var title = urlParams.get('title');
		var url;

		if (sectionText === "일반예매") {
			url = "BookPage.jsp";
		} else {
			url = "MapPage.jsp";
		}

		// movieName이 존재하는지 확인하여 쿼리 문자열을 다르게 생성합니다.
		if (title) {
			url += "?title=" + encodeURIComponent(title);
		}
		// 생성한 URL로 페이지를 이동합니다.
		window.location.href = url;
	}
</script>

</html>
