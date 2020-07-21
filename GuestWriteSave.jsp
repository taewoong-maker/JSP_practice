<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestWriteSave.jsp]</title>
<style>
	*{
		font-size: 20pt
	}
	table{
		border: 1px solid;
	}
	tr{
		border: 1px solid;
	}
	td{
		border: 1px solid;
		border-width: 0px;
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
	<p>
<%
	//단독실행하면 에러
	Gsabun= Integer.parseInt(request.getParameter("sabun"));
	Gname=request.getParameter("name");	
	Gtitle=request.getParameter("title");
	Gpay=  Integer.parseInt(request.getParameter("pay"));
	Gemail=request.getParameter("email");
	out.println("사번=" + Gsabun + "<br>");
	out.println("이름=" + Gname + "<br>");
	out.println("제목=" + Gtitle + "<br>");
	out.println("급여=" + Gpay + "<br>");
	out.println("메일=" + Gemail + "<br>");
	
	//statement명령어로 일단 쿼리문 작성
	try{
		msg="insert into guest values(?,?,?,sysdate,?,0,?)";
				
		PST=CN.prepareStatement(msg);
		PST.setInt(1, Gsabun);
		PST.setString(2, Gname);
		PST.setString(3, Gtitle);
		PST.setInt(4, Gpay);
		PST.setString(5, Gemail);
		PST.executeUpdate();	
     	//ST=CN.createStatement();
		//msg="insert into guest("
		///		+"sabun, name, title, wdate, pay, hit, email)"
		//		+"values("
			//	+Gsabun+",'"+Gname+"','"+Gtitle+"',sysdate,"
			//			+Gpay+",0,'"+Gemail+"')"; 

		System.out.println(msg);
		out.println(msg);
	}catch(Exception e){
		out.println(e);
		System.out.println(e);
	}
	
	
	
	//저장성공 후 전체출력화면으로 이동
	//response.sendRedirect("GuestList.jsp");
%>
<br>
		<a href="GuestWrite.jsp"> [등록] </a>		
		<a href="index.jsp"> [index] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>