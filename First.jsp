<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Date dt = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
dt = sdf.parse("20201212");
System.out.println(dt);
%>
</body>
</html>