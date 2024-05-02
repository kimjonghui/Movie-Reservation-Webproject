<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>FindID Success</title>
<style>
body {
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	height: 100vh;
	background-color: #FFF9F0;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.content {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	flex: 1;
	justify-content: center;
	gap: 20px; /* Added gap between elements */
}

.footer {
	width: 100%;
	padding: 20px;
	text-align: center;
	background-color: #f8f9fa; /* Light grey background */
}

.back-button {
	padding: 10px 20px;
	font-size: 16px;
	color: white;
	background-color: #000000;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none; /* Remove underline from link */
}

.back-button:hover {
	background-color: gray;
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
		</div>
		<div class="navigation-item">
			<a href="Moive-reservation-Main.jsp" class="Reservation">예매</a>
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
			<%=userID%></span> /
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

	<div class="content">
		<h1><%=session.getAttribute("authEmail")%>님의 ID는
			<%=session.getAttribute("findid")%>입니다.
		</h1>
		<a href="Login.jsp" class="back-button">로그인으로 돌아가기</a>
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
	document.getElementById("return-login-button").addEventListener("click", function() {
	    fetch("/findID", {
	        method: "DELETE",
	        headers: {
	            "Content-Type": "application/json"
	        }
	    })
	    .then(response => {
	        if (response.ok) {
	            console.log("Return to login page successful");
	            // 세션 정보가 삭제된 후 로그인 페이지로 이동
	            window.location.href = "Login.jsp";
	        } else {
	            console.error("Return to login page failed");
	            // 실패 처리 로직 추가
	        }
	    })
	    .catch(error => {
	        console.error("Error:", error);
	        // 오류 처리 로직 추가
	    });
	});
	</script>
</body>
</html>
