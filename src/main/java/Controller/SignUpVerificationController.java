package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import Service.IMemberService;
import Service.MemberService;

@WebServlet(urlPatterns = { "/SignUpVer", "/ChangePassword" })
public class SignUpVerificationController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		System.out.println(id);

		// MemberService 인스턴스 생성
		MemberService memberService = new MemberService();

		boolean result = memberService.isIdDuplicate(id);
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(result ? "해당 ID는 사용이 가능합니다." : "해당 ID는 사용이 불가능합니다.");
		out.flush();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// findPassword 웹에서 next 버튼 선택시
		HttpSession session = req.getSession();
		StringBuilder sb = new StringBuilder();
		String line;

		try (BufferedReader reader = req.getReader()) {
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		}
		JSONObject json = new JSONObject(sb.toString());

		String id = json.getString("id");
		System.out.println("id 확인 : " + id);
		MemberService memberService = new MemberService();
		boolean result = memberService.isIdDuplicate(id);
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		if (!result) {
			// ID 처리 성공 메시지
			session.setAttribute("authID", id);
			resp.getWriter().write("success");
		} else {
			// ID 처리 실패 메시지
			resp.getWriter().write("failure");
		}
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		StringBuilder sb = new StringBuilder();
		String line;

		try (BufferedReader reader = req.getReader()) {
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		}
		JSONObject json = new JSONObject(sb.toString());
		String id = (String) session.getAttribute("authID");
		String changePassword = json.getString("password");
		System.out.println("클라이언트에서 전송한 비밀번호 : " + changePassword);
		MemberService memberService = new MemberService();
		String nowPassword = memberService.getNowPasswordById(id);
		System.out.println("변경전 비밀번호 : " + nowPassword);

		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");

		if (changePassword.equals(nowPassword)) {
			resp.getWriter().write("새 비밀번호가 현재 비밀번호와 동일합니다.");
		} else {
			memberService.changePassword(id, changePassword);
			resp.getWriter().write("비밀번호가 성공적으로 변경되었습니다.");
			session.removeAttribute("authID");
			session.removeAttribute("authCode");
			session.invalidate();
		}
	}
}
