<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		*{font-size: 24pt;}
		a{font-size: 28pt; text-decoration: none; color: blue;}
		a:hover{font-size: 34pt; text-decoration: line-through; color: green;}
		div{
			align-items: center;
		}
	</style>
</head>
<body>
	BBB.jsp 문서 데이터 받아요<p>
	<%!
		String Guser="kim";
		int Gsal=7800;
	%>
	<%
		Guser=request.getParameter("idx");
		Gsal=Integer.parseInt(request.getParameter("idx2"));
	%>
	넘어온유저 : <%=Guser %> <br>
	넘어온샐러리 :<%=Gsal %> <br>
	
	<div>
	<a href="AAA.jsp">[AAA]</a>
	<a href="index.jsp">[index]</a>
	<a href="GuestWrite.jsp">[등록]</a>
	<a href="GuestList.jsp">[출력]</a>
	<p>
	<img src="images/bar.gif"><br>
	<img src="images/bar.gif"><br>
	<img src="images/bar.gif"><br>
	</div>
</body>
</html>
