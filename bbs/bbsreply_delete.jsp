<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [bbsreply_delete.jsp]</title></head>
<body>
 <%
  int Dsabun=Integer.parseInt(request.getParameter("idx"));
  int Dnum=Integer.parseInt(request.getParameter("num"));
  msg="delete from bbsreply where br_num="+Dnum;
  ST=CN.createStatement();
  ST.executeUpdate(msg);
  response.sendRedirect("bbsDetail.jsp?idx="+Dsabun);
 %>
  
</body>
</html>


















