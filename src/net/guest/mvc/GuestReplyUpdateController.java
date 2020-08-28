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
import net.guest.sql.ReplyDTO;
import net.guest.sql.ReplySQL;

@WebServlet("/greplyUpdate.do")//��¥�̸�!! GuestInsertController ��� ginsert.do ���
public class GuestReplyUpdateController extends HttpServlet {
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
			out.println("<h2>GuestReplyUpdateController.java</h2>");
			
			ReplyDTO rdto = new ReplyDTO();
			rdto.setNum(Integer.parseInt(request.getParameter("num")));
			rdto.setWriter(request.getParameter("writer"));
			rdto.setContent(request.getParameter("content"));
			rdto.setSabun(Integer.parseInt(request.getParameter("sabun")));
			
			ReplySQL rs = new ReplySQL();
			rs.dbReUpdate(rdto);

			request.setAttribute("idx", request.getParameter("sabun"));
			
			RequestDispatcher dis=request.getRequestDispatcher("gdetail.do");
			dis.forward(request, response);
		}//User end
}//end
