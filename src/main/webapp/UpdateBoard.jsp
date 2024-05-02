<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>게시글 수정</title>
<style>
.background-custom {
	background-color: #FFF9F0;
}

.fixed-bottom-custom {
	background-color: #f3e9d2;
	color: #8b572a;
}

body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #FFF9F0;
}

.container {
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
	padding: 20px;
	width: 50%; /* 너비를 조금 더 넓게 조정 */
	margin: 50px auto; /* 위 아래 마진 축소 */
	display: flex;
	flex-direction: column;
	gap: 20px;
	border: 1px solid #ccc; /* 경계선 추가 */
}

.input-container {
	margin-bottom: 15px;
}

.input-container label {
	font-size: 14px;
	color: #333;
	font-weight: bold;
	margin-bottom: 5px;
}

.input-container input, .input-container textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 14px;
}

.submit-button {
	background-color: #5A67D8; /* 보다 진한 파란색으로 변경 */
	color: white;
	padding: 12px 20px;
	font-size: 16px;
	border-radius: 8px; /* 더 큰 둥근 모서리 */
	cursor: pointer;
	transition: background-color 0.3s, transform 0.2s;
}

.submit-button:hover {
	background-color: #4C51BF;
	transform: scale(1.05); /* 클릭 시 버튼이 약간 커지도록 */
}

.footer {
	width: 100%;
	background-color: #f3e9d2;
	color: #8b572a;
	text-align: center;
	padding: 20px 0;
	position: fixed; /* 변경 */
	bottom: 0; /* 변경 */
	left: 0; /* 변경 */
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

	<form action="/boardWrite" method="POST" onsubmit="return validateForm()">
		<input type="hidden" id="no" name="no" value="<%=request.getParameter("no")%>">
		<div class="container">
			<div class="mb-3">
				<label for="id" class="form-label">작성자 ID (수정 불가)</label> <input type="text" class="form-control" id="id" name="id" value="<%=request.getParameter("id")%>" readonly>
			</div>
			<div class="mb-3">
				<label for="date" class="form-label">작성일 (수정 불가)</label> <input type="text" class="form-control" id="date" name="date" value="<%=URLDecoder.decode(request.getParameter("date"), "UTF-8")%>" readonly>
			</div>
			<div class="mb-3">
				<label for="title" class="form-label">제목</label> <input type="text" class="form-control" id="title" name="title" value="<%=URLDecoder.decode(request.getParameter("title"), "UTF-8")%>">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">내용</label>
				<textarea class="form-control" id="content" name="content" rows="4"><%=URLDecoder.decode(request.getParameter("content"), "UTF-8")%></textarea>
			</div>
			<button type="submit" class="btn btn-primary">수정 완료</button>
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