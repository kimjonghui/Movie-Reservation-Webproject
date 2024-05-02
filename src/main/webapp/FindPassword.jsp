<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Find Password</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
html, body {
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	background-color: #FFF9F0;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
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
	width: 50%;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
}

.input-label {
	margin-bottom: 5px;
	text-align: left;
	font-weight: bold;
}

.input, .Change-Password {
	border: 1px solid #e2e8f0;
	border-radius: 0.25rem;
	padding: 1rem;
	width: 100%;
	font-size: 1rem;
	box-sizing: border-box;
}

.Change-Password {
	background-color: #000;
	color: #fff;
	cursor: pointer;
	margin-top: 20px;
	width: 30%;
	align-self: center;
	border-radius: 8px;
}

.Change-Password:hover {
	background-color: #333;
}

.send-email, .CheckNumber {
	background-color: #000;
	color: #fff;
	cursor: pointer;
	margin-top: 20px;
	width: 100%;
	align-self: center;
	border-radius: 8px;
	height: 50px;
}

.send-email:hover, .CheckNumber:hover {
	background-color: #333;
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
		<p class="text-2xl font-bold text-center">Find Password</p>
		<div class="input-group">
			<span class="input-label">ID</span> <input type="text" id="id" name="id" placeholder="ID" class="input" />
		</div>
		<div class="input-group">
			<span class="input-label">Email</span> <input type="email" id="email" name="email" placeholder="Your email" class="input" />
			<button type="button" class="send-email">인증번호 전송</button>
			<p id="email-verification-status"></p>
		</div>
		<div class="input-group">
			<span class="input-label">Email인증 확인</span> <input type="text" id="email-verification" name="email-verification" class="input" required />
			<button type="button" class="CheckNumber">확인</button>
			<button type="submit" class="Change-Password">NEXT</button>
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
    let idInput = document.getElementById("id"); // ID 텍스트 필드에 작성한 값
    let sendEmail = document.getElementById("email"); // email 텍스트 필드에 작성한 값
    let emailElement = document.getElementById("email-verification-status"); // email 전송성공, 실패관련 텍스트 출력 부분
    let emailCodeInput = document.getElementById("email-verification");
    let emailOkStatus = false;

    idInput.addEventListener("input", function () {
      this.value = this.value.replace(/\s/g, "");
    });

    sendEmail.addEventListener("input", function () {
      this.value = this.value.replace(/\s/g, "");
    });
    emailCodeInput.addEventListener("input", function () {
      this.value = this.value.replace(/\s/g, "");
    });

    document
      .querySelector(".send-email")
      .addEventListener("click", function () {
        fetch("/findPassword", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ email: sendEmail.value }),
        })
          .then((response) => response.text())
          .then((text) => {
            emailElement.innerText = text;
            if (text === "작성하신 Email에 인증번호가 발송되었습니다.") {
              emailElement.style.color = "green";
              alert("인증번호가 이메일로 전송되었습니다. 메일을 확인해주세요.");
            } else {
              emailElement.style.color = "red";
              alert(
                "인증번호 전송에 실패했습니다. 이메일 주소를 확인해주세요."
              );
            }
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

    //NEXT 버튼 클릭
    document
      .querySelector(".Change-Password")
      .addEventListener("click", function () {
        // ID 입력 필드 값 검사
        if (idInput.value === "") {
          alert("ID 입력란을 채워주세요.");
        } else if (sendEmail.value === "") {
          alert("이메일 입력란을 채워주세요.");
        } else if (!emailOkStatus) {
          alert("이메일 인증을 먼저 완료해주세요.");
        } else {
          fetch("/ChangePassword", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({ id: idInput.value }),
          })
            .then((response) => response.text())
            .then((text) => {
              if (text === "success") {
                window.location.href = "ChangePassword.jsp"; // 성공 시 페이지 이동
              } else {
                alert("해당 ID로 조회되는 회원정보가 존재하지 않습니다."); // 실패 시 알림
              }
            })
            .catch((error) => {
              console.error("Error:", error);
              alert("요청 처리 중 오류 발생"); // 오류 시 알림
            });
        }
      });
  </script>
</html>
