

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

/**
 * Servlet implementation class enshu3
 */
@WebServlet("/enshu3")
public class enshu3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public enshu3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF8");
		Email email = new HtmlEmail();
		//email.setDebug(true);
		email.setHostName("smtp.gmail.com");
		email.setSmtpPort(587);
		email.setAuthenticator(new DefaultAuthenticator(
				"1511140055n@ed.fuk.kindai.ac.jp", "Cjgcloxup4@"));
		email.setCharset("UTF-8");
		email.setStartTLSEnabled(true);
		try {
			email.setSubject(request.getParameter("title"));
			email.setFrom("1511140055n@ed.fuk.kindai.ac.jp");
			email.addTo(request.getParameter("adress"));
			email.setMsg(request.getParameter("text"));
			email.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}

}
