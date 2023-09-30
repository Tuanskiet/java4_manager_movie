package service;


public interface EmailService {
	void sendEmail(String to, String body);
	
	void sendEmailsWithManyRecipient(String shareFrom, String emails, String body);
}
