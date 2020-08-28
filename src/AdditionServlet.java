import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;
import javax.websocket.Session;

@WebServlet("/AdditionServlet")
public class AdditionServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)	throws ServletException, IOException {
	
		int num1=20;
		int num2=10;
		int add = num1 + num2;
		
		request.setAttribute("num1", num1);
		request.setAttribute("num2", num2);
		request.setAttribute("add", add);
		
		RequestDispatcher disp =
				request.getRequestDispatcher("07_addition.jsp");
		disp.forward(request, response);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
