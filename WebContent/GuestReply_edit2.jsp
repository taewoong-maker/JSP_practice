<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply_edit.jsp] </title>
	<style type="text/css">
	  *{ font-size: 16pt; font-weight: bold; }
	  a{ font-size: 16pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 18pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	  #rsave{
	    font-size: 26pt; font-weight: bold;
	    background:lightgreen;   height:130px;
	  }
	</style>

</head>
<body>
	<%
		Gdata = request.getParameter("idx");
		System.out.println("넘어온 댓글번호 = " + Gdata);
		msg="select * from guestreply where num = " + Gdata;
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		RS.next();
	%>
	수정화면
	<form method="get" action="GuestReply_editSave.jsp" >
		넘버 : <input type="text" name="num" value="<%=RS.getInt("num")%>" readonly><br>
		저자 : <input type="text" name="writer" value="<%=RS.getString("writer")%>"><br>
		내용 : <input type="text" name="content" value="<%=RS.getString("content")%>"><br>
		사번 : <input type="text" name="sabun" value="<%=RS.getInt("sabun")%>" readonly><br>
			
			 <input type="submit" value="수정하기">
			 <input type="button" value="뒤로가기">
	</form>
	
	
	
</body>
</html>


