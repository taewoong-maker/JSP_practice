<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestUpdate_Edit.jsp]</title>
<style>
	
</style>
<script type="text/javascript"></script>
</head>

<body>
	<p>
<%
	//단독실행하면 에러. 받아온 값이 없기 때문.
	Gsabun= Integer.parseInt(request.getParameter("sabun"));
	Gname=request.getParameter("name");	
	Gtitle=request.getParameter("title");
	Gpay=  Integer.parseInt(request.getParameter("pay"));
	Gemail=request.getParameter("email");
	
	try{
		msg="update guest set name=?, title=?, pay=?, email=?"
				+"where sabun = " + Gsabun;
							
		//PreparedStatement명령어로
		PST=CN.prepareStatement(msg);
		PST.setString(1, Gname);
		PST.setString(2, Gtitle);
		PST.setInt(3, Gpay);
		PST.setString(4, Gemail);
		PST.executeUpdate();	
		
	}catch(Exception e){
		System.out.println(e);
	}
	
	//저장성공 후 전체출력화면으로 이동
	response.sendRedirect("GuestList.jsp");
%>
<br>
		<a href="GuestWrite.jsp"> [등록] </a>		
		<a href="index.jsp"> [index] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>