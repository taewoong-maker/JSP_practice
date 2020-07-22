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
	
	<script type="text/javascript">
	var result = confirm("삭제하시겠습니까?");
	if(result){
		<%
			try{ //삭제하는 쿼리
				Gdata = request.getParameter("idx");
				System.out.println("넘어온 Gsabun = " + Gdata);
				msg="delete from guest where sabun = " + Gdata;
				ST=CN.createStatement();
				ST.executeUpdate(msg);
				System.out.println("데이터 삭제 성공 했습니다.");	
			} catch (Exception e){
				System.out.println(e);
			}
			//response.sendRedirect("GuestList.jsp");
		%>
		location.href="index.jsp";
	}else{
		location.href="GuestList.jsp";
	}
	</script>
	
	
	
</body>
</html>