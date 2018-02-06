package com.oa.utilities;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailer {
	
	private String recipient;
	private String subject;
	private String body;
	
	public Mailer(String recipient, String subject, String body) {
		this.recipient = recipient;
		this.subject = subject;
		this.body = body;
	}
	
	public boolean send() {
		boolean noException;
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "localhost");
		props.put("mail.smtp.port", "25");
		
		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("username","password");
					}
				});
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("from-email@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
			message.setSubject(subject);
			message.setText(body);

			Transport.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}
}
