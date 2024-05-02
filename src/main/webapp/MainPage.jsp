<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Index</title>
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
	background-image: url('bodybackground.png');
	background-size: cover;
	background-position: center;
}

.video-container {
	width: 100%;
	max-width: 1000px;
	margin-top: 40px;
	margin-bottom: 40px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	overflow: hidden;
}

video {
	width: 100%;
	height: auto;
}

.video-title {
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin-bottom: 20px;
}

.container {
	position: relative;
	width: 100%;
	height: 744px;
	margin: auto;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items: center;
}

.poster {
	position: relative;
	width: 391px;
	height: 518px;
	background-color: #d9d9d9;
	border-radius: 30px;
	margin: 0 10px;
}

.arrow-left, .arrow-right {
	width: 50px;
	height: 50px;
	fill: black;
	margin: 0 10px;
	cursor: pointer;
}

.button-container {
	display: flex;
	align-items: center;
	padding: 21px 26px;
	border: 1px solid #23a6f0;
	border-radius: 5px;
	margin: 10px;
}

.button {
	width: 15px;
	height: 25px;
	fill: #000000;
}

h1 {
	position: absolute;
	top: calc(50% - 319px);
	left: 50%;
	transform: translateX(-50%);
	font-size: 24px;
	color: black;
}

body {
	background-color: #FFF9F0;
}

.poster {
	background-color: white;
}

.arrow-left, .arrow-right {
	fill: black;
}

.poster {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease;
	background-size: cover;
	background-position: center;
}

.poster:hover {
	transform: scale(1.08);
}

.button-container:hover .button {
	fill: #eb1d36;
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
	font-size: 20px;
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

	<div class="video-container">
		<iframe width="100%" height="500" src="https://www.youtube.com/embed/-AZ7cnwn2YI?autoplay=1&mute=1&loop=1&playlist=6npFyP-fuaE,KAE5ymVLmZg,-AZ7cnwn2YI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>

	<div class="container">
		<div class="poster" id="오펜하이머"></div>
		<div class="poster" id="서울의 봄"></div>
		<div class="poster" id="아이언 맨"></div>
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
	let logo = document.querySelector('.logo');
	logo.addEventListener('click', function() {
		alert("로그인이 필요한 페이지 입니다. 로그인페이지로 이동 하시겠습니까?")
		window.location.href = "MainPage.jsp";
	});
	var userID = '<%=userID%>';

	document.querySelector('.Mypage').addEventListener('click', function(e) {
		e.preventDefault();
		if (userID === "null") {
			let isConfirmed = confirm("로그인이 필요한 페이지입니다. 로그인 페이지로 이동하시겠습니까?");
			if (isConfirmed) {
				window.location.href = "Login.jsp";
			}
		} else {
			window.location.href = "MyPage.jsp";
		}
	});

	document.querySelector('.board').addEventListener('click', function(e) {
		e.preventDefault();
		if (userID === "null") {
			let isConfirmed = confirm("로그인이 필요한 페이지입니다. 로그인 페이지로 이동하시겠습니까?");
			if (isConfirmed) {
				window.location.href = "Login.jsp";
			}
		} else {
			window.location.href = "board.jsp";
		}
	});
	
	document.querySelector('.Reservation').addEventListener('click', function(e) {
		e.preventDefault();
		if (userID === "null") {
			let isConfirmed = confirm("로그인이 필요한 페이지입니다. 로그인 페이지로 이동하시겠습니까?");
			if (isConfirmed) {
				window.location.href = "Login.jsp";
			}
		} else {
			window.location.href = "Movie-reservation-Main.jsp";
		}
	});

	// 영화 포스터 부분
	createPoster('오펜하이머');
	createPoster('서울의 봄');
	createPoster('아이언 맨');

	function createPoster(title) {
		$.ajax({
			url : '/Movie?title=' + encodeURIComponent(title),
			type : 'GET',
			dataType : 'json',
			success : function(data) {
				var imageURL = data.imageURL;
				var posters = document.querySelectorAll('.poster');
				posters.forEach(function(poster) {
					if (poster.id === title) { // 포스터의 ID가 영화 제목과 일치하는 경우
						poster.style.backgroundImage = 'url(' + imageURL + ')';
						poster.addEventListener('click', function() {
							var url = 'mvPage1.jsp?title='
									+ encodeURIComponent(title);
							window.location.href = url;
						});
					}
				});
			},
			error : function(xhr, status, error) {
				console.error('서버로부터 theater 데이터를 가져오는 데 실패했습니다.');
			}
		});
	}
</script>
</html>
