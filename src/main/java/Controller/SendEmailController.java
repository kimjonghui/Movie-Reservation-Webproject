package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.MemberService;

@WebServlet("/email")
public class SendEmailController extends HttpServlet {
	private PrintWriter out;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// SignUp페이지에서 인증번호 전송 버튼 눌렀을때
		HttpSession session = req.getSession();
		session.getAttribute("email");
		String email = req.getParameter("email");
		System.out.println("클라이언트에서 전송한 Email : " + email);
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		out = resp.getWriter();
		// 세션에 해당 이메일이 존재하지 않거나 세션에 저장된 이메일과 다를 경우에만 이메일 전송
		if (session.getAttribute("authEmail") == null || !session.getAttribute("authEmail").equals(email)) {
			MemberService memberService = new MemberService();
			boolean result = memberService.isEmailDuplicate(email);

			if (result) {
				String code = generateAuthCode();
				// 각 이메일 서비스가 제공하는 smtp 주소 및 포트
				String host = "smtp.gmail.com";
				int port = 587;
				// 아이디
				String username = "jmw6898w10@gmail.com";
				// 비밀번호
				String password = "zwhi ygfk fimy ppgy";

				Properties props = new Properties();
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", port);

				Session mailsession = Session.getInstance(props, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				});

				try {
					MimeMessage message = new MimeMessage(mailsession);
					message.setFrom(new InternetAddress(username));
					// 대상 이메일 주소
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
					// 제목
					message.setSubject("메일 인증 코드");
					// 내용
					message.setText("귀하의 인증 번호는 " + code + " 입니다.");
					Transport.send(message);
					System.out.println("Email sent successfully!");
					System.out.println(code);
					out.print(result ? "사용 가능한 Email 입니다." : "해당 Email는 사용중인 Email입니다.");
					// 세션에 이메일과 코드 저장
					session.setAttribute("authCode", code);
					session.setAttribute("authEmail", email);

				} catch (MessagingException e) {
					throw new RuntimeException(e);
				}
			} else {
				System.out.println("DB에 이미 있는 Email인것을 확인");
				out.print(result ? "사용 가능한 Email 입니다." : "해당 Email는 사용중인 Email입니다.");
			}
		} else {
			out.print("해당 Email로 이미 인증번호가 전송되었습니다. 1분뒤에 재전송 가능합니다.");
		}
		out.flush();
	}

	// 인증번호 생성 메서드 (예: 6자리 숫자)
	private String generateAuthCode() {
		int code = (int) (Math.random() * 900000) + 100000; // 100000 ~ 999999 범위의 숫자 생성
		return String.valueOf(code);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// SignUp, FindID 웹에서 확인 버튼 눌렀을때
		String inputCode = req.getParameter("code");
		System.out.println(inputCode);
		HttpSession session = req.getSession();
		String savedCode = (String) session.getAttribute("authCode");

		if (savedCode != null && savedCode.equals(inputCode)) {
			// 인증번호 일치
			resp.getWriter().write("valid");

		} else {
			// 인증번호 불일치
			resp.getWriter().write("invalid");
		}
	}
}
