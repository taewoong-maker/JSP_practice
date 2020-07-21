<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestDetail.jsp]</title>
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
	String data = "7700";
	msg="select * from guest where sabun = " + data;
	ST=CN.createStatement();
	RS=ST.executeQuery(msg);
%>	
	
	<table width=900>
		<tr bgcolor="yellow">
			 <td>사번</td> <td>이름</td> <td>제목</td> <td>날짜</td><td>히트</td>
		</tr>
		<%
		while(RS.next()==true){
			Gsabun=RS.getInt("sabun");
			Gtitle=RS.getString("title");
		%>
		<tr>
			 <td><%=Gsabun %></td>
			 <td><%=RS.getString("name") %></td>
			 <td><%=RS.getString("title") %></td>
			 <td><%=RS.getDate("wdate") %></td>
			 <td><%=RS.getInt("hit") %></td>
		</tr>
		<%	} %>
	</table>
	
	<br>
		<a href="GuestWrite.jsp"> [등록] </a>		
		<a href="index.jsp"> [index] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>