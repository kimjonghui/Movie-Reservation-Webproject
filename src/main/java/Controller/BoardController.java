package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import DTO.boardDTO;
import Service.BoardService;

@WebServlet(urlPatterns = { "/boardWrite", "/boardUpdate", "/boardDelete" })
public class BoardController extends HttpServlet {
	// 게시글 등록
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("authID");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String date = req.getParameter("date");

		boardDTO boardDTO = new boardDTO(id, title, date, content);
		BoardService boardService = new BoardService();
		boolean result = boardService.insertBoard(boardDTO);
		if (result) {
			resp.sendRedirect("board.jsp");
		} else {
			resp.sendRedirect("WriteBoard.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		int nos = Integer.parseInt(no);
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String date = req.getParameter("date");
		String content = req.getParameter("content");

		System.out.println(nos + "," + title + "," + content + "," + date);
		boardDTO board = new boardDTO(nos, id, title, date, content);
		BoardService boardService = new BoardService();
		boolean result = boardService.updateBoard(board);
		if (result) {
			resp.sendRedirect("viewPost.jsp?no=" + nos + "&id=" + id + "&title=" + title);
		} else {
			resp.sendRedirect("errorPage.jsp");
		}
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		int boardNo = Integer.parseInt(no);
		BoardService boardService = new BoardService();

		boolean result = boardService.deleteBoard(boardNo);

		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");

		if (result) {
			resp.setStatus(HttpServletResponse.SC_OK);
			resp.getWriter().write("게시글 삭제 성공");
		} else {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().write("게시글 삭제 실패");
		}
	}
}
