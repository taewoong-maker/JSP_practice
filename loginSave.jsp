<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="ssi.jsp" %>

<html>
<head><title> [loginSave.jsp] </title></head>
<body>		
<%
  
  String usera=request.getParameter("UID");
  String userb=request.getParameter("UPWD");
  msg="select count(*) as cnt from login where userid=? and pwd=? ";
  System.out.println( "loginSave.jsp " + msg);
  PST=CN.prepareStatement(msg);
  	PST.setString(1, usera);
  	PST.setString(2, userb);
  RS=PST.executeQuery(); 
  RS.next(); Gtotal=RS.getInt("cnt");
		  
  if(Gtotal>0){
  %>
   <font size=7 color=blue>
     <b><%= usera %>님 로그인 성공!!!</b> <br>
   </font><p>
	<img src="images/bt_login.gif" width=450 height=70><p>
	<img src="images/bar.gif" width=450 >
 <%  
  }else{
    //response.sendRedirect("login.jsp");
    out.println("<font size=7 color=red><b></b>"+usera+"님 로그인실패</font><p>");
    out.println("<font size=7><a href='login.jsp'>[로그인]</a></font>");
    out.println("<font size=7><a href='index.jsp'>[index]</a></font>");	
  }
%>
	
</body>
</html>





