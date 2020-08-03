<%@page import="java.util.ArrayList"%>
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
	GuestDTO d = sql.dbDetail(request.getParameter("idx"));	
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
      		 <jsp:param  name="Ridx" value="<%=d.getSabun()%>" />
    	</jsp:include>

		
		
		
</body>
</html>