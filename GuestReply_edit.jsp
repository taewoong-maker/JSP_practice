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
	GuestDTO d = sql.dbDetail(request.getParameter("idx2"));	
	int a = Integer.parseInt(request.getParameter("idx"));
%>		
	<table width=700px cellspacing="0">
		
		<tr>
			<td colspan="2" class="sabun">
				사번 : <%=d.getSabun() %>
			</td>			
		</tr>
		<tr>
			<td rowspan="5">
				<img alt="" src="images\bear.jpg">
			</td>
			<td>
				이름 : <%=d.getName() %> 
			</td>			
		</tr>
		<tr>
			<td >
				제목 : <%=d.getTitle() %> 
			</td>
		</tr>
		<tr>
			<td >
				급여 : <%=d.getPay() %> 
			</td>
		</tr>
		<tr>
			<td >
				조회수 : <%=d.getHit()%>
			</td>
		</tr>
		<tr>
			<td >
				이메일 : <%=d.getEmail() %> 
			</td>
		</tr>
	</table>
	
	 <!-- 댓글문서포함 Guest_reply.jsp -->
		<jsp:include page="GuestReply.jsp">
<%--       		 <jsp:param  name="Ridx" value="<%=d.getSabun()%>" /> --%>
      		 <jsp:param  name="Ridx" value="<%=a%>" />
    	</jsp:include>

	
	
</body>
</html>


