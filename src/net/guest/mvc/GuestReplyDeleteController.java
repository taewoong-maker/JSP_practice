package net.guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.guest.sql.GuestDTO;
import net.guest.sql.GuestSQL;

@WebServlet("/greplyDelete.do")
public class GuestReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		out.println("<h2>GuestReplyDeleteController.java</h2>");
		
		GuestSQL gs = new GuestSQL();
		String num = request.getParameter("idx1");
		String sabun = request.getParameter("idx2");
//		System.out.println("greplyDelete.do 보낼 sabun = "+sabun);
		gs.dbReDelete(num);
		
		request.setAttribute("idx", sabun);
		
		RequestDispatcher dis=request.getRequestDispatcher("gdetail.do");
		dis.forward(request, response);	 
		
	}

}
