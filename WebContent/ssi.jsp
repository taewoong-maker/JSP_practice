<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.guest.sql.GuestSQL"%>
<%@ page import="net.guest.sql.GuestDTO"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
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
</style>
<script type="text/javascript"></script>
</head>
<body>
	<%!Connection CN;
		Statement ST, ST2, ST3;
		PreparedStatement PST;
		CallableStatement CST;
		ResultSet RS, RS2, RS3;
		
		int Gsabun, Gpay, Ghit;
		int Gtotal, RGtotal;//전체레코드 개수
		int GStotal;//조회개수
		
		String Gname, Gtitle, Gemail;
		java.util.Date Gwdate;	
		String msg, msg3;	
		String Gdata;
		
	  //댓글관련전역변수
	  int Rrn, Rnum, Rsabun, num;
	  String Rwriter, Rcontent ;
	  String content, writer;
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

// 	//자바클래스 객체화
	GuestSQL sql = new GuestSQL();
	GuestDTO dto = new GuestDTO();
%>	
</body>
</html>