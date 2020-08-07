<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssi.jsp</title>
</head>
<body>
<%!
	Connection CN, CN2, CN3;
	Statement ST, ST1, ST2, ST3;
	PreparedStatement PST, PST2, PST3;
	ResultSet RS,RS1, RS2, RS3;
	String msg, msg2, msg3;
	String name, identity, pass, juso1, juso2, id, content, title, code;
	String Rwriter;
	Date  dt = new Date();
	Date birth;
	String url, file, size;
	int Gtotal, Stotal, Rtotal, Rnum, tel;
	String pnum;//페이지 번호를 문자로 읽어들임
	int pageNUM, pagecount; // 숫자로 변환, 총페이지 수 
	int start, end;
	int startpage, endpage;
	int tmp; 

%>

<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system", "1234");
   }catch(Exception ex){System.out.println("ssi.jsp 문서 db에러:"+ex);}
%>
</body>
</html>