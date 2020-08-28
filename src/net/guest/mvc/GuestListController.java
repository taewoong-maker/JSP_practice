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

@WebServlet("/glist.do")//  ¥ ̸ !! GuestInsertController     ginsert.do    
public class GuestListController extends HttpServlet {
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
         
         String Gdata;
          
           //댓글관련전역변수
         int Rrn, Rnum, Rsabun ;
         String Rwriter, Rcontent ;
         int Rcnt ; //댓글갯수표시
         
         String skey , sval, squery;
         String returnpage, pnum;
         int start, end, pageNUM, pagecount, startpage, endpage ;
         int tmp;          
         
         response.setContentType("text/html; charset=UTF-8"); 
         PrintWriter out = response.getWriter();
         out.println("<h2>GuestListController.java</h2>");
         
         GuestSQL gs = new GuestSQL();
         GuestDTO dto = new GuestDTO();         
         
         skey=request.getParameter("keyfield");
         sval=request.getParameter("keyword");
         if(skey==""||skey==null||sval==""||sval==null) {
        	 skey="name";
        	 sval="";
        	 squery = " where "+skey+" like '%"+sval+"%' ";
         }else {
        	 squery = " where "+skey+" like '%"+sval+"%' ";
         }
         returnpage = "&keyfield="+skey+"&keyword="+sval;
         
         pnum = request.getParameter("pageNum");
         
         if(pnum==null||pnum=="")   pnum="1";
         pageNUM = Integer.parseInt(pnum);
         
         start = (pageNUM-1)*10 +1;
         end = start + 9;
         
         int Gtotal = gs.dbGtotal(skey,sval);
         
         if(Gtotal%10==0)   pagecount = Gtotal/10;
         else {pagecount = (Gtotal/10)+1;}
         
         tmp = (pageNUM-1)%10;
         startpage = pageNUM-tmp;
         endpage = startpage+9;
         if(endpage>pagecount) {endpage=pagecount;}         
         
         ArrayList<GuestDTO> LG = new ArrayList<GuestDTO>();
         
//         dto.setStart(start);
//         dto.setEnd(end);
//         ArrayList<GuestDTO> LG = new ArrayList<GuestDTO>();//처음원본
         
         LG = gs.dbSelect(dto, start, end,squery);         
         
         request.setAttribute("LG", LG);
         request.setAttribute("Gtotal", Gtotal);
         request.setAttribute("startpage", startpage);
         request.setAttribute("endpage", endpage);
         request.setAttribute("pagecount", pagecount);
         request.setAttribute("pageNUM", pageNUM);
         request.setAttribute("returnpage", returnpage);
         request.setAttribute("skey", skey);
         System.out.println("skey:"+skey);
         request.setAttribute("sval", sval);
         System.out.println("sval:"+sval);
         
         RequestDispatcher dis = request.getRequestDispatcher("GuestList.jsp");
         dis.forward(request, response);
         
      }//User end
}//end