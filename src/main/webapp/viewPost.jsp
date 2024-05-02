<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DTO.boardDTO, Service.BoardService"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<%
String no = request.getParameter("no");
int nos = Integer.parseInt(no);
String id = request.getParameter("id");
String title = request.getParameter("title");
BoardService boardService = new BoardService(); // Assume dependency injection or service lookup
boardDTO board = boardService.getBoardById(nos, id, title);
%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/CSS/Topmenu.css">
<link href="https://fonts.googleapis.com/css2?family=Playfair Display&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>view</title>
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
}

.board-content {
	background-color: #f9f9f9; /* 배경색 */
	border: 1px solid #ccc; /* 테두리 */
	padding: 20px; /* 패딩 */
	margin-top: 50px; /* 상단 여백 */
	border-radius: 8px; /* 모서리 둥글게 */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	max-width: 800px; /* 최대 너비 */
	margin-left: auto; /* 중앙 정렬을 위한 설정 */
	margin-right: auto; /* 중앙 정렬을 위한 설정 */
	font-family: 'Noto Sans KR', sans-serif;
}

/* 제목 스타일 */
h2 {
	font-size: 24px; /* 폰트 크기 */
	color: #333; /* 폰트 색상 */
	margin-bottom: 10px; /* 아래쪽 여백 */
}

/* 내용 스타일 */
p {
	font-size: 16px; /* 폰트 크기 */
	color: #666; /* 폰트 색상 */
	line-height: 1.5; /* 줄 간격 */
	margin-bottom: 10px; /* 아래쪽 여백 */
}

/* 작성자, 작성일 스타일 */
.board-content p {
	font-weight: bold; /* 폰트 두께 */
}

span {
	font-weight: bold;
	font-family: 'Noto Sans KR', sans-serif;
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
 	out.println(userID);
 %>
				</span> /
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

	<%
	if (board != null) {
	%>
	<div class="board-content">
		<h2><%=board.getTitle()%></h2>
		<p>
			작성자:
			<%=board.getId()%></p>
		<p>
			작성일:
			<%=board.getDate()%></p>
		<p>
			내용:
			<%=board.getPostwritten()%></p>
		<button onclick="editPost()">수정하기</button>
		<button class="delete">삭제</button>
	</div>
	<%
	} else {
	%>
	<div class="board-content">
		<p>게시글을 찾을 수 없습니다.</p>
	</div>
	<%
	}
	%>
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
	  function editPost() {
	        try {
	            var no = '<%=request.getParameter("no")%>';
	            var id = '<%=request.getParameter("id")%>';
	            var title = '<%=request.getParameter("title") != null ? URLEncoder.encode(request.getParameter("title"), "UTF-8") : ""%>';
	            var date = '<%=board.getDate()%>';
	            var content = '<%=board.getPostwritten()%>';
	            console.log('No:', no);
	            console.log('ID:', id);
	            console.log('Title:', title);
	            console.log('Date:', date);
	            console.log('Content:', content);
	            if (no && id && title && date && content) {
	                window.location.href = 'UpdateBoard.jsp?no=' + no + '&id=' + id + '&title=' + title + '&date=' + date + '&content=' + content;
	            } else {
	                alert('Some required fields are missing. Please check your input and try again.');
	            }
	        } catch (e) {
	            console.error('Error:', e);
	            alert('An error occurred while preparing to edit the post.');
	        }
	    }
     
     const deleteButton = document.querySelector('.delete');
     deleteButton.addEventListener('click', function() {
         const boardNo = '<%=board.getNo()%>';  // 게시글 번호를 서버로 전달
         if (confirm('게시글을 삭제하시겠습니까? 삭제한 게시글은 복구가 불가능합니다.')) {
             fetch('/boardDelete?no=' + boardNo, {
                 method: 'DELETE'
             })
             .then(response => response.text())  // 서버로부터 텍스트 응답을 받음
             .then(text => {
                 alert(text);  // 서버로부터 받은 텍스트 메시지를 alert으로 표시
                 if (text === "게시글 삭제 성공") {
                     window.location.href = 'board.jsp';  // 성공 시 게시판 목록 페이지로 이동
                 }
             })
             .catch(error => {
                 console.error('Error:', error);
                 alert('게시글 삭제 과정에서 오류가 발생했습니다.');
             });
         }
     });
	</script>
</body>
</html>
