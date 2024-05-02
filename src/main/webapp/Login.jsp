<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	padding: 0;
	background-color: #f3f4f6;
	background-image: url('bodybackground.png');
	background-size: cover;
	background-position: center;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 60px;
	max-width: 90%;
	padding: 60px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.container p {
	max-width: 100%;
	text-align: center;
	margin: 0;
}

.input-container {
	width: 100%;
	max-width: 100%;
	display: flex;
	flex-direction: column;
	gap: 1rem;
}

.input-container input {
	width: 100%;
	max-width: 100%;
	height: 2.5rem;
	padding: 0.5rem;
	border: 1px solid #d1d5db;
	border-radius: 4px;
	outline: none;
}

.submit-button {
	width: 100%;
	max-width: 100%;
	height: 3rem;
	padding: 0.5rem;
	background-color: #000;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.text-sm font-medium text-left text-black, a {
	font-weight: bold;
}
</style>
</head>
<body>
	<form action="/login" method="get">
		<div class="container">
			<h1 class="text-2xl font-bold text-black">로그인</h1>
			<div class="input-container">
				<label for="id" class="text-sm font-medium text-left text-black">ID</label> <input type="text" id="id" name="id" placeholder="ID를 입력하세요" />
			</div>
			<div class="input-container">
				<label for="password" class="text-sm font-medium text-left text-black">Password</label> <input type="password" id="password" name="password" />
			</div>
			<button type="submit" class="submit-button">Login</button>
			<div class="additional-links">
				<a href="SignUp.jsp" class="text-sm text-black">회원가입</a>
				<span class="text-sm text-black mx-2">|</span>
				<a href="FindID.jsp" class="text-sm text-black">아이디 찾기</a>
				<span class="text-sm text-black mx-2">|</span>
				<a href="FindPassword.jsp" class="text-sm text-black">비밀번호 찾기</a>
			</div>
		</div>
	</form>
	<script>
		const emailInput = document.getElementById('id');
		const passwordInput = document.getElementById('password');

		// 이벤트 리스너를 사용하여 스페이스바 입력 방지
		emailInput.addEventListener('input', function(event) {
			this.value = this.value.replace(/\s/g, ''); // 공백을 제거
		});

		passwordInput.addEventListener('input', function(event) {
			this.value = this.value.replace(/\s/g, ''); // 공백을 제거
		});

		const form = document.querySelector('form');

		form.addEventListener('submit', function(event) {
			const emailValue = emailInput.value;
			const passwordValue = passwordInput.value;

			if (!emailValue || !passwordValue) {
				event.preventDefault();
				alert("입력값이 없습니다. 입력란을 확인해주세요.");
			}
		});
	</script>
</body>
</html>
