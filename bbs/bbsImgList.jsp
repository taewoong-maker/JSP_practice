<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="./ssi.jsp" %>
<%@ include file="./top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [bbsImgList.jsp]</title>
  <style type="text/css">
    *{font-size:16pt; font-weight:bold;  font-family: Comic Sans MS ;}
    a{font-size:16pt; font-weight:bold;  text-decoration:none; }
    a:hover{font-size:16pt; font-weight:bold;  text-decoration:none; }     
    body{ background-color:#dddddd}  
  </style>
 </head>
 
<body>
<%!
	int start, end ; 
	int pagecount;  
	int pageNUM ;   
	int startpage, endpage; 
	String pnum;  
	int temp; 
%>

 <%
   msg="select count(*) as cnt from bbs where b_file1 IS NOT NULL"; //  
   ST=CN.createStatement();
   RS=ST.executeQuery(msg);
   if(RS.next()==true){
	 Gtotal=RS.getInt("cnt");   
   }
 %>

 <table width=1200 border=1 cellspacing=0 style="margin-left: auto; margin-right: auto;">  
 <%
     pnum=request.getParameter("pageNum");
     if(pnum==null || pnum==""){ pnum="1"; }
   
     pageNUM=Integer.parseInt(pnum);  
     start = Gtotal-(pageNUM-1)*5 - 4;
     end = Gtotal-(pageNUM-1)*5;
     
     if(Gtotal%5==0){ pagecount=Gtotal/5; }
     else{ pagecount=(Gtotal/5)+1; } 
   
     temp=(pageNUM-1)%5;
     startpage=pageNUM-temp; 
     endpage=startpage+4; 
     if(endpage>pagecount){ endpage=pagecount;} 
     
     msg="select * from (select rownum rn, b.* from bbs b where b_file1 is not null) where rn between "+start+" and "+end+ " order by b_wdate desc";
     ST=CN.createStatement();
     RS=ST.executeQuery(msg); 
     %>	 
     <tr>
     <%
	 while(RS.next()==true){
		   file=RS.getString("b_file1");
	 %>	   
	     <td>
	     <a href="filedownload.jsp?fileName=<%=file%>" class="tip">
	     <img src="../storage/<%=file%>" width=250 height=150>
	        from:<%=RS.getString("b_title")%><br>
	     	<%=RS.getString("b_wdate")%><br>
	     	작성자:<%=RS.getString("b_name")%><br>
	     </a>
	     </td>
	 <%  
	   }
 	 %>
 	</tr>

   <tr align="center" bgcolor="#C0DEF9">
   <td colspan="6">
     <%
      if(startpage>10){
     	out.println("<a href=bbsImgList.jsp?pageNum="+(startpage-10)+">[이전]</a>");   
       }
     %>
   
     <%
      for(int i=startpage; i<=endpage; i++){
   	   if(i==pageNUM){
   		out.println("<font style='font-size:18pt; color:red'>["+i+"]</font>");   
   	   }
   	   else{
   	    out.println("<a href=bbsImgList.jsp?pageNum="+i+">[" + i + "]</a>" );
   	   }
      }
     %> 
     
     <%
      if(endpage<pagecount){
   	out.println("<a href=bbsImgList.jsp?pageNum="+(startpage+10)+">[다음]</a>");   
      }
     %>
   </td>
  </tr>
 </table> 

</body>
</html>
