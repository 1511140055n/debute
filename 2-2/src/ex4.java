

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CalcArea;
import model.Circle;

/**
 * Servlet implementation class ex4
 */
@WebServlet("/ex4")
public class ex4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ex4() {
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
		String r =  request.getParameter("r");
		String btn =  request.getParameter("btn");
		if("計算".equals(btn)){
			Circle c = new Circle(Integer.parseInt(r));

			CalcArea ca = new CalcArea();
			ca.execute(c);

			request.setAttribute("areas", c);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ex4result.jsp");
			dispatcher.forward(request, response);
		}
	}
}
