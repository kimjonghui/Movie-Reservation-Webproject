<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="true"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>좌석 배치도</title>
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

.seats-container {
	width: 1100px;
	height: 500px;
	flex-direction: row;
	margin: 100px auto 1% auto;
	display: flex;
}

.left-container {
	width: 20%;
	height: 100%;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	left: 40%;
}

.right-container {
	width: 20%;
	height: 100%;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	right: 10%;
}

.center-container {
	width: 60%;
	height: 100%;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
}

.seat {
	width: 40px;
	height: 40px;
	margin: 5px;
	border: 1px solid black;
	display: flex;
	justify-content: center;
	align-items: center;
}

.seat[style="color: white;"] {
	color: transparent;
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
	cursor: pointer; /* 포인터 모양 변경 */
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
		<div class="left-container">
			<div class="seat" style="color: white; border: 1px solid white;" name="1"></div>
			<div class="seat" style="color: white; border: 1px solid white;" name="2"></div>
			<div class="seat-booked" name="3">A-1</div>
			<div class="seat" name="4">A-2</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="21"></div>
			<div class="seat" name="22">B-1</div>
			<div class="seat" name="23">B-2</div>
			<div class="seat" name="24">B-3</div>
			<div class="seat" name="41">C-1</div>
			<div class="seat" name="42">C-2</div>
			<div class="seat" name="43">C-3</div>
			<div class="seat" name="44">C-4</div>
			<div class="seat" name="61">D-1</div>
			<div class="seat" name="62">D-2</div>
			<div class="seat" name="63">D-3</div>
			<div class="seat" name="64">D-4</div>
			<div class="seat" name="81">E-1</div>
			<div class="seat" name="82">E-2</div>
			<div class="seat" name="83">E-3</div>
			<div class="seat" name="84">E-4</div>
			<div class="seat" name="101">F-1</div>
			<div class="seat" name="102">F-2</div>
			<div class="seat" name="103">F-3</div>
			<div class="seat" name="104">F-4</div>
			<div class="seat" name="121">G-1</div>
			<div class="seat" name="122">G-2</div>
			<div class="seat" name="123">G-3</div>
			<div class="seat" name="124">G-4</div>
			<div class="seat" name="141">H-1</div>
			<div class="seat" name="142">H-2</div>
			<div class="seat" name="143">H-3</div>
			<div class="seat" name="144">H-4</div>
			<div class="seat" name="161">I-1</div>
			<div class="seat" name="162">I-2</div>
			<div class="seat" name="163">I-3</div>
			<div class="seat" name="164">I-4</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="181"></div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="182"></div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="183"></div>
			<div class="seat" name="184">J-1</div>
		</div>
		<div class="center-container">
			<div class="seat" name="5">A-3</div>
			<div class="seat" name="6">A-4</div>
			<div class="seat" name="7">A-5</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="8"></div>
			<div class="seat" name="9">A-6</div>
			<div class="seat" name="10">A-7</div>
			<div class="seat" name="11">A-8</div>
			<div class="seat" name="12">A-9</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="13"></div>
			<div class="seat" name="14">A-10</div>
			<div class="seat" name="15">A-11</div>
			<div class="seat" name="16">A-12</div>
			<div class="seat" name="25">B-4</div>
			<div class="seat" name="26">B-5</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="27"></div>
			<div class="seat" name="28">B-6</div>
			<div class="seat" name="29">B-7</div>
			<div class="seat" name="30">B-8</div>
			<div class="seat" name="31">B-9</div>
			<div class="seat" name="32">B-10</div>
			<div class="seat" name="33">B-11</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="34"></div>
			<div class="seat" name="35">B-12</div>
			<div class="seat" name="36">B-13</div>
			<div class="seat" name="45">C-5</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="46"></div>
			<div class="seat" name="47">C-6</div>
			<div class="seat" name="48">C-7</div>
			<div class="seat" name="49">C-8</div>
			<div class="seat" name="50">C-9</div>
			<div class="seat" name="51">C-10</div>
			<div class="seat" name="52">C-11</div>
			<div class="seat" name="53">C-12</div>
			<div class="seat" name="54">C-13</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="55"></div>
			<div class="seat" name="56">C-14</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="65"></div>
			<div class="seat" name="66">D-5</div>
			<div class="seat" name="67">D-6</div>
			<div class="seat" name="68">D-7</div>
			<div class="seat" name="69">D-8</div>
			<div class="seat" name="70">D-9</div>
			<div class="seat" name="71">D-10</div>
			<div class="seat" name="72">D-11</div>
			<div class="seat" name="73">D-12</div>
			<div class="seat" name="74">D-13</div>
			<div class="seat" name="75">D-14</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="76"></div>
			<div class="seat" name="85">E-5</div>
			<div class="seat" name="86">E-6</div>
			<div class="seat" name="87">E-7</div>
			<div class="seat" name="88">E-8</div>
			<div class="seat" name="89">E-9</div>
			<div class="seat" name="90">E-10</div>
			<div class="seat" name="91">E-11</div>
			<div class="seat" name="92">E-12</div>
			<div class="seat" name="93">E-13</div>
			<div class="seat" name="94">E-14</div>
			<div class="seat" name="95">E-15</div>
			<div class="seat" name="96">E-16</div>
			<div class="seat" name="105">F-5</div>
			<div class="seat" name="106">F-6</div>
			<div class="seat" name="107">F-7</div>
			<div class="seat" name="108">F-8</div>
			<div class="seat" name="109">F-9</div>
			<div class="seat" name="110">F-10</div>
			<div class="seat" name="111">F-11</div>
			<div class="seat" name="112">F-12</div>
			<div class="seat" name="113">F-13</div>
			<div class="seat" name="114">F-14</div>
			<div class="seat" name="115">F-15</div>
			<div class="seat" name="116">F-16</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="125"></div>
			<div class="seat" name="126">G-5</div>
			<div class="seat" name="127">G-6</div>
			<div class="seat" name="128">G-7</div>
			<div class="seat" name="129">G-8</div>
			<div class="seat" name="130">G-9</div>
			<div class="seat" name="131">G-10</div>
			<div class="seat" name="132">G-11</div>
			<div class="seat" name="133">G-12</div>
			<div class="seat" name="134">G-13</div>
			<div class="seat" name="135">G-14</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="136"></div>
			<div class="seat" name="145">H-5</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="146"></div>
			<div class="seat" name="147">H-6</div>
			<div class="seat" name="148">H-7</div>
			<div class="seat" name="149">H-8</div>
			<div class="seat" name="150">H-9</div>
			<div class="seat" name="151">H-10</div>
			<div class="seat" name="152">H-11</div>
			<div class="seat" name="153">H-12</div>
			<div class="seat" name="154">H-13</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="155"></div>
			<div class="seat" name="156">H-14</div>
			<div class="seat" name="165">I-5</div>
			<div class="seat" name="166">I-6</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="167"></div>
			<div class="seat" name="168">I-7</div>
			<div class="seat" name="169">I-8</div>
			<div class="seat" name="170">I-9</div>
			<div class="seat" name="171">I-10</div>
			<div class="seat" name="172">I-11</div>
			<div class="seat" name="173">I-12</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="174"></div>
			<div class="seat" name="175">I-13</div>
			<div class="seat" name="176">I-14</div>
			<div class="seat" name="185">J-2</div>
			<div class="seat" name="186">J-3</div>
			<div class="seat" name="187">J-4</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="188"></div>
			<div class="seat" name="189">J-5</div>
			<div class="seat" name="190">J-6</div>
			<div class="seat" name="191">J-7</div>
			<div class="seat" name="192">J-8</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="193"></div>
			<div class="seat" name="194">J-9</div>
			<div class="seat" name="195">J-10</div>
			<div class="seat" name="196">J-11</div>
		</div>
		<div class="right-container">
			<div class="seat" name="17">A-13</div>
			<div class="seat" name="18">A-14</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="19"></div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="20"></div>
			<div class="seat" name="37">B-14</div>
			<div class="seat" name="38">B-15</div>
			<div class="seat" name="39">B-16</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="40"></div>
			<div class="seat" name="57">C-15</div>
			<div class="seat" name="58">C-16</div>
			<div class="seat" name="59">C-17</div>
			<div class="seat" name="60">C-18</div>
			<div class="seat" name="77">D-15</div>
			<div class="seat" name="78">D-16</div>
			<div class="seat" name="79">D-17</div>
			<div class="seat" name="80">D-18</div>
			<div class="seat" name="97">E-17</div>
			<div class="seat" name="98">E-18</div>
			<div class="seat" name="99">E-19</div>
			<div class="seat" name="100">E-20</div>
			<div class="seat" name="117">F-17</div>
			<div class="seat" name="118">F-18</div>
			<div class="seat" name="119">F-19</div>
			<div class="seat" name="120">F-20</div>
			<div class="seat" name="137">G-15</div>
			<div class="seat" name="138">G-16</div>
			<div class="seat" name="139">G-17</div>
			<div class="seat" name="140">G-18</div>
			<div class="seat" name="157">H-15</div>
			<div class="seat" name="158">H-16</div>
			<div class="seat" name="159">H-17</div>
			<div class="seat" name="160">H-18</div>
			<div class="seat" name="177">I-15</div>
			<div class="seat" name="178">I-16</div>
			<div class="seat" name="179">I-17</div>
			<div class="seat" name="180">I-18</div>
			<div class="seat" name="197">J-12</div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="198"></div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="199"></div>
			<div class="seat" style="color: white; border: #d9d9d9;" name="200"></div>
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
      var seats = document.querySelectorAll('.seat');
      seats.forEach(function(seat) {
          seat.addEventListener('click', function() {
              if (seat.style.color !== 'white' && !seat.classList.contains('seat-booked')) {
                  seat.classList.toggle('seat-selected');
              }
          });
      });
  }

  function markBookedSeats(seatList) {
    // 모든 좌석 요소를 선택
    var allSeats = document.querySelectorAll('.seat');

    // 서버에서 받은 좌석 리스트를 바탕으로 예약된 좌석에 클래스를 추가
    seatList.forEach(seat => {
        var formattedSeat = `${seat.row}-${seat.column}`; // 서버에서 받은 좌석 정보를 포맷팅
        allSeats.forEach(seatElement => {
            if (seatElement.textContent === formattedSeat && seat.state === 'booked') {
                seatElement.classList.add('seat-booked'); // 예약된 좌석에 클래스 추가
            }
        });
    });
  }
  // 좌석 데이터 가져오기
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