<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestDetail.jsp]</title>
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
	<p>
	
<%
	Gdata = request.getParameter("idx");
	System.out.println("넘어온 Gsabun = " + Gdata);
	msg="select * from guest where sabun = " + Gdata;
	ST=CN.createStatement();
	RS=ST.executeQuery(msg);
%>		
	<table width=700px cellspacing="0">
		
		<%
		while(RS.next()==true){
			Gtitle=RS.getString("title");
		%>	
		<tr>
			<td colspan="2" class="sabun">
				사번 : [<%=RS.getInt("sabun") %>]
			</td>			
		</tr>
		<tr>
			<td rowspan="5">
				<img alt="" src="images\bear.jpg">
			</td>
			<td>
				이름 : <%=RS.getString("name")  %> 
			</td>			
		</tr>
		<tr>
			<td >
				제목 : <%=RS.getString("title") %> 
			</td>
		</tr>
		<tr>
			<td >
				날짜 : <%=RS.getDate("wdate")  %> 
			</td>
		</tr>
		<tr>
			<td >
				급여 : <%=RS.getInt("pay")%>
			</td>
		</tr>
		<tr>
			<td >
				이메일 : <%=RS.getString("email") %> 
			</td>
		</tr>
		<%} %>
	</table>
	
	<br>
		<a href="GuestUpdate.jsp?idx=<%=Gdata%>"> [수정] </a>
		<a href="GuestWrite.jsp"> [등록] </a>
		<a href="GuestDelete.jsp?idx=<%=Gdata%>"> [삭제] </a>
		<a href="index.jsp"> [index] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>