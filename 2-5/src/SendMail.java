import org.apache.commons.mail.Email;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;

public class SendMail {
	public static void main(String [] args) {
		Email email = new HtmlEmail();
		//email.setDebug(true);
		email.setHostName("smtp.gmail.com");
		email.setSmtpPort(587);
		email.setAuthenticator(new DefaultAuthenticator(
				"1511140055n@ed.fuk.kindai.ac.jp", "Cjgcloxup4@"));
		email.setCharset("UTF-8");
		email.setStartTLSEnabled(true);
		try {
			email.setSubject("ここにタイトルを記入します");
			email.setFrom("1511140055n@ed.fuk.kindai.ac.jp");
			email.addTo("1511140055n@ed.fuk.kindai.ac.jp");
			email.setMsg("ここに<h1>本文</h1>を記入します");
			email.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}
}
