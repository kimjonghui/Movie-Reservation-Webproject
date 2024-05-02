package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import Service.MemberService;

@WebServlet(urlPatterns = { "/findID", "/findPassword" })
public class FindController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// findID 웹에서 인증번호 전송 버튼을 눌렀을때
		HttpSession session = req.getSession();
		String email = req.getParameter("email");
		System.out.println("findID 웹 에서 전송한 email : " + email);

		MemberService memberService = new MemberService();
		String findid = memberService.findIdByEmail(email);
		System.out.println("찾은 ID : " + findid);
		// 응답을 보낼 PrintWriter 생성 및 UTF-8로 인코딩 설정
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		if (findid != null) {
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

				session.setAttribute("authEmail", email);
				session.setAttribute("authCode", code);
				session.setAttribute("findid", findid);
				out.print("해당 이메일로 인증번호가 전송되었습니다.");
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}

		} else {
			System.out.println("실패");
			out.print("해당 이메일로 저장된 회원정보가 없습니다. 이메일을 다시 확인해주세요.");
		}
		out.flush();
		out.close();
	}

	// 인증번호 생성 메서드 (예: 6자리 숫자)
	private String generateAuthCode() {
		int code = (int) (Math.random() * 900000) + 100000; // 100000 ~ 999999 범위의 숫자 생성
		return String.valueOf(code);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// findIDSuccess에서 로그인으로 돌아가기 버튼을 눌렀을때
		HttpSession session = req.getSession();
		session.removeAttribute("authEmail");
		session.removeAttribute("findid");
		session.removeAttribute("authCode");
		resp.sendRedirect("Login.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// findPassword 웹에서 인증번호전송 을 눌렀을때
		HttpSession session = req.getSession();
		StringBuilder sb = new StringBuilder();
		String line;
		try (BufferedReader reader = req.getReader()) {
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		JSONObject jsonObject = new JSONObject(sb.toString());
		String email = jsonObject.getString("email"); // 'email' 키로 이메일 값 가져오기
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		if (session.getAttribute("authEmail") == null || !session.getAttribute("authEmail").equals(email)) {
			boolean result = email != null;
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
					out.print(result ? "작성하신 Email에 인증번호가 발송되었습니다." : "작성하신 Email에 인증번호 발송이 실패했습니다.");
					// 세션에 이메일과 코드 저장
					session.setAttribute("authCode", code);
					session.setAttribute("authEmail", email);

				} catch (MessagingException e) {
					throw new RuntimeException(e);
				}
			} else {
				out.print(result ? "작성하신 Email에 인증번호가 발송되었습니다." : "작성하신 Email에 인증번호 발송이 실패했습니다.");
			}
		} else {
			out.print("해당 Email로 이미 인증번호가 전송되었습니다. 작성하신 Email을 확인해주세요.");
		}
		out.flush();

	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPut(req, resp);
	}
}
