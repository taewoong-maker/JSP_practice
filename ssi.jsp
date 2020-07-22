<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	*{
		font-size: 20pt
	}
	table{
		border: 1px solid;
		cellspacing:"0";
		border:"1";
	}
	tr{
		border: 1px solid;
		
		collspaning:0;
	}
	
	td{
		border: 1px solid;
		collspaning:0;
	}
	a{
		text-decoration: none;
		color: green;
	}
	a:hover{
		font-size: 22pt;
		color: blue;
	}
</style>
<script type="text/javascript"></script>
</head>
<body>
<%!
	Connection CN;
	Statement ST;
	PreparedStatement PST;
	CallableStatement CST;
	ResultSet RS;
	
	int Gsabun, Gpay, Ghit;
	int Gtotal=270;//전체레코드 개수
	int GStotal=0;//조회개수
	
	String Gname, Gtitle, Gemail;
	java.util.Date Gwdate;	
	String msg;	
	String Gdata;
%>

<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이브로드
   		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
    	CN=DriverManager.getConnection(url,"system","1234");
   	    //System.out.println("오라클연결성공success");
	}catch(Exception e){
		out.println(e);
		System.out.println(e);
	}
%>	
</body>
</html>