<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply_editSave.jsp] </title>
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
		num=Integer.parseInt(request.getParameter("num"));
		writer=request.getParameter("writer");	
		content=request.getParameter("content");
		Gsabun=Integer.parseInt(request.getParameter("sabun"));
//  		Gdata=request.getParameter("sabun");
		
		try{
			msg="update guestreply set writer=?, content=? where num = "
				 + num;
								
			//PreparedStatement명령어로
			PST=CN.prepareStatement(msg);
			PST.setString(1, writer);
			PST.setString(2, content);
			PST.executeUpdate();				
		}catch(Exception e){
			System.out.println(e);
		}
		
		//저장성공 후 전체출력화면으로 이동
		response.sendRedirect("GuestDetail.jsp?idx=" + Gsabun);
	
	%>
</body>
</html>


