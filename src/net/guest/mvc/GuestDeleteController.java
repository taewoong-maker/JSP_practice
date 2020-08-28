package net.guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.guest.sql.GuestSQL;

@WebServlet("/gdelete.do")
public class GuestDeleteController extends HttpServlet {
		private static final long serialVersionUID = 1L;
	
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
			doUser(request, response);
			
		}//Get end
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
			doUser(request, response);
			
		}//Post end

		protected void doUser(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<h2>GuestDeleteController.java</h2>");
			
			String sabun = request.getParameter("idx");
			System.out.println("받아온 데이터 : " + sabun);
			
			GuestSQL gs = new GuestSQL();
			gs.dbDelete(sabun);	     
			
			response.sendRedirect("glist.do");
		}//User end
}//end
