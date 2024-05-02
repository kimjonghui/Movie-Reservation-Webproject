<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>게시글 작성</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Playfair Display', sans-serif;
	background-color: #FFF9F0;
	padding-bottom: 70px; /* footer 높이 이상의 공간을 하단에 추가 */
}

.container {
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
	padding: 20px;
	width: 40%;
	margin: 100px auto;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.input-container label {
	display: block;
	font-weight: 500;
	margin-bottom: 10px;
}

.input-container input, .input-container textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.submit-button {
	background-color: #4a90e2;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.submit-button:hover {
	background-color: #357ABD;
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
	font-family: 'Noto Sans KR', sans-serif;
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

	<form action="/boardWrite" method="GET" onsubmit="return validateForm()">
		<div class="container">
			<h1 class="text-2xl font-bold text-black">게시글 작성</h1>
			<div class="input-container">
				작성일자:
				<%
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			String todayDate = sdf.format(date);
			%>
				<input type="hidden" id="date" name="date" value="<%=todayDate%>"> <span><%=todayDate%></span>
			</div>
			<div class="input-container">
				<label for="title" class="text-sm font-medium text-left text-black">제목</label> <input type="text" id="title" name="title" placeholder="제목을 입력하세요(20자 내로 작성해주세요.)" />
			</div>
			<div class="input-container">
				<label for="content" class="text-sm font-medium text-left text-black">내용</label>
				<textarea id="content" name="content" rows="8" placeholder="내용을 입력하세요(내용은 80자 내로 작성해주세요.)"></textarea>
			</div>
			<button type="submit" class="submit-button">작성 완료</button>
		</div>
	</form>


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
		function validateForm() {
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			if (title.trim() === "" || content.trim() === "") {
				alert("제목과 내용을 모두 입력해주세요.");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>