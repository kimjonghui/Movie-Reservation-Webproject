<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원 탈퇴</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<%
String authID = (session != null) ? (String) session.getAttribute("authID") : null;
String authPhoneNumber = (session != null) ? (String) session.getAttribute("authPhoneNumber") : null;
String authEmail = (session != null) ? (String) session.getAttribute("authEmail") : null;
%>
<style>
body {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	font-family: 'Playfair Display', sans-serif;
	background-color: #FFF9F0;
}

.section {
	width: 90%;
	max-width: 500px;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 20px;
	margin-bottom: 384px;
}

.input-container {
	width: 100%;
	display: flex;
	flex-direction: column;
	gap: 5px;
}

.input {
	width: 100%;
	height: 50px;
	padding: 0 15px;
	border: 1px solid #d1d5db;
	border-radius: 8px;
	outline: none;
}

.input:focus {
	border-color: #2563eb;
}

.IdDoubleCheck {
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 8px;
	padding: 10px 15px;
	margin-top: 10px;
	background-color: #000;
	color: #fff;
}

.IdDoubleCheck:hover {
	background-color: #6b7280;
}

.send-email {
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 8px;
	padding: 10px 15px;
	margin-top: 10px;
	background-color: #000;
	color: #fff;
}

.send-email:hover {
	background-color: #6b7280;
}

.CheckNumber {
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 8px;
	padding: 10px 15px;
	margin-top: 10px;
	background-color: #000;
	color: #fff;
}

.CheckNumber:hover {
	background-color: #6b7280;
}

.delete-button {
	width: 100%;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 8px;
	padding: 10px 15px;
	margin-top: 10px;
	background-color: #000;
	color: #fff;
}

.delete-button:hover {
	background-color: #6b7280;
}

h1 {
	margin-top: 30px;
}

.footer {
	width: 100%;
	position: relative; /* 페이지의 맨 아래에 위치하도록 설정 */
	bottom: 0;
	left: 0;
	background-color: #f3e9d2;
	color: #8b572a;
	text-align: center;
	padding: 20px 0;
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
	<div class="section">
		<h1 class="text-4xl font-bold mb-8">회원 탈퇴</h1>

		<div class="input-container">
			<label for="id">ID</label> <input type="text" id="id" name="id" placeholder="ID" class="input" required value=<%=authID%> disabled="disabled" />
		</div>

		<div class="input-container">
			<label for="password">비밀번호</label> <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" class="input" required />
		</div>

		<button type="button" id="delete-button" class="delete-button">탈퇴하기</button>
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
	document.getElementById('delete-button').addEventListener('click', function() {
	    let isConfirmed = confirm("회원 탈퇴 시 복구는 불가능합니다. 정말 회원 탈퇴를 하시겠습니까?");
	    if (isConfirmed) {
	        fetch('/delete', {
	            method: 'DELETE',
	            headers: {
	                'Content-Type': 'application/json',
	            },
	            body: JSON.stringify({
	                id: document.getElementById('id').value,
	                password: document.getElementById('password').value
	            })
	        })
	        .then(response => response.text()) // 응답을 텍스트로 변환
	        .then(text => {
	            if(text === "회원 탈퇴가 완료 되었습니다."){
	            alert(text);
	            window.location.href = '/MainPage.jsp';
	            } else {
	            	alert(text);
	            }
	        })
	        .catch(error => console.error('Error:', error));
	    }
	});
	</script>
</body>
</html>
