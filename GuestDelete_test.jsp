<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestDelete.jsp]</title>
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

<jsp:useBean id="dao" class="net.tis.sql.GuestSQL"> </jsp:useBean>

	<%
		String temp =(String)session.getAttribute("naver");
		if(temp==null||temp==""){
	%>
	<script type="text/javascript">
      alert("삭제 권한이 없습니다. 로그인하세요.");
      location.href="login.jsp"
    </script>
    <%
  		 }else{
		String data = request.getParameter("idx");
		dao.dbDelete(data);
	%>
		<script type="text/javascript">
			location.href="GuestList.jsp"
		</script>
	<% }%>
	
</body>
</html>