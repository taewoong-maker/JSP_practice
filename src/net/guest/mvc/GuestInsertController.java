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

@WebServlet("/ginsert.do")//��¥�̸�!! GuestInsertController ��� ginsert.do ���
public class GuestInsertController extends HttpServlet {
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
			response.setContentType("text/html); charset=UTF-8"); //�ѱ� �ȱ�����!!
			PrintWriter out = response.getWriter();
			out.println("<h2>GuestInsertController.java</h2>");
			out.println("<img src='images/bar.gif'>");
			
			GuestDTO dto = new GuestDTO();
			GuestSQL gs = new GuestSQL();
			
			int Gsabun=Integer.parseInt(request.getParameter("sabun"));
	    String Gname=request.getParameter("name");
	    String Gtitle=request.getParameter("title");
	    int Gpay=Integer.parseInt(request.getParameter("pay"));
	    String Gemail=request.getParameter("email");
	    System.out.println(Gsabun + " " + Gname + " " + Gtitle + " " + Gpay + " " + Gemail);
	    
	    dto.setSabun(Gsabun);
	    dto.setName(Gname);
	    dto.setTitle(Gtitle);
	    dto.setPay(Gpay);
	    dto.setEmail(Gemail);
	    gs.dbInsert(dto);
	    System.out.println("���强��");//�ܵ����� ����!
	    response.sendRedirect("glist.do");
	    
//			RequestDispatcher�� �������ڿ��� ���� ������ �����
//			RequestDispatcher dis=request.getRequestDispatcher("GuestList.jsp");//8/25 11:11 ������ �Ⱦ��� �̸� �����.
//			dis.forward(request, response);
		}//User end
}//end
