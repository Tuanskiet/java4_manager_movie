package service.impl;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import service.EmailService;

import entity.MyUser;



public class EmailServiceImpl implements EmailService {

    private static final String EMAIL_SHARE_SUBJECT = "Share Video from ";
    private static final String EMAIL_FORGOT_SUBJECT = "New password has been sent, please comeback our web site and login with this password!";
    private final String fromEmail = "stellaprimo99@gmail.com";
    private final String password = "awgmfccbwiqiggfu"; // correct password for gmail id
    
    @Override
    public void sendEmail( String to, String body) {
		try {
			MimeMessage msg = new MimeMessage(setProperty());
			// set message headers
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			msg.addHeader("format", "flowed");
			msg.addHeader("Content-Transfer-Encoding", "8bit");
			msg.setFrom(new InternetAddress(fromEmail, "Top Video"));
//			msg.setReplyTo(InternetAddress.parse(fromEmail, false));
			msg.setSubject(EMAIL_FORGOT_SUBJECT, "UTF-8");
			msg.setText(body, "UTF-8");
			msg.setSentDate(new Date());
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
			System.out.println("Message is ready ...");
			Transport.send(msg);

			System.out.println("Email Sent Successfully!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendEmailsWithManyRecipient(String shareFrom, String emails, String body) {
		try {
			MimeMessage msg = new MimeMessage(setProperty()); msg.setFileName("hii");
			// set message headers 
			msg.setContent(body, "text/html; charset=UTF-8");
			msg.addHeader("format", "flowed");
			msg.addHeader("Content-Transfer-Encoding", "8bit");
			msg.setFrom(new InternetAddress(fromEmail, "Top Video"));
//			msg.setReplyTo(InternetAddress.parse(fromEmail, false));
			msg.setSubject(EMAIL_SHARE_SUBJECT + shareFrom, "UTF-8");
//			msg.text(body, "text/html; charset=UTF-8");
			msg.setSentDate(new Date());
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emails));
			System.out.println("Message is ready ...");
			Transport.send(msg);

			System.out.println("Email Sent Successfully!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private Session setProperty() {
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");  
		props.setProperty("mail.host", "smtp.gmail.com");  
	    props.put("mail.smtp.auth", "true"); 
	    props.put("mail.smtp.ssl.trust", "*");
		props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		props.put("mail.smtp.socketFactory.port", "587"); //SSL Port
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");//Fixed
		props.put("mail.smtp.port", "587"); //SMTP Port
		
		Authenticator auth = new Authenticator() {
			//override the getPasswordAuthentication method
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		return  Session.getDefaultInstance(props, auth);
	}
}