<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>

<%@ page import="net.tis.sql.GuestDTO" %>
<%@ page import="net.tis.sql.GuestSQL" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestTest.jsp]  </title>
  <style type="text/css">
   
	*{ font-size: 20pt; }
	a{ font-size: 18pt; color:blue; text-decoration:none; }
	a:hover{ font-size:20pt; color:green;  text-decoration:none;  }
  </style>

</head>
<body>
	<%	
	GuestSQL sql = new GuestSQL(); 
	GuestDTO dto = new GuestDTO();	
	  //2400 "스프링"  3.14  true  'F' ; 
	ArrayList<GuestDTO> al = sql.test();
	GuestDTO d = al.get(0);
	out.println(d.getSabun());
	out.println(d.getName());
	out.println(d.getPoint());
	out.println(d.getGender());
	out.println(d.getGrade());
	%>

</body>
</html>












