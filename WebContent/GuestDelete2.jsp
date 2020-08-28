<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@page import="net.guest.sql.GuestSQL"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestDelete2.jsp]</title>
<style>
	tr:nth-child(1) {
	text-align:center;	
	}
	tr:nth-child(2) td:nth-child(1) {
	text-align:center;	
	}
	.sabun{
	background-color: lightgray;
	}
	td{
	padding:7px;
	}
</style>
<script type="text/javascript"></script>
</head>
<body>	
		<%
			try{ //삭제하는 쿼리
				Gdata = request.getParameter("idx");
				System.out.println("넘어온 Gsabun = " + Gdata);
				sql.dbDelete(Gdata);
			} catch (Exception e){
				System.out.println(e);
			}
			response.sendRedirect("GuestList.jsp");
		%>	
</body>
</html>