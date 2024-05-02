<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<style>
body {
	margin: 0;
	padding: 0;
	overflow: hidden;
}

.container {
	position: absolute; /* ìëì  ìì¹ ì§ì  */
	top: 200px; /* ìë¨ì¼ë¡ë¶í° 200px ìëë¡ ì´ë */
	left: 10.4%;
	display: flex;
	flex-wrap: wrap;
}

.box {
	flex: 0 0 auto;
	margin: 10px;
}

.regionbox, .moviebox {
	width: 222px;
	height: 62px;
	background: #d9d9d9;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 10px;
	cursor: pointer;
	/* ë§ì°ì¤ ì»¤ìë¥¼ í¬ì¸í°ë¡ ë³ê²½íì¬ í´ë¦­ ê°ë¥í ìíë¡ ë§ë­ëë¤. */
}

.moviebox {
	order: 1; /* ìì ë³ê²½ */
}

.bigbox {
	width: 100%; /* ë¶ëª¨ ììì ë§ê² ê°ë ì°¨ëë¡ ì¤ì  */
	max-width: 1900px;
	height: 600px;
	background: #d9d9d9;
	padding: 30px;
	position: absolute; /* ìëì  ìì¹ ì§ì  */
	top: 50%; /* íë©´ì ìë¨ìì 50% ë¨ì´ì§ ìì¹ */
	left: 50%; /* íë©´ì ì¼ìª½ìì 50% ë¨ì´ì§ ìì¹ */
	transform: translate(-50%, -50%);
	/* ììì ê°ë¡ ë° ì¸ë¡ ì¤ì ì ë ¬ */
	box-sizing: border-box;
	/* ë´ë¶ paddingê³¼ borderë¥¼ í¬í¨í í¬ê¸°ë¥¼ ì§ì í©ëë¤. */
}

.region-list {
	position: absolute; /* ì ë ìì¹ ì§ì  */
	top: 0; /* ììª½ì¼ë¡ë¶í°ì ê±°ë¦¬ */
	left: 0; /* ì¼ìª½ì¼ë¡ë¶í°ì ê±°ë¦¬ */
	font-size: 32px;
	font-weight: 100;
	color: #000;
}

.nextbox {
	width: 232px;
	height: 70px;
	background: #d9d9d9;
	position: fixed;
	bottom: 20px; /* ìíë ê±°ë¦¬ */
	right: 20px; /* ìíë ê±°ë¦¬ */
	display: flex;
	align-items: center;
	justify-content: center;
}

.next-wrapper {
	display: flex;
	align-items: center;
}

.next-icon {
	margin-right: 5px;
}

.next-text {
	font-size: 32px;
	font-weight: 500;
	color: #000;
}

/* ì½¤ë³´ë°ì¤ì ì´ê¸° ìíë¥¼ ì¨ê¹ */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* ì½¤ë³´ë°ì¤ì ì¤íì¼ */
.dropdown-content a {
	display: block;
	padding: 10px;
	text-decoration: none;
	color: #000;
}

.dropdown-content a:hover {
	background-color: #ddd;
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

	<div class="bigbox">
		<p class="region-list"></p>
	</div>

	<div class="container">
		<div class="regionbox" id="regionBox">
			<p style="font-size: 32px; font-weight: 100; text-align: left; color: #000;">지역</p>
			<svg width="10" height="6" viewBox="0 0 10 6" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M1.42857 -3.74669e-07L5 3.57143L8.57143 -6.24448e-08L10 0.714286L5 5.71429L-3.12224e-08 0.714285L1.42857 -3.74669e-07Z" fill="#252B42"></path>
            </svg>
			<div class="dropdown-content" id="dropdownContent">
				<a href="#">서울</a>
				<a href="#">부산/울산</a>
				<a href="#">대구</a>
			</div>
		</div>
		<div class="moviebox">
			<p style="font-size: 32px; font-weight: 100; text-align: left; color: #000;">영화</p>
			<svg width="10" height="6" viewBox="0 0 10 6" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M1.42857 -3.74669e-07L5 3.57143L8.57143 -6.24448e-08L10 0.714286L5 5.71429L-3.12224e-08 0.714285L1.42857 -3.74669e-07Z" fill="#252B42"></path>
            </svg>
		</div>
	</div>
	<div class="nextbox" style="width: 232px; height: 70px; background: #d9d9d9;">
		<div class="next-wrapper">
			<svg class="next-icon" width="14" height="14" viewBox="0 0 14 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 20.5714L8.57143 12L0 3.42857L1.71429 0L13.7143 12L1.71429 24L0 20.5714Z" fill="#23A6F0"></path>
            </svg>
			<p class="next-text">NEXT</p>
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
		// ì§ì­ ììë¥¼ í´ë¦­íì ë ì½¤ë³´ë°ì¤ë¥¼ í ê¸íë í¨ì
		document.getElementById("regionBox").addEventListener("click",
				function() {
					var dropdown = document.getElementById("dropdownContent");
					// ì½¤ë³´ë°ì¤ì display ìì±ì ë³ê²½íì¬ í ê¸í©ëë¤.
					if (dropdown.style.display === "block") {
						dropdown.style.display = "none";
					} else {
						dropdown.style.display = "block";
					}
				});
	</script>
</body>
</html>
