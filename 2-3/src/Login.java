

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import model.LoginLogic;
import model.RegisterLogic;
import model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String name =  request.getParameter("name");
		String pass =  request.getParameter("pass");
		String btn =  request.getParameter("btn");
		User user = new User(name, pass);
		LoginLogic loginLogic = new LoginLogic();
		boolean isLogin = loginLogic.execute(user);

		/*if("登録".equals(btn)){
			Connection con = null;
			try {
				Class.forName("org.apache.derby.jdbc.ClientDriver");
				con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "user", "pass");
				String sql = "INSERT INTO IDTBL VALUES (?,?)";
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, user.getName());
				stmt.setString(2, user.getPass());
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
		RegisterLogic registerLogic = new RegisterLogic();
		boolean isLogin = registerLogic.execute(user);*/

		if(isLogin){
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			//ession.setAttribute("pass", pass);
		}
		request.setAttribute("User", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/lib/loginResult.jsp");
		dispatcher.forward(request, response);


	}
}
