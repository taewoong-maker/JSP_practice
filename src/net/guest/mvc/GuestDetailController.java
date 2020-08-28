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

@WebServlet("/gdetail.do")
public class GuestDetailController extends HttpServlet {
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
			
			String sabun = request.getParameter("idx");
//			System.out.println("gdetail.do 문서 넘어온 sabun1 = " + sabun);
			if(sabun==""||sabun==null) {
				sabun=(String)request.getAttribute("idx");
//				System.out.println("gdetail.do 문서 넘어온 sabun2 = " + sabun);
			};
			
			GuestDTO dto = new GuestDTO();
			GuestSQL gs = new GuestSQL();
			dto=gs.dbDetail(sabun);	
			
			int hit = gs.dbHit(sabun);
			gs.dbHitUpdate(sabun, hit+1);
						
			request.setAttribute("sabun", sabun);
	    request.setAttribute("dto", dto); //response.sendredirect 하면 에러!
	    
	    RequestDispatcher dis=request.getRequestDispatcher("greply.do");
			dis.include(request, response);	 
			
			RequestDispatcher dis1=request.getRequestDispatcher("GuestDetail.jsp");			
			dis1.include(request, response);
			
		}//User end
}//end
