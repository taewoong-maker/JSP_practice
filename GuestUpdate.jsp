<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestUpdate.jsp]</title>
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
	RS.next();
%>
	수정화면
	<form method="get" action="GuestUpdate_Edit.jsp" >
		사번 : <input type="text" name="name"
		 value="<%=RS.getString("sabun")%>(수정불가)" readonly><br>
		이름 : <input type="text" name="name" value="<%=RS.getString("name")%>"><br>
		제목 : <input type="text" name="title" value="<%=RS.getString("title")%>"><br>
		급여 : <input type="text" name="pay" value="<%=RS.getInt("pay")%>"><br>
		메일 : <input type="email" name="email" value="<%=RS.getString("email")%>"><br>		
			 <input type="submit" value="수정하기">
			 <input type="button" value="뒤로가기">
	</form>
</body>
</html>