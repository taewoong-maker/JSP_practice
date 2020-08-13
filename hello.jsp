<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head><title>[hello.jsp]</title> </head>
<body>
<%
   //out.println사용금지
   String data=request.getParameter("title");
   if(data=="hb" || data.equals("hb")){
%>	   
	<font size=6 color=blue>
	<b><%= data %> 로그인 성공!!! </b>
	</font><br>
	<img src="images/bt_login.gif" width=250 height=50>

<%	   
   }else{response.sendRedirect("index.jsp"); } 
%>
 
</body>
</html>