<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Chagne Password</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
html, body {
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	background-color: #FFF9F0;
}

.container {
	padding-top: 100px;
	display: flex;
	flex-direction: column;
	gap: 1rem;
	width: auto;
	margin: auto;
	padding: 2rem 2rem 200px;
}

.input-group {
	width: 50%; /* Same width as input to align labels */
	margin: 0 auto; /* Center align the group */
	display: flex;
	flex-direction: column;
}

.input-label {
	margin-bottom: 5px;
	text-align: left; /* Align label text to the left */
}

.input, .Change-password {
	border: 1px solid #e2e8f0;
	border-radius: 8px;
	padding: 1rem;
	width: 100%;
	/* Make input take full width of its parent .input-group */
	font-size: 1rem;
	box-sizing: border-box;
}

.Change-password {
	background-color: #000;
	color: #fff;
	cursor: pointer;
	margin-top: 20px; /* Space between the input and the button */
	width: 30%;
	align-self: center;
}

.Change-password:hover {
	background-color: #333;
}

.passwordconfig {
	align-self: center;
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


	<div class="container">
		<p class="text-2xl font-bold text-center">Change Password</p>
		<div class="input-group">
			<label for="password">비밀번호</label> <input type="password" id="password" name="password" class="input" required pattern="\S{4,20}" maxlength="20" title="비밀번호는 공백 없이 4자 이상 20자 이하로 입력해야 합니다." />
		</div>

		<div class="input-group">
			<label for="confirm-password">비밀번호 확인</label> <input type="password" id="confirm-password" name="confirm-password" class="input" required />
			<p id="password-match"></p>
		</div>
		<button type="submit" class="Change-password">Change</button>
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
    let passwordInput = document.getElementById("password");
    let confirmPasswordInput = document.getElementById("confirm-password");
    let passwordMatchMessage = document.getElementById("password-match");

    function checkPasswordMatch() {
      if (passwordInput.value === confirmPasswordInput.value) {
        passwordMatchMessage.textContent = "비밀번호가 일치합니다.";
        passwordMatchMessage.style.color = "green";
        passwordStatus = true;
      } else {
        passwordMatchMessage.textContent = "비밀번호가 일치하지 않습니다.";
        passwordMatchMessage.style.color = "red";
        passwordStatus = false;
      }
    }

    // 비밀번호 입력 필드 값이 변경될 때마다 확인
    passwordInput.addEventListener("input", checkPasswordMatch);
    confirmPasswordInput.addEventListener("input", checkPasswordMatch);
    // 공백 제거 기능
    function removeWhitespace(element) {
      element.value = element.value.replace(/\s/g, "");
    }

    passwordInput.addEventListener("input", function () {
      removeWhitespace(this);
    });

    confirmPasswordInput.addEventListener("input", function () {
      removeWhitespace(this);
    });

    document
      .querySelector(".Change-password")
      .addEventListener("click", function () {
        if (passwordStatus === true) {
          fetch("/ChangePassword", {
            method: "PUT",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({ password: passwordInput.value }),
          })
            .then((response) => response.text())
            .then((text) => {
              if (
                passwordStatus === true &&
                text === "새 비밀번호가 현재 비밀번호와 동일합니다."
              ) {
                alert(text);
              } else {
                alert(text + "로그인 페이지로 돌아가 다시 로그인 해주세요.");
                window.location.href = "Login.jsp";
              }
            })
            .catch((error) => {
              console.error("Error:", error);
            });
        } else {
          alert("비밀번호 일치 확인 메세지를 확인해주세요.");
        }
      });
  </script>
</html>
