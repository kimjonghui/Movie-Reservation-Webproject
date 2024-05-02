package Controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import DTO.MemberDTO;
import Service.MemberService;

@WebServlet(urlPatterns = { "/login", "/signup", "/delete", "/change" })
public class MemberController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = req.getParameter("id");
		String password = req.getParameter("password");

		// MemberService 인스턴스 생성
		MemberService memberService = new MemberService();

		// 로그인 시도
		MemberDTO member = memberService.login(id, password);

		if (member != null) {
			System.out.println("로그인 성공: " + member.getEmail());
			session.setAttribute("authEmail", member.getEmail());
			session.setAttribute("authID", member.getId());
			session.setAttribute("authPhoneNumber", member.getPhoneNumber());
			resp.sendRedirect("MainPage.jsp");
		} else {
			System.out.println("로그인 실패");
			resp.sendRedirect("Login.jsp");
		}
	}

	// 회원가입 처리 로직
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");

		System.out.println(id);
		System.out.println(password);
		System.out.println(phone);
		System.out.println(email);
		MemberDTO member = new MemberDTO(id, password, phone, email);

		// MemberService 인스턴스 생성 및 회원가입 로직 호출
		MemberService memberService = new MemberService();
		memberService.registerMember(member); // 여기서 DB에 데이터 저장
		System.out.println("DB 회원정보 추가 완료");
		// 처리 완료 후 응답
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write("{\"message\":\"회원가입이 완료되었습니다.\"}");
		session.removeAttribute("authCode");
		session.removeAttribute("authEmail");
		resp.sendRedirect("SignupSuccess.jsp");
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		String password = json.getString("password");

		System.out.println("ID: " + id);
		System.out.println("Password: " + password);
		MemberService memberService = new MemberService();
		boolean result = memberService.deleteMember(id, password);
		if (result) {
			System.out.println("회원 탈퇴 완료");
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write("회원 탈퇴가 완료 되었습니다.");
			session.invalidate();
		} else {
			System.out.println("회원 탈퇴 실패");
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write("회원 탈퇴를 실패하였습니다. 비밀번호를 확인해주세요");
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

		String id = json.getString("id");
		String email = json.getString("email");
		String phoneNumber = json.getString("phoneNumber");
		System.out.println("ID: " + id);
		System.out.println("Email: " + email);
		System.out.println("PhoneNumber: " + phoneNumber);

		MemberService memberService = new MemberService();
		boolean result = memberService.updateEmailAndPhoneNumber(id, email, phoneNumber);
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		if (result) {
			System.out.println("회원 정보 수정 완료");
			session.removeAttribute("authEmail");
			session.removeAttribute("authPhoneNumber");
			session.setAttribute("authEmail", email);
			session.setAttribute("authPhoneNumber", phoneNumber);
			resp.getWriter().write("회원 정보가 성공적으로 업데이트 되었습니다.");
		} else {
			System.out.println("회원 정보 수정 실패");
			resp.getWriter().write("작성하신 정보를 다시한번더 확인해주세요.");
		}
	}
}
