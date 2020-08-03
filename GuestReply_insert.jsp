<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply_insert.jsp] </title>
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
	<%  //단독실행하면 에러
		  Gsabun = Integer.parseInt(request.getParameter("idx1"));
		  writer  = request.getParameter("idx2");	  
		  content = request.getParameter("idx3");	  
		  
		  try{
		  	msg="insert into guestreply values(guestreply_seq.nextval,?,?,?)";
	   		PST = CN.prepareStatement(msg);
	   			PST.setString(1, writer);
	   			PST.setString(2, content);
	   			PST.setInt(3, Gsabun);
	   		PST.executeUpdate(); //진짜저장
	   		System.out.println("GuestSQL자바문서 dbInsert(dto)함수  저장성공\n");	    
		    } catch (Exception e){
		       System.out.println("[GuestWriteSave.jsp] 에러 사유 : " + e);
		       e.printStackTrace();}
		   response.sendRedirect("GuestDetail.jsp?idx=" + Gsabun);
	 %>
</body>
</html>


