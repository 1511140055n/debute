

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import prc3.q3RegisterLogic;

import prc3.q3LoginLogic;
import prc3.q3User;

/**
 * Servlet implementation class q3Login
 */
@WebServlet("/q3Login")
public class q3Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public q3Login() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String btn = request.getParameter("btn");

		if("確定".equals(btn)) {
			q3User user = new q3User(name, pass);

			q3RegisterLogic rc = new q3RegisterLogic();
			rc.execute(user);

			request.setAttribute("User", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/q3registerResult.jsp");
			dispatcher.forward(request, response);
		}
		else if("ログイン".equals(btn)) {
			q3User user = new q3User(name, pass);
			boolean isLogin = q3LoginLogic.execute(user);

			if (isLogin) {
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
			}

			request.setAttribute("User", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/q3loginResult.jsp");
			dispatcher.forward(request, response);
		}
	}
}
