package net.guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.guest.sql.GuestDTO;
import net.guest.sql.GuestSQL;

@WebServlet("/greply.do")
public class GuestReplyController extends HttpServlet {
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
			out.println("<h2>GuestDetailController.java</h2>");
					
			String Sabun = (String)request.getAttribute("sabun");
			GuestSQL gs = new GuestSQL();
			ArrayList<GuestDTO> al = gs.dbReSelect(Sabun);
			
	    request.setAttribute("al", al);
			
//	    RequestDispatcher dis=request.getRequestDispatcher("GuestReply.jsp");
//			dis.include(request, response);
		}//User end
}//end
