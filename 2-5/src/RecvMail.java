import java.io.IOException;
import java.security.Security;
import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Store;

public class RecvMail {
	public static void main(String... strings) {
		Properties props = new Properties();
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

		props.put("mail.imap.starttls.enable", "true");
		props.put("mail.imap.auth", "true");
		props.put("mail.imap.socketFactory.port", "993");
		props.put("mail.imap.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.imap.socketFactory.fallback", "false");

		Session session = Session.getDefaultInstance(props, null);
		//session.setDebug(true);

		Store store = null;
		try {
			store = session.getStore("imap");
			store.connect("imap.gmail.com", "1511140055n@ed.fuk.kindai.ac.jp",
					"Cjgcloxup4@");
			Folder folder = store.getFolder("INBOX");
			folder.open(Folder.READ_ONLY);

			Message[] messages = folder.getMessages();
			for (Message message : messages) {
				System.out.println(message.getSubject());
				System.out.println(getText(message.getContent()));
			}
			folder.close(false);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (store != null) {
					store.close();
				}
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	}

	private static String getText(Object content) throws IOException,
			MessagingException {
		String text = null;
		StringBuffer sb = new StringBuffer();

		if (content instanceof String) {
			sb.append((String) content);
		} else if (content instanceof Multipart) {
			Multipart mp = (Multipart) content;
			for (int i = 0; i < mp.getCount(); i++) {
				BodyPart bp = mp.getBodyPart(i);
				sb.append(getText(bp.getContent()));
			}
		}

		text = sb.toString();
		return text;
	}
}