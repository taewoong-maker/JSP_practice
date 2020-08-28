<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply_delete.jsp] </title>
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
	<script type="text/javascript">
		var result = confirm("삭제하시겠습니까?");
		if(result){	
			<%
				String data = request.getParameter("idx");
				try{
					msg = "delete from guestreply where num = " +data;
					ST=CN.createStatement();
					ST.executeUpdate(msg);		
					System.out.println(data + " 데이터 삭제처리 성공했습니다");
				}catch(Exception e){
					System.out.println(e);
				}
			%>				
		}else{
			<%System.out.println("삭제nono");%>
			location.href="GuestDetail.jsp";
			}		
	</script>
	
</body>
</html>


