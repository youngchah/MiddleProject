package member.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Properties;
import java.util.UUID;

import javax.activation.DataHandler;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/codeSend.do")
public class CodeSend extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        // 사용자 이메일과 인증번호 생성
        String userEmail = req.getParameter("mem_Email");
        String verificationCode = generateVerificationCode(); // 인증번호 생성

        // 이메일 전송 로직 추가
        boolean emailSent = sendVerificationEmail(userEmail, verificationCode);

        if (emailSent) {
            // 세션에 인증번호 및 이메일 저장
            HttpSession session = req.getSession();
            session.setAttribute("verificationCode", verificationCode);
            session.setAttribute("userEmail", userEmail);
            System.out.println(verificationCode + "  <<<<<<<<<<<<<<  ㄴㄴ인증번호 ");

            // 성공 시 클라이언트에게 응답
            PrintWriter out = resp.getWriter();
            out.print(verificationCode);
            out.flush();

        } else {
            // 실패 시 클라이언트에게 응답
            resp.getWriter().print("failure");
        }
    }

    // 인증번호 생성 메서드
    private String generateVerificationCode() {
        // 여기에서 인증번호를 생성하는 로직을 구현하면 됩니다.
        // 간단하게는 UUID를 이용하거나 다른 방식을 사용할 수 있습니다.
        // 예시로 UUID를 사용한 코드를 아래에 제시합니다.
        return UUID.randomUUID().toString().replaceAll("-", "").substring(0, 6);
    }

    // 이메일 전송 메서드
    private boolean sendVerificationEmail(String toEmail, String verificationCode) {
        try {
            // SMTP 서버 설정
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
            
            // 본인의 Gmail 계정 정보
            String username = "TripCatch403@gmail.com";
            String password = "gspn oaoe xvlv ynte";

            // 세션 생성
            Session session = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            // 메시지 객체 생성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username,"여행 꽉 자바")); // 보내는 사람
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail)); // 받는 사람
            message.setSubject("여행 꽉 자바 회원가입을 위한 이메일 인증 코드"); // 이메일 제목

            // 본문에 인증번호 추가 (HTML 형식)
            String body = "안녕하세요 여행 꽉 자바 입니다. <br> 회원가입을 위한 인증번호는 :  " + verificationCode + "  입니다" + "<br><img src=\"cid:image\">";
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setContent(body, "text/html; charset=utf-8");

            // 이미지 부분 생성
            BodyPart imageBodyPart = new MimeBodyPart();
            InputStream imageInputStream = getServletContext().getResourceAsStream("/resource/프로필사진_테두리없음.png");
            ByteArrayOutputStream imageOutputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = imageInputStream.read(buffer)) != -1) {
                imageOutputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = imageOutputStream.toByteArray();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            imageBodyPart.setDataHandler(new DataHandler(new Base64DataSource(base64Image, "image/png")));
            imageBodyPart.setHeader("Content-ID", "<image>");

            // 본문과 이미지를 합치기
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(textPart);
            multipart.addBodyPart(imageBodyPart);

            // 메시지에 본문 및 이미지 설정
            message.setContent(multipart);

            // 이메일 전송
            Transport.send(message);

            return true; // 이메일 전송 성공

        } catch (MessagingException | IOException e) {
            e.printStackTrace();
            return false; // 이메일 전송 실패
        }
    }

    // Base64로 인코딩된 데이터를 다루는 DataSource 클래스
    private class Base64DataSource implements javax.activation.DataSource {
        private final String base64Data;
        private final String contentType;

        public Base64DataSource(String base64Data, String contentType) {
            this.base64Data = base64Data;
            this.contentType = contentType;
        }

        @Override
        public InputStream getInputStream() throws IOException {
            byte[] decodedData = Base64.getDecoder().decode(base64Data);
            return new java.io.ByteArrayInputStream(decodedData);
        }

        @Override
        public OutputStream getOutputStream() throws IOException {
            throw new IOException("Not Supported");
        }

        @Override
        public String getContentType() {
            return contentType;
        }

        @Override
        public String getName() {
            return "Base64DataSource";
        }
    }
}
