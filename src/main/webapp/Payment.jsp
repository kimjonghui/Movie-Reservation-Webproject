<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<!-- 결제 버튼 -->
	<button id="button">결제하기</button>

	<script>
	let movieName;
	let movieStartTime;
	let movieSit;
	let moviePrice;
	
		document.addEventListener('DOMContentLoaded', function() {
			// 결제 버튼 요소를 가져옵니다.
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
					if (rsp.success) {
						alert('결제가 성공했습니다.');
						 window.location.href = "PaymentSuccess.jsp";
					//결제 컨트롤러(서블렛)으로 영화이름, 영화 시작시간, 좌석번호, 결제금액 전송해야함
					} else {
						alert('결제에 실패했습니다.');
					}
				});
			});
		});
	</script>
</body>
</html>