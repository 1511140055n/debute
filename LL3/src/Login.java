

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model2.LoginLogic;
import model2.User;


/**
 * Servlet implementation class Bmi
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
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

			//クラス名と同じものでよい、特に思いついたものがなければ
			User user = new User(id,pass);


			boolean isLogin = LoginLogic.execute(user);
			if(isLogin){
				//sessionはサーブレッドで
				HttpSession session = request.getSession();
				session.setAttribute("id",id);
			}


			request.setAttribute("User", user);
			RequestDispatcher dispatcher =
					request.getRequestDispatcher("/WEB-INF/loginResult.jsp");
			dispatcher.forward(request, response);
	}

}
