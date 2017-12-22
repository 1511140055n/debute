

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Body;
import model.CalcArea;
import model.CalcBmi;
import model.Circle;

/**
 * Servlet implementation class bmi
 */
@WebServlet("/bmi")
public class bmi extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public bmi() {
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
		String t =  request.getParameter("t");
		String w =  request.getParameter("w");
		String btn =  request.getParameter("btn");
		if("計算".equals(btn)){
			Body b = new Body(Integer.parseInt(t), Integer.parseInt(w));

			CalcBmi ca = new CalcBmi();
			ca.calc(b);

			request.setAttribute("bmi", b);
			RequestDispatcher dispatcher = request.getRequestDispatcher("bmiResult.jsp");
			dispatcher.forward(request, response);
		}
	}

}
