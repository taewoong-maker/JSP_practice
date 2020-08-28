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
<p>
	
<%		
	  Gsabun = Integer.parseInt(request.getParameter("sabun"));
	  writer  = request.getParameter("writer");	  
	  content = request.getParameter("content");	  
	  num = Integer.parseInt(request.getParameter("num"));
	  try{
	  		msg="update guestreply set writer=?, content=? where num = ?";	 							
  			PST = CN.prepareStatement(msg);
			PST.setString(1, writer);
			System.out.println(writer);
			PST.setString(2, content);
			System.out.println(content);
			PST.setInt(3, num);
			System.out.println(num);
  			PST.executeUpdate(); //진짜저장  		  		
  			System.out.println("GuestReply_edit.jsp 수정성공\n");	    
	    } catch (Exception e){
	       System.out.println("[GuestReply_edit.jsp] 에러 사유 : " + e);
	       e.printStackTrace();}
	   response.sendRedirect("GuestDetail.jsp?idx=" + Gsabun);
%>			
	
</body>
</html>


