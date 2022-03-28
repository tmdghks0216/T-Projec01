package Logic;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class PW_Mail {
   public boolean Mail(PwVO pvo) {
	


      String host = "smtp.gmail.com"; // 사용할 사이트
      final String user = ""; // ID
      final String password = ""; // PW

      String to = pvo.getMail(); // 보낼 이메일 주소
      
//      String host = "smtp.naver.com"; // 사용할 사이트
//      final String user = ""; // ID
//      final String password = ""; // PW
////      
//      String to = "보낼 이메일 주소"; // 보낼 이메일 주소


      // Get the session object
      Properties props = new Properties();
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.port", "587");
      props.put("mail.smtp.ssl.protocols", "TLSv1.2");

      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
         }
      });

      // Compose the message
      try {
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(user));
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

         // Subject
         message.setSubject("웹뽀 중고마켓");

         // Text
         message.setText("안녕하세요, 웹뽀 중고마켓입니다.\r\n"
         		+ "변경된 임시 비밀번호는 "+pvo.getPw() +"입니다.\r\n"
         		+ "변경된 임시 비밀번호로 로그인 후 마이페이지에서 비밀번호를 변경해주세요");

         // send the message
         Transport.send(message);
         System.out.println("이메일 전송 성공!");
         return true;

      } catch (MessagingException e) {
         e.printStackTrace();
         return false;
      }
   }
}