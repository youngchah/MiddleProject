package member.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Gmail {

	
	private static final String FROM_EMAIL = "TripCatch403@gmail.com";
    private static final String USERNAME = "TripCatch403@gmail.com";
    private static final String PASSWORD = "gspn oaoe xvlv ynte";

    // 이메일 전송 로직 구현
    public static void sendVerificationEmail(String toEmail, String subject, String content) {
        // 입력값이 null이거나 빈 문자열인지 확인
        if (toEmail != null && !toEmail.isEmpty()) {
            // 유효한 이메일 주소 형식인지 확인
            if (isValidEmail(toEmail)) {
                Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.ssl.protocols", "TLSv1.2");
               
                Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                    protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                        return new javax.mail.PasswordAuthentication(USERNAME, PASSWORD);
                    }
                });

                try {
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(FROM_EMAIL));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
                    message.setSubject(subject);
                    message.setContent(content, "text/html; charset=utf-8");

                    Transport.send(message);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                // 유효하지 않은 이메일 주소 처리
                System.out.println("유효 x");
            }
        } else {
            // toEmail이 null 또는 빈 문자열 처리
            System.out.println("이메일 주소지정x");
        }
    }

    // 유효한 이메일 주소 형식인지 확인하는 메서드
    private static boolean isValidEmail(String email) {
        return email.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}");
    }
}
