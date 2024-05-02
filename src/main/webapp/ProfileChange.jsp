
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원정보변경</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
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
	display: flex; /* Flexbox 레이아웃 사용 */
	flex-direction: column; /* 자식 요소들을 세로로 정렬 */
	align-items: flex-start; /* 좌측 정렬 */
	width: 100%; /* 부모 컨테이너의 너비에 맞게 설정 */
	max-width: 500px; /* 최대 너비 설정 */
	margin: 0 auto; /* 좌우 마진을 auto로 설정하여 가로 중앙 정렬 */
}

/*.input {
	width: 100%;
	height: 50px;
	padding: 0 15px;
	border: 1px solid #d1d5db;
	border-radius: 8px;
	outline: none;
}*/
.input {
	width: 100%; /* 너비를 70%로 설정하여 .input-container 내부에서 중앙 정렬 */
	margin-left: auto; /* 왼쪽 마진을 auto로 설정하여 우측 정렬 */
	margin-right: auto; /* 오른쪽 마진을 auto로 설정하여 좌측 정렬 */
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
	width: 100%;
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
	width: 100%;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 8px;
	padding: 10px 15px;
	margin-top: 10px;
	background-color: #000;
	color: #fff;
	cursor: pointer;
}

.send-email:hover {
	background-color: #6b7280;
}

.CheckNumber {
	width: 100%;
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

.Change-button {
	width: 26%;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius: 8px;
	padding: 10px 15px;
	margin-top: 10px;
	background-color: #000;
	color: #fff;
}

.Change-button:hover {
	background-color: #6b7280;
}

body {
	background-color: #FFF9F0;
}

h1 {
	margin-top: 30px;
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

label {
	font-weight: bold;
	font-family: 'Playfair Display', sans-serif;
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
	<h1 class="text-4xl font-bold mb-8">회원정보변경</h1>

	<div class="input-container">
		<label for="id">ID</label> <input type="text" id="id" name="id" placeholder="ID" class="input" required value=<%=authID%> readonly />
	</div>

	<div class="input-container">
		<label for="phone">전화번호</label> <input type="tel" id="phone" name="phone" placeholder="010-XXXX-XXXX" class="input" required pattern="010-[0-9]{4}-[0-9]{4}" title="전화번호는 '010-XXXX-XXXX' 형태로 입력해주세요." value=<%=authPhoneNumber%> />
		<p id="phone-message"></p>
	</div>

	<div class="input-container">
		<label for="email">Email</label> <input type="email" id="email" name="email" placeholder="ex)XXXXXXX@naver.com" class="input" required value=<%=authEmail%> />
		<button type="button" class="send-email">인증번호 전송</button>
		<p id="email-verification-status"></p>
	</div>

	<div class="input-container">
		<label for="email-verification">Email인증번호</label> <input type="text" id="email-verification" name="email-verification" class="input" required />
		<button type="button" class="CheckNumber" id="verifyButton">확인</button>
	</div>

	<button type="submit" class="Change-button">변경하기</button>

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
		let sessionEmail = document.getElementById('email').value;
	    let sessionPhoneNumber = document.getElementById('phone').value; // 세션에서 저장된 전화번호
	    let sessionID = document.getElementById('id').value;
	
	    let phoneMessage = document.getElementById('phone-message'); // 전화번호 메시지 엘리먼트
	    let emailVerificationStatus = document.getElementById('email-verification-status');
	
	    let emailSame = true; // 이메일 세션값고 동일 여부
	    let phoneNumberSame = true; // 전화번호 세션값과 동일 여부
	    let emailCode = true; // 코드 인증 여부
	    
	    let emailOkStatus = false; // email 코드 발송 여부
	
	    // 이메일 필드 이벤트 리스너
	    document.getElementById('email').addEventListener('input', function() {
	        let email = this.value; // 현재 이메일 필드의 값
	        emailSame = (email === sessionEmail);
	        if (emailSame) {
	            emailVerificationStatus.innerText = "기존 이메일과 동일한 이메일 입니다.";
	            emailVerificationStatus.style.color = "green";
	            emailSame = true;
	            emailCode = true;
	            emailOkStatus = true;
	        } else {
	            emailVerificationStatus.innerText = "인증번호 전송 버튼을 클릭해주세요.";
	            emailVerificationStatus.style.color = "red";
	            emailSame = false;
	            emailCode = false;
	            emailOkStatus = false;
	        }
	    });
	
	    // 전화번호 필드 이벤트 리스너
	    document.getElementById('phone').addEventListener('input', function() {
	        let phoneNumber = this.value; // 현재 전화번호 필드의 값
	        phoneNumberSame = (phoneNumber === sessionPhoneNumber);
	        if (phoneNumberSame) {
	            phoneMessage.innerText = "기존 전화번호와 동일한 전화번호입니다.";
	            phoneMessage.style.color = "green";
	            phoneNumberSame = true;
	        } else {
	            phoneMessage.innerText = "전화번호 변경";
	            phoneMessage.style.color = "black"; // 텍스트 색상을 기본값(또는 원하는 색상)으로 변경
	            phoneNumberSame = false;
	        }
	    });
	
	
		document.querySelector('.send-email').addEventListener('click', function() {
	    let email = document.getElementById('email').value; // 사용자가 변경할 수 있는 이메일 필드 값
	    let emailVerificationStatus = document.getElementById('email-verification-status');
	    if (sessionEmail === email) {
	        alert("기존 이메일과 동일하여 인증번호를 전송할 수 없습니다.");
	        emailVerificationStatus.innerText = "기존 이메일과 동일하여 인증번호를 전송할 수 없습니다.";
	        emailVerificationStatus.style.color = "red";
	        emailOkStatus =true;
	    } else {
	        fetch("/email?email=" + email) // 서버에 인증번호 전송 요청
	            .then(response => response.text())
	            .then(text => {
	                emailVerificationStatus.innerText = text; // 서버 응답 표시
	                if (text === "사용 가능한 Email 입니다.") {
	                    emailVerificationStatus.style.color = "green";
	                    alert("인증번호가 이메일로 전송되었습니다. 메일을 확인해주세요.");
	                    emailOkStatus = true;
	                } else {
	                    emailVerificationStatus.style.color = "red";
	                    alert("인증번호 전송에 실패했습니다. 이메일 주소를 확인해주세요.");
	                    emailOkStatus = false;
	                }
	            })
	            .catch(error => {
	                console.error("Error:", error);
	                alert("오류가 발생했습니다. 다시 시도해주세요.");
	            });
	    }
	});
	
			document.querySelector('.CheckNumber').addEventListener('click',
					function() {
				let emailVerification = document.getElementById('email-verification').value;
			    if (emailOkStatus) {
			        fetch("/email", {
			            method: "POST", // 요청 방식을 POST로 설정
			            headers: {
			                "Content-Type": "application/x-www-form-urlencoded", // 요청 본문의 형식 지정
			            },
			            body: "code=" + encodeURIComponent(emailVerification) // 서버로 보낼 데이터. 입력된 인증번호를 'code' 파라미터에 할당
			        })
			        .then(response => {
			            if (!response.ok) {
			                throw new Error('Network response was not ok');
			            }
			            return response.text(); // 서버로부터의 응답을 텍스트로 변환
			        })
			        .then(text => {
			            // 서버 응답 처리 (예: 인증 결과에 따른 알림 표시)
			            if (text === "valid") {
			                alert("인증 성공!");
			                emailCode = true; // 인증 성공 상태 업데이트
			            } else {
			                alert("인증 실패. 인증번호를 다시 확인해주세요.");
			                emailCode = false; // 인증 실패 상태 업데이트
			            }
			        })
			        .catch(error => {
			            console.error("Error:", error);
			            alert("인증 과정에서 오류가 발생했습니다. 다시 시도해주세요.");
			        });
			    } else {
			        // 이메일 변경 없이 인증번호 확인 시도 시
			        alert("전송한 인증번호가 존재하지 않습니다.");
			    }
			});
	
			document.querySelector('.Change-button').addEventListener('click', function() {
				  let email = document.getElementById('email').value; // 사용자가 수정한 이메일 값
				    let phoneNumber = document.getElementById('phone').value; // 사용자가 수정한 전화번호 값 
				let changeData = {
					        id: sessionID, 
					        email: email,
					        phoneNumber: phoneNumber
					    };
				
				if (emailSame && emailCode && phoneNumberSame) {
			        // 이메일과 전화번호 모두 변경되지 않았다면 알림을 표시하고 MyPage로 리다이렉션
			        alert("변경된 정보가 없습니다. MyPage로 돌아갑니다.");
			        window.location.href = "MyPage.jsp";
			    } else if(!emailOkStatus){
			    	alert("인증번호 전송을 하지 않았습니다. 인증번호를 발급 받아주세요.")
			    } else if(!emailCode){
			    	alert("이메일에 발송된 인증 번호확인 하여 입력후 확인 버튼을 눌러주세요")
			    } else {
			        fetch("/change", {
			            method: "PUT",
			            headers: {
			                "Content-Type": "application/json",
			            },
			            body: JSON.stringify(changeData)
			        }).then((response) => response.text())
			        .then((text) => {
			            // 서버로부터의 텍스트 응답을 처리하는 부분
			            if (text === "회원 정보가 성공적으로 업데이트 되었습니다.") {
			                alert("회원 정보가 성공적으로 변경되었습니다.");
			                window.location.href = "MyPage.jsp"; // 예를 들어, MyPage로 리다이렉션
			            } else {
			                // 서버 응답이 기대한 메시지와 다를 경우
			                alert("회원 정보 변경에 실패했습니다: " + text);
			            }
			        }).catch((error) => {
			            console.error("Error:", error);
			            alert("오류가 발생했습니다. 다시 시도해 주세요."); // 에러 처리 로직
			        });
			    }
			});
		</script>
</body>
</html>
