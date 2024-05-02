<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap"
	rel="stylesheet">
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
}

.section {
	width: 90%;
	max-width: 500px;
	padding: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 20px;
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

.signup-button {
	width: 100%;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 8px;
	padding: 10px 15px;
	margin-top: 10px;
	background-color: #000;
	color: #fff;
}

.signup-button:hover {
	background-color: #6b7280;
}

h1 {
	margin-top: 30px;
}

.signup-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	width: 100%;
	padding: 50px 0;
	background-color: #FFF9F0;
	font-family: 'Playfair Display', sans-serif;
	font-weight: bold;
}

h1 {
	color: #8b572a;
	margin-bottom: 20px;
}

.signup-form {
	display: flex;
	flex-direction: column;
	gap: 15px;
	width: 300px;
}

.signup-form input[type=text], .signup-form input[type=email],
	.signup-form input[type=password] {
	border: 2px solid #8b572a;
	border-radius: 5px;
	padding: 10px;
	font-size: 16px;
}

.signup-form input[type=submit] {
	background-color: #8b572a;
	color: white;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.2s;
}

.signup-form input[type=submit]:hover {
	background-color: #a67c52;
}

@media ( max-width : 768px) {
	.signup-container {
		padding: 30px;
	}
}

span {
	font-weight: bold;
	font-family: 'Playfair Display', sans-serif;
}
</style>
</head>
<body>
	<div class="header-container">
		<img src="Logo.png" alt="Logo" class="logo" /> <a class="title"
			href="MainPage.jsp">cinematch</a>
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
 %> <%=userID%></span> / <a href="Logout.jsp">Logout</a>
				<%
				} else {
				%>
				<a href="Login.jsp">Login</a> / <a href="SignUp.jsp">Sing Up</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<div class="signup-container">
		<form class="section" action="/signup" method="post" id="signupForm">
			<h1 class="text-4xl font-bold mb-8">회원가입</h1>

			<div class="input-container">
				<label for="id">ID</label> <input type="text" id="id" name="id"
					placeholder="ID" class="input" required />
				<button type="button" class="IdDoubleCheck">중복확인</button>
				<p id="message"></p>
			</div>

			<div class="input-container">
				<label for="password">비밀번호</label> <input type="password"
					id="password" name="password" class="input" required
					pattern="\S{4,20}" maxlength="20"
					title="비밀번호는 공백 없이 4자 이상 20자 이하로 입력해야 합니다." />
			</div>

			<div class="input-container">
				<label for="confirm-password">비밀번호 확인</label> <input type="password"
					id="confirm-password" name="confirm-password" class="input"
					required />
				<p id="password-match"></p>
			</div>

			<div class="input-container">
				<label for="phone">전화번호</label> <input type="tel" id="phone"
					name="phone" placeholder="010-XXXX-XXXX" class="input" required
					pattern="010-[0-9]{4}-[0-9]{4}"
					title="전화번호는 '010-XXXX-XXXX' 형태로 입력해주세요." />
				<p id="phone-message"></p>
			</div>

			<div class="input-container">
				<label for="email">Email</label> <input type="email" id="email"
					name="email" placeholder="ex)XXXXXXX@naver.com" class="input"
					required />
				<button type="button" class="send-email">인증번호 전송</button>
				<p id="email-verification-status"></p>
			</div>

			<div class="input-container">
				<label for="email-verification">Email인증번호</label> <input type="text"
					id="email-verification" name="email-verification" class="input"
					required />
				<button type="button" class="CheckNumber">확인</button>
			</div>

			<button type="submit" class="signup-button">회원가입</button>
		</form>
	</div>

	<script>
      let sendIdCheck = document.getElementById("id");
      let messageElement = document.getElementById("message");
      let passwordInput = document.getElementById("password");
      let confirmPasswordInput = document.getElementById("confirm-password");
      let passwordMatchMessage = document.getElementById("password-match");
      let sendEmail = document.getElementById("email");
      let emailElement = document.getElementById("email-verification-status");
      let phoneInput = document.getElementById("phone");
      let phoneMessage = document.getElementById("phone-message");
      let signUpButton = document.querySelector(".signup-button");
      let form = document.getElementById('signupForm');
      
      let idStatus = false; // id중복확인과 관련해서 논리값 부여 초기화 하지 않을시 기본값 undefined임.
      let passwordStatus = false; // password일치 관련해서 논리값 부여 초기화 하지 않을시 기본값 undefined임.
      let phoneNumberStatus = false; // 전화번호 관련 논리값 부여 초기화 하지 않을시 기본값 undefined임.
      let emailOkStatus = false; // email인증성공과 관련해서 논리값 부여 초기화 하지 않을시 기본값 undefined임.
      
   // 입력된 텍스트를 모두 소문자로 변환하는 함수
      function convertToLowerCase(inputElement) {
        inputElement.value = inputElement.value.toLowerCase(); // 입력된 값을 소문자로 변환하여 다시 할당
      }

      // 모든 텍스트 필드에 대해 소문자 변환 이벤트 추가
      document.querySelectorAll('input[type="text"], input[type="email"], input[type="password"], input[type="tel"]').forEach(function(inputElement) {
        inputElement.addEventListener('input', function() {
          convertToLowerCase(this); // 텍스트가 입력될 때마다 소문자 변환 함수 호출
        });
      });
    	// ID 필드에서 공백 제거 기능
      sendIdCheck.addEventListener("input", function () {
        this.value = this.value.replace(/\s+/g, ""); // 공백을 제거합니다.
      });
      sendIdCheck.addEventListener("input", function() {
          // 사용자가 ID 입력 후 중복검사를 했는데, 다시 ID를 수정하는 경우
          if (idStatus) {
              messageElement.textContent = "다시 중복 검사를 진행해주세요.";
              messageElement.style.color = "red";
              idStatus = false; // idStatus 상태를 false로 업데이트
          }
      });
      document
        .querySelector(".IdDoubleCheck")
        .addEventListener("click", function () {
          // 입력값에서 앞뒤 공백을 제거(trim)
          let trimmedId = sendIdCheck.value.trim();
          if (trimmedId === "") {
            messageElement.textContent = "ID를 입력해주세요.";
            messageElement.style.color = "red";
            idStatus = false;
          } else {
            // ID 값이 비어있지 않은 경우에만 서버에 요청
            fetch("/SignUpVer?id=" + encodeURIComponent(trimmedId))
              .then((response) => response.text())
              .then((text) => {
                messageElement.innerText = text;
                // 응답 텍스트에 따라 메시지 색상 변경
                if (text === "해당 ID는 사용이 불가능합니다.") {
                  messageElement.style.color = "red";
                  idStatus = false;
                } else if (text === "해당 ID는 사용이 가능합니다.") {
                  messageElement.style.color = "green";
                  idStatus = true;
                }
              });
          }
        });

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

      // 인증번호 전송 버튼 클릭
      document
        .querySelector(".send-email")
        .addEventListener("click", function () {
          console.log(sendEmail.value);
          fetch("/email?email=" + sendEmail.value)
            .then((response) => response.text())
            .then((text) => {
              // 여기를 수정했습니다
              emailElement.innerText = text; // 서버로부터 전송 받은 텍스트 표시
              if (text === "사용 가능한 Email 입니다.") {
                emailElement.style.color = "green";
                alert(
                  "인증번호가 이메일로 전송되었습니다. 메일을 확인해주세요."
                );
              } else {
                emailElement.style.color = "red";
                alert(
                  "인증번호 전송에 실패했습니다. 이메일 주소를 확인해주세요."
                );
              }
            })
            .catch((error) => {
              console.error("Error:", error);
              alert("오류가 발생했습니다. 다시 시도해주세요.");
            });
        });

      // 확인 버튼 클릭
      document
        .querySelector(".CheckNumber")
        .addEventListener("click", function () {
          let inputCode = document.getElementById("email-verification");

          fetch("/email", {
            method: "POST", // 요청 방식을 POST로 설정
            headers: {
              "Content-Type": "application/x-www-form-urlencoded", // 요청 본문의 형식을 URL 인코딩된 폼 데이터로 지정
            },
            body: "code=" + encodeURIComponent(inputCode.value), // 서버로 보낼 데이터. 입력된 인증번호를 'code' 파라미터에 할당
          })
            .then((response) => response.text()) // 서버로부터의 응답을 텍스트로 변환
            .then((text) => {
              // 서버 응답 처리 (예: 인증 결과에 따른 알림 표시)
              if (text === "valid") {
                alert("인증 성공!");
                emailOkStatus = true;
              } else {
                alert("인증 실패. 인증번호를 다시 확인해주세요.");
                emailOkStatus = false;
              }
            })
            .catch((error) => {
              console.error("Error:", error);
              alert("인증 과정에서 오류가 발생했습니다. 다시 시도해주세요.");
            });
        });

      // 전화번호 양식에 올바르게 작성하였는지 확인
      phoneInput.addEventListener("input", function () {
        // 정규 표현식을 사용하여 입력값 검사
        let phonePattern = /^010-[0-9]{4}-[0-9]{4}$/;
        if (phonePattern.test(phoneInput.value)) {
          phoneMessage.textContent = "올바른 전화번호 형식입니다.";
          phoneMessage.style.color = "green";
          phoneNumberStatus = true;
        } else {
          phoneMessage.textContent =
            "전화번호 형식이 올바르지 않습니다. '010-XXXX-XXXX' 형태로 입력해주세요.";
          phoneMessage.style.color = "red";
          phoneNumberStatus = false;
        }
      });

      form.addEventListener('submit', function(event) {
          if (idStatus && passwordStatus && emailOkStatus && phoneNumberStatus) {
          }else {
        	  if (!idStatus) alert("ID 중복확인을 진행해주세요.");
              else if (!passwordStatus) alert("비밀번호가 일치하지 않습니다.");
              else if (!emailOkStatus) alert("이메일 인증을 완료해주세요.");
              else if (!phoneNumberStatus) alert("전화번호 형식이 올바르지 않습니다.");
              else alert("모든 필드를 올바르게 채워주세요.");
          }
      });
    </script>
</body>
</html>
