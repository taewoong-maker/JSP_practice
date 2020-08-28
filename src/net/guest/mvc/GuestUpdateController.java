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

@WebServlet("/gupdate.do")//��¥�̸�!! GuestInsertController ��� ginsert.do ���
public class GuestUpdateController extends HttpServlet {
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
			out.println("<h2>GuestUpdateController.java</h2>");
			
			GuestDTO dto = new GuestDTO();
			dto.setSabun(Integer.parseInt(request.getParameter("sabun")));
			dto.setName(request.getParameter("name"));
			dto.setTitle(request.getParameter("title"));
			dto.setPay(Integer.parseInt(request.getParameter("pay")));
			dto.setEmail(request.getParameter("email"));
			
			GuestSQL gs = new GuestSQL();
			gs.dbUpdate(dto);

			RequestDispatcher dis=request.getRequestDispatcher("glist.do");
			dis.forward(request, response);
		}//User end
}//end
