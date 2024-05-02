<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="true"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Seat Reservation</title>
</head>
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
}

.seat {
	display: inline-block;
	width: 40px;
	height: 40px;
	border: 1px solid black;
	margin: 5px;
	text-align: center;
	line-height: 30px;
}

.seats-container {
	width: 800px;
	height: 500px;
	flex-direction: row;
	margin: 100px auto 1% auto;
	display: flex;
}

.seats1, .seats4 {
	width: 21%;
	height: 100%;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	left: 40%; /* ì¡°ì •í•  ê±°ë¦¬ */
}

.seats2, .seats3 {
	width: 28%;
	height: 100%;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	left: 40%; /* ì¡°ì •í•  ê±°ë¦¬ */
}

.seat-booked {
	background-color: blueviolet;
	width: 40px;
	height: 40px;
	margin: 5px;
	border: 1px solid black;
	display: flex;
	justify-content: center;
	align-items: center;
}

.seat-selected {
	width: 40px;
	height: 40px;
	margin: 5px;
	border: 1px solid black;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #23a6f0; /* 선택된 좌석 배경색 */
	color: #fff; /* 선택된 좌석 글자색 */
}

.nextbox {
	width: 232px;
	height: 70px;
	background: #d9d9d9;
	position: fixed;
	bottom: 20px; /* ì› í•˜ëŠ” ê±°ë¦¬ */
	right: 20px; /* ì› í•˜ëŠ” ê±°ë¦¬ */
	display: flex;
	align-items: center;
	justify-content: center;
}

.next-wrapper {
	display: flex;
	align-items: center;
}

.next-icon {
	margin-right: 5px;
}

.next-text {
	font-size: 32px;
	font-weight: 500;
	color: #000;
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

	<h2>좌석</h2>

	<div class="screenBoxAll">
		<div class="screenBox" style="width: 1050px; height: 116px; background: #d9d9d9; position: relative;">
			<p style="font-size: 40px; text-align: center; color: #000; position: absolute; top: -15; transform: translateY(-50%); left: 50%; transform: translateX(-50%);">스크린</p>
		</div>
	</div>

	<div class="seats-container">
		<div class="seats1">
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat">A-1</div>
			<div class="seat">A-2</div>
			<div class="seat">B-1</div>
			<div class="seat">B-2</div>
			<div class="seat">B-3</div>
			<div class="seat">C-1</div>
			<div class="seat">C-2</div>
			<div class="seat">C-3</div>
			<div class="seat">D-1</div>
			<div class="seat">D-2</div>
			<div class="seat">D-3</div>
			<div class="seat">E-1</div>
			<div class="seat">E-2</div>
			<div class="seat">E-3</div>
			<div class="seat">F-1</div>
			<div class="seat">F-2</div>
			<div class="seat">F-3</div>
			<div class="seat">G-1</div>
			<div class="seat">G-2</div>
			<div class="seat">G-3</div>
			<div class="seat">H-1</div>
			<div class="seat">H-2</div>
			<div class="seat">H-3</div>
			<div class="seat">I-1</div>
			<div class="seat">I-2</div>
			<div class="seat">I-3</div>
			<div class="seat">J-1</div>
			<div class="seat">J-2</div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
		</div>
		<div class="seats2">
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat">A-3</div>
			<div class="seat">A-4</div>
			<div class="seat">A-5</div>
			<div class="seat">B-4</div>
			<div class="seat">B-5</div>
			<div class="seat">B-6</div>
			<div class="seat">B-7</div>
			<div class="seat">C-4</div>
			<div class="seat">C-5</div>
			<div class="seat">C-6</div>
			<div class="seat">C-7</div>
			<div class="seat">D-4</div>
			<div class="seat">D-5</div>
			<div class="seat">D-6</div>
			<div class="seat">D-7</div>
			<div class="seat">E-4</div>
			<div class="seat">E-5</div>
			<div class="seat">E-6</div>
			<div class="seat">E-7</div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat">G-4</div>
			<div class="seat">G-5</div>
			<div class="seat">G-6</div>
			<div class="seat">G-7</div>
			<div class="seat">H-4</div>
			<div class="seat">H-5</div>
			<div class="seat">H-6</div>
			<div class="seat">H-7</div>
			<div class="seat">I-4</div>
			<div class="seat">I-5</div>
			<div class="seat">I-6</div>
			<div class="seat">I-7</div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat">J-3</div>
			<div class="seat">J-4</div>
			<div class="seat">J-5</div>
		</div>
		<div class="seats3">
			<div class="seat">A-6</div>
			<div class="seat">A-7</div>
			<div class="seat">A-8</div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat">B-8</div>
			<div class="seat">B-9</div>
			<div class="seat">B-10</div>
			<div class="seat">B-11</div>
			<div class="seat">C-8</div>
			<div class="seat">C-9</div>
			<div class="seat">C-10</div>
			<div class="seat">C-11</div>
			<div class="seat">D-8</div>
			<div class="seat">D-9</div>
			<div class="seat">D-10</div>
			<div class="seat">D-11</div>
			<div class="seat">E-8</div>
			<div class="seat">E-9</div>
			<div class="seat">E-10</div>
			<div class="seat">E-11</div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat">G-8</div>
			<div class="seat">G-9</div>
			<div class="seat">G-10</div>
			<div class="seat">G-11</div>
			<div class="seat">H-8</div>
			<div class="seat">H-9</div>
			<div class="seat">H-10</div>
			<div class="seat">H-11</div>
			<div class="seat">I-8</div>
			<div class="seat">I-9</div>
			<div class="seat">I-10</div>
			<div class="seat">I-11</div>
			<div class="seat">J-6</div>
			<div class="seat">J-7</div>
			<div class="seat">J-8</div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
		</div>
		<div class="seats4">
			<div class="seat">A-9</div>
			<div class="seat">A-10</div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat">B-12</div>
			<div class="seat">B-13</div>
			<div class="seat">B-14</div>
			<div class="seat">C-12</div>
			<div class="seat">C-13</div>
			<div class="seat">C-14</div>
			<div class="seat">D-12</div>
			<div class="seat">D-13</div>
			<div class="seat">D-14</div>
			<div class="seat">E-12</div>
			<div class="seat">E-13</div>
			<div class="seat">E-14</div>
			<div class="seat">F-4</div>
			<div class="seat">F-5</div>
			<div class="seat">F-6</div>
			<div class="seat">G-12</div>
			<div class="seat">G-13</div>
			<div class="seat">G-14</div>
			<div class="seat">H-12</div>
			<div class="seat">H-13</div>
			<div class="seat">H-14</div>
			<div class="seat">I-12</div>
			<div class="seat">I-13</div>
			<div class="seat">I-14</div>
			<div class="seat" style="color: white; border: #d9d9d9;"></div>
			<div class="seat">J-9</div>
			<div class="seat">J-10</div>
		</div>
	</div>
	<button id="button">nextButton</button>
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
  document.addEventListener('DOMContentLoaded', function () {
      // URL에서 쿼리 파라미터를 파싱합니다.
      var urlParams = new URLSearchParams(window.location.search);
      var theaterName = urlParams.get('theaterName');
      var screenNumber = parseInt(urlParams.get('screenNumber'), 10);
      var time = urlParams.get('time');
  
      // 좌석 정보 불러오기 및 처리
      getSeatList(theaterName, screenNumber, time).then(seatList => {
          markBookedSeats(seatList);
          initializeSeatSelection();
      }).catch(error => {
          console.error('좌석 정보를 불러오는 데 실패하였습니다:', error);
      });
  });
  
  // 좌석 선택 초기화
  function initializeSeatSelection() {
      var seats = document.querySelectorAll('.seat:not([style*="color: white"])'); // 스타일이 흰색인 좌석을 제외하고 선택
      seats.forEach(function(seat) {
          seat.addEventListener('click', function() {
              if (!seat.classList.contains('seat-booked')) {
                  seat.classList.toggle('seat-selected');
              }
          });
      });
  }

  function markBookedSeats(seatList) {
    var allSeats = document.querySelectorAll('.seat');
    seatList.forEach(seat => {
        var formattedSeat = `${seat.row}-${seat.column}`;
        allSeats.forEach(seatElement => {
            if (seatElement.textContent === formattedSeat && seat.state === 'booked') {
                seatElement.classList.add('seat-booked');
            }
        });
    });
  }

  function getSeatList(theaterName, screenNumber, time) {
      return new Promise((resolve, reject) => {
          $.ajax({
              url: '/Seat',
              type: 'GET',
              dataType: 'json',
              data: { theaterName: theaterName, screenNumber: screenNumber, time: time },
              success: function (response) {
                  if (Array.isArray(response)) {
                      resolve(response);
                  } else {
                      console.error('Unexpected response format:', response);
                      reject('Failed to retrieve seat data.');
                  }
              },
              error: function (xhr, status, error) {
                  console.error(`Request failed: ${status}, ${error}`);
                  reject('Failed to retrieve seat data from server.');
              }
          });
      });
  }
  
  function gonext() {
    var seatInfo = Array.from(document.querySelectorAll('.seat-selected'))
                        .map(seat => seat.textContent.trim()).join(" ");
    if (seatInfo.length === 0) {
        alert("자리를 선택해주세요.");
        return;
    }
    if (seatInfo.split(" ").length > 10) {
        alert("10자리 이하로 선택해 주세요");
        return;
    }

    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var theaterName = urlParams.get('theaterName');
    var title = urlParams.get('title');
    var screenNumber = urlParams.get('screenNumber');
    var time = urlParams.get('time');
    var userID = '<%=userID%>';
    $.ajax({
    url: '/Seat',
    type: 'POST',
    dataType: 'text', // JSON 대신 'text'로 설정
    data: { theaterName: theaterName, screenNumber: screenNumber, time: time, seatInfo: seatInfo ,userID: userID },
    success: function (response) {
        if (response === 'success') {
            console.log("좌석정보DB에 추가완료");
            // db에 데이터 전송이 완료된 후에 페이지 이동
            setTimeout(function() {
                var url = `payment-complete.jsp?theaterName=${encodeURIComponent(theaterName)}&screenNumber=${encodeURIComponent(screenNumber)}&title=${encodeURIComponent(title)}&seatInfo=${encodeURIComponent(seatInfo)}&time=${encodeURIComponent(time)}`;
                window.location.href = url;
            }, 100); // 100ms의 여유시간
        }
    },
    error: function(xhr, status, error) {
          console.error("서버 응답 오류:", error); // 실패시 확인차 콘솔 출력
      }
    });
  // 요청 데이터 콘솔 출력
    console.log("요청 데이터:", { theaterName: theaterName, screenNumber: screenNumber, time: time, seatInfo: seatInfo });
  }
  document.addEventListener('DOMContentLoaded', function() {
			var button = document.getElementById('button');
			// 버튼에 클릭 이벤트 리스너를 추가합니다.
			button.addEventListener('click', function() {
				// 아임포트 초기화
				const IMP = window.IMP;
				IMP.init("imp25451357"); // 아임포트에서 발급받은 가맹점 식별코드를 사용
	
				IMP.request_pay({
					pg : "kcp",
					pay_method : "card",
					//merchant_uid: "결제 번호", 자체적으로 패턴을 만들어서 식별이 가능하게 지정을 해야함  // 영화이름-시간-"A"-"01"-결제금액
					name : "Test 결제",
					amount : 14000,
					buyer_email : "Leegi52@gmail.com",
					buyer_name : "홍길동",
					buyer_tel : "010-4242-4242",
					buyer_addr : "서울특별시 강남구 신사동",
					buyer_postcode : "01181",
				}, function(rsp) { // callback
                    gonext();
					if (rsp.success) {
						alert('결제가 성공했습니다.');
                        // 테스트용으로 무조건 넘어가게 해뒀음, 추후 수정필요
					} else {
						alert('결제에 실패했습니다.');
					}
				});	
			});
		});
</script>

</html>