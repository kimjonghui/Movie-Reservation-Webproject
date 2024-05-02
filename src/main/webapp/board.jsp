<%@page import="java.util.List, DTO.boardDTO, Service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>게시판</title>
<style>
body {
	margin: 0;
	padding: 0;
	flex-direction: column;
	align-items: center;
	width: 100%;
	height: 100%;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	background-color: #FFF9F0;
}

.centered-title {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100px; /* 높이는 필요에 따라 조정 */
	width: 100%; /* 너비는 부모 컨테이너에 맞추어 전체를 사용 */
}

h1 {
	margin: 0; /* 상하좌우 마진 제거 */
	padding: 0; /* 상하좌우 패딩 제거 */
	font-family: 'Noto Sans KR', sans-serif;
}

.board-list {
	width: 55%;
	margin: 20px auto;
	border-collapse: collapse;
	font-family: 'Noto Sans KR', sans-serif;
}

.board-list th, .board-list td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

.board-list th {
	background-color: #f2f2f2;
}

.board-list tr:nth-child(even) {
	background-color: #f9f9f9;
}

.board-list tr:hover {
	background-color: #f1f1f1;
}

.board-item {
	margin-bottom: 10px;
	border: 1px solid #ccc;
	padding: 10px;
}

.th-title {
	width: 40%;
}

.th-author {
	width: 10%;
	text-align: center;
}

.th-date {
	width: 10%;
	text-align: center;
}

.th-no {
	width: 3%;
}

.title {
	text-decoration: none;
	font-size: 20px;
}

.title:hover {
	cursor: pointer;
}

.write-button-container {
	width: 60%; /* 게시판 목록과 동일한 너비 */
	margin: 20px auto; /* 중앙 정렬 */
	text-align: center; /* 버튼을 컨테이너 중앙에 위치 */
}

.write {
	background-color: black; /* 청색 계열 배경 */
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px; /* 모서리 둥글게 */
	cursor: pointer; /* 클릭 가능한 항목임을 나타내는 커서 스타일 */
	transition: background-color 0.3s;
}

.write:hover {
	background-color: #333; /* 마우스 오버 시 배경 색상 변경 */
}

span {
	font-weight: bold;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
}

#pagination {
	text-align: center; /* 페이지네이션 버튼을 중앙 정렬 */
	margin: 20px 0; /* 상하 마진 추가 */
}

.pagination-link {
	display: inline-block; /* 인라인 블록 요소로 표시 */
	margin-right: 5px; /* 오른쪽 마진 추가 */
	padding: 8px 16px; /* 패딩 설정 */
	background-color: black; /* 배경색 설정 */
	border-radius: 5px; /* 둥근 모서리 설정 */
	text-decoration: none; /* 텍스트 밑줄 제거 */
	color: white; /* 글자 색상 설정 */
	font-size: 16px; /* 글자 크기 설정 */
	transition: background-color 0.3s, color 0.3s;
	/* 배경색과 글자 색상의 변화를 부드럽게 */
}

.pagination-link:hover, .pagination-link.active {
	background-color: #333; /* 마우스 오버 및 활성 링크의 배경색 변경 */
	color: white; /* 마우스 오버 및 활성 링크의 글자 색상을 흰색으로 변경 */
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
	font-weight: bold;
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
			<a href="MyPage.jsp" class="Mypage">MyPage</a>
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
	<div class="centered-title">
		<h1>게시판</h1>
	</div>
	<table class="board-list">
		<tr>
			<th class="th-no">No</th>
			<th class="th-author">작성자</th>
			<th class="th-title">제목</th>
			<th class="th-date">작성날짜</th>
		</tr>
		<%
		BoardService boardService = new BoardService();
		List<boardDTO> boardList = boardService.getAllBoards();
		for (boardDTO board : boardList) {
		%>
		<tr>
			<td><%=board.getNo()%>
			<td><%=board.getId()%></td>
			<td>
				<%
				if (userID != null && userID.equals(board.getId())) {
				%> <a href="viewPost.jsp?no=<%=board.getNo()%>&id=<%=board.getId()%>&title=<%=board.getTitle()%>" class="title"><%=board.getTitle()%></a> <%
 } else {
 %> <a class="title" onclick="alert('작성자만 게시글을 확인 할 수 있습니다')"><%=board.getTitle()%></a> <%
 }
 %>
			</td>
			<td><%=board.getDate()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<div id="pagination"></div>
	<div class="write-button-container">
		<button class="write" onclick="redirectToPage()">게시글 작성</button>
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
		function redirectToPage() {
			window.location.href = "WriteBoard.jsp";
		}
		var currentPage = 1; // 현재 페이지
		var itemsPerPage = 10; // 페이지당 표시할 게시글 수

		function makePagination(totalItems, itemsPerPage) {
			var totalPages = Math.ceil(totalItems / itemsPerPage);
			var paginationHTML = '';
			for (var i = 1; i <= totalPages; i++) {
				paginationHTML += '<a href="#" class="pagination-link" onclick="fetchPage('
						+ i + ')">' + i + '</a> ';
			}
			document.getElementById('pagination').innerHTML = paginationHTML;
		}

		// 특정 페이지 번호의 게시글을 가져오는 함수
		function fetchPage(pageNumber) {
			currentPage = pageNumber;
			var begin = (currentPage - 1) * itemsPerPage;
			var end = begin + itemsPerPage;
			var paginatedItems = [].slice.call(
					document.querySelectorAll('.board-list tr')).slice(
					begin + 1, end + 1); // 첫 번째 헤더 행을 제외

			// 모든 행을 숨기고, 현재 페이지의 행만 표시
			document.querySelectorAll('.board-list tr:not(:first-child)')
					.forEach(function(row) {
						row.style.display = 'none'; // 모든 행 숨김
					});

			paginatedItems.forEach(function(row) {
				row.style.display = ''; // 현재 페이지 행만 표시
			});
		}

		// 페이지 로드 시 페이징 준비
		window.onload = function() {
			// 게시글 총 수, 페이징 처리 시작
			var totalItems = document.querySelectorAll('.board-list tr').length - 1; // 헤더 행 제외
			makePagination(totalItems, itemsPerPage);
			fetchPage(1); // 첫 페이지 로드
		};
	</script>
</body>
</html>