<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mov_Insert.jsp</title>
</head>
<body>

<%
	name = request.getParameter("name");
	id = request.getParameter("identity");
	pass = request.getParameter("pass");
	juso1 = request.getParameter("juso1");
	juso2 = request.getParameter("juso2");
	tel = Integer.parseInt(request.getParameter("tel"));
	
	msg = "insert into mov_guinfo values (?,?,?,?,?,sysdate,?)";
	PST = CN.prepareStatement(msg);
	PST.setString(1,id);
	PST.setString(2,pass);
	PST.setString(3,name);
	PST.setString(4,juso1);
	PST.setString(5,juso2);
	PST.setInt(6, tel);
	PST.executeUpdate();
	System.out.println("사번으로 mov_guinfo 테이블 저장성공");
	response.sendRedirect("mov_logIn.html");
%>

</body>
</html>