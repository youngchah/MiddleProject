package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.UUID;

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

@WebServlet("/passSend.do")
public class PassSend extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
		req.getRequestDispatcher("/views/member/findPw.jsp").forward(req, resp);
		
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String userEmail = req.getParameter("mem_Email");
		String newPassword = generateShortenedUuid(); // 새로운 비밀번호 생성

		// 이메일 전송 로직 추가
		boolean emailSent = sendVerificationEmail(userEmail, newPassword);

		if (emailSent) {
			// 데이터베이스 업데이트 로직 추가
			boolean dbUpdated = updateDatabaseWithCode(userEmail, newPassword);

			if (dbUpdated) {
				// 세션에 코드 및 이메일 저장
				HttpSession session = req.getSession();
				session.setAttribute("verificationCode", newPassword);
				session.setAttribute("userEmail", userEmail);
				
				// 성공 시 로그인 화면으로 리다이렉트
//				resp.sendRedirect(req.getContextPath() + "/login.do");
				resp.getWriter().print("success");
				
				return;
			} else {
				// 실패 응답 전송
				resp.getWriter().print("failure");
			}
		} else {
			// 실패 응답 전송
			resp.getWriter().print("failure");
		}
	}

	private String generateShortenedUuid() {
		// UUID로 랜덤 비밀번호 생성
		String uuid = UUID.randomUUID().toString();
		// '-' 제외하고 8글자만 남기고 반환
		return uuid.replaceAll("-", "").substring(0, 8);
	}

	private boolean sendVerificationEmail(String toEmail, String newPass){
		// 이메일 전송 로직 추가
		try {
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", "587");
			properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
			
			String username = "TripCatch403@gmail.com"; // 본인의 Gmail 이메일
			String password = "gspn oaoe xvlv ynte"; // 본인의 Gmail 비밀번호

			Session session = Session.getInstance(properties, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			Message message = new MimeMessage(session);
			try {
				message.setFrom(new InternetAddress(username,"여행 꽉 자바"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			message.setSubject("여행 꽉 자바 임시 비밀번호 발급입니다.");
			message.setText("고객님의 새로운 비밀번호는:   " + newPass + "  입니다  로그인후 변경해주세요" );

			Transport.send(message);

			return true; // 이메일 전송 성공

		} catch (MessagingException e) {
			e.printStackTrace();
			return false; // 이메일 전송 실패
		}
	}

	private boolean updateDatabaseWithCode(String userEmail, String newPass) {
		// 데이터베이스 업데이트 로직 추가
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@112.220.114.130:1521:xe", "team3_202310M",
					"java");

			String sql = "UPDATE MEMBER SET mem_pass = ? WHERE mem_email = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, newPass);
			stmt.setString(2, userEmail);

			int rowsUpdated = stmt.executeUpdate();

			stmt.close();
			conn.close();

			return rowsUpdated > 0; // 업데이트 성공 여부 반환

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false; // 업데이트 실패
		}
	}

}
