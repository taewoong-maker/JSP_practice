package net.guest.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.guest.sql.ReplyDTO;
import net.guest.sql.ReplySQL;

@WebServlet("/greplyInsert.do")//��¥�̸�!! GuestInsertController ��� ginsert.do ���
public class GuestReplyInsertController extends HttpServlet {
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
			//<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<h2>GuestInsertController.java</h2>");
			out.println("<img src='images/bar.gif'>");
			
			ReplyDTO rdto = new ReplyDTO();
			ReplySQL rs = new ReplySQL();
			
			int Rsabun=Integer.parseInt(request.getParameter("sabun"));
	    String Rwriter=request.getParameter("writer");
	    String Rcontent=request.getParameter("content");
	    
	    System.out.println("넘어온 데이터 : "+Rsabun + " "
	    				+ Rwriter + " " + Rcontent);
	    
	    rdto.setSabun(Rsabun);
	    rdto.setWriter(Rwriter);
	    rdto.setContent(Rcontent);
	    
	    rs.dbReInsert(rdto);
	    
	    request.setAttribute("idx", request.getParameter("sabun"));
	    RequestDispatcher dis=request.getRequestDispatcher("gdetail.do");
			dis.forward(request, response);
//			RequestDispatcher�� �������ڿ��� ���� ������ �����
//			RequestDispatcher dis=request.getRequestDispatcher("GuestList.jsp");//8/25 11:11 ������ �Ⱦ��� �̸� �����.
//			dis.forward(request, response);
		}//User end
}//end
