

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import java.sql.*;
/**
 * Servlet implementation class enshu4
 */
@WebServlet("/enshu4")
public class enshu4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public enshu4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String html ="<html><body>";
		html += "受信メールを確認して本文内のリンクを押してください";
		out.println(html);
		String uid = UUID.randomUUID().toString();
		Email email = new HtmlEmail();
		//email.setDebug(true);
		email.setHostName("smtp.gmail.com");
		email.setSmtpPort(587);
		email.setAuthenticator(new DefaultAuthenticator(
				"1511140055n@ed.fuk.kindai.ac.jp", "Cjgcloxup4@"));
		email.setCharset("UTF-8");
		email.setStartTLSEnabled(true);
		try {
			email.setSubject("メー ルを確認して本文内のリンクを押してください");
			email.setFrom("1511140055n@ed.fuk.kindai.ac.jp");
			email.addTo(request.getParameter("adress"));
			email.setMsg("http://localhost:8080/2-5-4/check.jsp?id="+uid);
			email.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}


		Connection con = null;
		try {
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
			String sql = "INSERT INTO APP(UID) VALUES (?)";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, uid);
			int cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			return;
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}


	}

}
